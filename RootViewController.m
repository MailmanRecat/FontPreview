//
//  ViewController.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "FontsManager.h"

#import "RootViewController.h"
#import "PreviewController.h"
#import "LanguageViewController.h"

@interface RootViewController()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) UISearchController *searchController;
@property( nonatomic, strong ) UITableView *bear;
@property( nonatomic, strong ) NSIndexPath *indexPath;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self UI];
}

- (void)UI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithWhite:51 / 255.0 alpha:1]];
    
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithTitle:@"English"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(languageType)];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Favorite"
//                                                                              style:UIBarButtonItemStylePlain
//                                                                             target:nil
//                                                                             action:nil];
    
//    self.searchController = ({
//        UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//        searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
//        searchController;
//    });
    
//    self.definesPresentationContext = YES;
    
    self.bear = ({
        UITableView *bear = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        bear.translatesAutoresizingMaskIntoConstraints = NO;
        bear.showsHorizontalScrollIndicator = NO;
        bear.showsVerticalScrollIndicator = NO;
        bear.sectionFooterHeight = 0.0f;
        bear.allowsMultipleSelectionDuringEditing = NO;
//        bear.tableHeaderView = self.searchController.searchBar;
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 36.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [FontsManager shareManager].fonts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const TABLEVIEW_CELL_ID = @"TABLEVIEW_CELL_ID_FOR_LANG";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_ID];
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLEVIEW_CELL_ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = ((FontAsset *)[FontsManager shareManager].fonts[indexPath.row]).name;
    cell.textLabel.font = ((FontAsset *)[FontsManager shareManager].fonts[indexPath.row]).font;
    
//    NSLog(@"%@", ((FontAsset *)[FontsManager shareManager].fonts[indexPath.row]).font);
    
    return cell;
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
        [self.navigationController pushViewController:({
            PreviewController *previewController = [[PreviewController alloc] init];
            previewController.fontAsset          = [FontsManager shareManager].fonts[indexPath.row];
            previewController;
        })
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
