//
//  LanguageViewController.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "LanguageViewController.h"
#import "UIColor+Theme.h"

@interface LanguageViewController()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) UITableView *bear;

@property( nonatomic, strong ) NSIndexPath *currentIndexPath;
@property( nonatomic, strong ) NSArray *langs;

@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"Languages";
    self.langs = @[ @"English", @"中文", @"Japanese" ];
    self.currentIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self letBear];
}

- (void)letBear{
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                           target:self
                                                                                           action:@selector(dismissSelf)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                           target:self
                                                                                           action:@selector(doneSelf)];
    self.navigationItem.leftBarButtonItem.tintColor  = [UIColor colorWithHex:CLThemeRedlight alpha:1];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
    
    
    self.bear = ({
        UITableView *bear = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        bear.translatesAutoresizingMaskIntoConstraints = NO;
        bear.showsHorizontalScrollIndicator = NO;
        bear.showsVerticalScrollIndicator = NO;
        bear.sectionFooterHeight = 0.0f;
        bear.sectionHeaderHeight = 36.0f;
        bear.allowsMultipleSelectionDuringEditing = NO;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? self.langs.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const TABLEVIEW_CELL_ID = @"TABLEVIEW_CELL_ID_FOR_LANG";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_ID];
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLEVIEW_CELL_ID];
    }
    
    if( indexPath.section == 0 ){
        if( indexPath.row == self.currentIndexPath.row )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        cell.textLabel.text = self.langs[indexPath.row];
    }else{
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"License";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if( indexPath.section == 0 ){
        ((UITableViewCell *)[tableView cellForRowAtIndexPath:self.currentIndexPath]).accessoryType = UITableViewCellAccessoryNone;
        ((UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).accessoryType = UITableViewCellAccessoryCheckmark;
        
        self.currentIndexPath = indexPath;
    }else if( indexPath.section == 1 ){
        
    }
}

- (void)doneSelf{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissSelf{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
