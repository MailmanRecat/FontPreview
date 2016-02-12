//
//  ViewController.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "CFAsset.h"

#import "RootViewController.h"
#import "PreviewController.h"
#import "LanguageViewController.h"
#import "FTranslate.h"

@interface RootViewController()<UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchControllerDelegate>

@property( nonatomic, strong ) UISearchController   *searchController;
@property( nonatomic, strong ) UITableView *bear;
@property( nonatomic, strong ) NSIndexPath *indexPath;
@property( nonatomic, strong ) NSArray     *searchPool;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:[[FTranslate standarTranslate] stringFromString:FTTitleLang]];
    [self UI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(langChanged)
                                                 name:DidFontLanguageChangeNotification
                                               object:nil];
}

- (void)langChanged{
    self.navigationItem.leftBarButtonItem.title = [[FTranslate standarTranslate] stringFromString:FTItemLang];
    self.title = [[FTranslate standarTranslate] stringFromString:FTTitleLang];
    
    [self.bear reloadData];
}

- (void)UI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithWhite:51 / 255.0 alpha:1]];
    
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithTitle:[[FTranslate standarTranslate] stringFromString:FTItemLang]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(languageType)];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Favorite"
//                                                                              style:UIBarButtonItemStylePlain
//                                                                             target:nil
//                                                                             action:nil];
    self.searchController = ({
        UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
        searchController.dimsBackgroundDuringPresentation = NO;
        searchController.searchResultsUpdater = self;
        searchController.delegate = self;
        searchController;
    });
    
    self.definesPresentationContext = YES;
    
    self.bear = ({
        UITableView *bear = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        bear.translatesAutoresizingMaskIntoConstraints = NO;
        bear.showsHorizontalScrollIndicator = NO;
        bear.allowsMultipleSelectionDuringEditing = NO;
        bear.tableHeaderView = self.searchController.searchBar;
        bear.delegate = self;
        bear.dataSource = self;
        bear;
    });
    
    [self.view addSubview:self.bear];
    [self.bear.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.bear.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.bear.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.bear.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (void)willPresentSearchController:(UISearchController *)searchController{
    self.searchPool = [NSArray new];
    
    [self.bear reloadData];
}

- (void)didDismissSearchController:(UISearchController *)searchController{
    self.searchPool = nil;
    
    [self.bear reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationBottom];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    self.searchPool = [[CFonts shareFonts] searchFonts:searchController.searchBar.text];
    
    [self.bear reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 36.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 44.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if( self.searchPool )
        return self.searchPool.count;
    else
        return [[CFonts shareFonts] numberOfFonts];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"NUMBER_OF_FONTS"];
    if( header == nil ){
        header =  [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"NUMBER_OF_FONTS"];
        header.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    header.textLabel.text = [NSString stringWithFormat:@"%ld %@", [tableView numberOfRowsInSection:0], [[FTranslate standarTranslate] stringFromString:FTLangsType]];
    
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const TABLEVIEW_CELL_ID = @"TABLEVIEW_CELL_ID_FOR_LANG";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_ID];
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLEVIEW_CELL_ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    CFAsset asset;
    if( self.searchPool && self.searchPool.count != 0 ){
        asset = [[CFonts shareFonts] CFAssetAtIndex:[((NSArray *)self.searchPool[indexPath.row]).lastObject integerValue]];
    }else{
        asset = [[CFonts shareFonts] CFAssetAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = [NSString stringWithUTF8String:asset.name];
    cell.textLabel.font = [UIFont fontWithName:[NSString stringWithFormat:@"%s", asset.introName] size:17];

    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if( self.searchController.active && self.searchPool.count != 0 ){
        [self.searchController.searchBar resignFirstResponder];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    if( self.indexPath ){
        [self.bear deselectRowAtIndexPath:self.indexPath animated:YES];
        self.indexPath = nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;

    dispatch_async(dispatch_get_main_queue(), ^{
        
        CFonts        *f = [CFonts shareFonts];
        FontAsset *asset = [f fontAssetFronCFAsset:[f CFAssetAtIndex:indexPath.row]];
        
        [self.navigationController pushViewController:[[PreviewController alloc] initWithFontAsset:asset
                                                                                              lang:[FontsManager shareManager].lang]
                                             animated:YES];
        
    });
}

- (void)languageType{
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[LanguageViewController alloc] init]]
                       animated:YES
                     completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
