//
//  LanguageViewController.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "LanguageViewController.h"

@interface LanguageViewController()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) UINavigationBar *bar;
@property( nonatomic, strong ) UITableView *bear;

@property( nonatomic, strong ) NSIndexPath *currentIndexPath;
@property( nonatomic, strong ) NSArray *langs;

@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.currentIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    self.langs = @[ @"English", @"中文", @"Japanese" ];
    
    [self letBear];
}

- (void)letBear{
    self.bar = ({
        UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:({
            CGRect rect = self.view.bounds;
            rect.size.height = [UIApplication sharedApplication].statusBarFrame.size.height + 44;
            rect;
        })];
        
        UINavigationItem *item  = [[UINavigationItem alloc] initWithTitle:@"Language"];
        item.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                target:self
                                                                                action:@selector(dismissSelf)];
        item.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(doneSelf)];
        item.leftBarButtonItem.tintColor = [UIColor redColor];
        
        [bar pushNavigationItem:item animated:NO];
        [self.view addSubview:bar];
        
        bar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        bar;
    });
    
    self.bear = ({
        UITableView *bear = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        bear.translatesAutoresizingMaskIntoConstraints = NO;
        bear.showsHorizontalScrollIndicator = NO;
        bear.showsVerticalScrollIndicator = NO;
        bear.sectionFooterHeight = 0.0f;
        bear.contentInset    = UIEdgeInsetsMake([UIApplication sharedApplication].statusBarFrame.size.height + 44, 0, 0, 0);
        bear.allowsMultipleSelectionDuringEditing = NO;
        bear.delegate = self;
        bear.dataSource = self;
        bear;
    });
    
    [self.view insertSubview:self.bear belowSubview:self.bar];
    [self.bear.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.bear.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.bear.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.bear.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.langs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const TABLEVIEW_CELL_ID = @"TABLEVIEW_CELL_ID_FOR_LANG";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_ID];
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLEVIEW_CELL_ID];
    }
    
    if( indexPath.row == self.currentIndexPath.row )
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    cell.textLabel.text = self.langs[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ((UITableViewCell *)[tableView cellForRowAtIndexPath:self.currentIndexPath]).accessoryType = UITableViewCellAccessoryNone;
    ((UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).accessoryType = UITableViewCellAccessoryCheckmark;
    
    self.currentIndexPath = indexPath;
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
