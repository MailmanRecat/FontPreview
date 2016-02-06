//
//  previewTextViewController.m
//  FontPreview
//
//  Created by caine on 2/4/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "previewTextViewController.h"
#import "UITableViewFunctionalCell.h"
#import "FCachePreviewText.h"

@interface previewTextViewController()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property( nonatomic, strong ) UITableView    *bear;
@property( nonatomic, strong ) NSMutableArray *previewTexts;

@property( nonatomic, assign ) BOOL shouldUpdate;
@property( nonatomic, strong ) NSArray<UITableViewFunctionalCell *> *functioncells;

@end

@implementation previewTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Preview text";
    self.previewTexts = [FCachePreviewText allPreviewTexts];
    
    [self UI];
}

- (void)viewWillDisappear:(BOOL)animated{
    if( self.shouldUpdate ){
        [FCachePreviewText letPreviewText:self.functioncells[0].textField.text withName:TEXT_PREVIEW_ENGLISH_CACHE];
        [FCachePreviewText letPreviewText:self.functioncells[1].textField.text withName:TEXT_PREVIEW_CHINESE_CACHE];
        [FCachePreviewText letPreviewText:self.functioncells[2].textField.text withName:TEXT_PREVIEW_JAPANESE_CACHE];
    }
}

- (void)UI{
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
    
    UITableViewFunctionalCell *(^cell)(NSString *, NSString *) = ^(NSString *text, NSString *placeholder){
        UITableViewFunctionalCell *cell = [[UITableViewFunctionalCell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_TEXTFIELD];
        cell.textField.placeholder = placeholder;
        cell.textField.text        = text;
        cell.textField.delegate    = self;
        return cell;
    };
    
    self.functioncells = @[
                           cell( self.previewTexts[0], @"Preview" ),
                           cell( self.previewTexts[1], @"预览" ),
                           cell( self.previewTexts[2], @"プレビュー" )
                           ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if( indexPath.row == 3 ){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_CELL_ID_BUTTON];
        if( cell == nil ){
            cell =  [[UITableViewFunctionalCell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_BUTTON];
            cell.textLabel.textColor = [UIColor colorWithRed:250 / 255.0 green:17 / 255.0 blue:79 / 255.0 alpha:1];
            cell.textLabel.text      = @"Reset";
        }
        
        return cell;
    }
    
    UITableViewFunctionalCell *functionalcall = self.functioncells[indexPath.row];
    
    functionalcall.textField.text = self.previewTexts[indexPath.row];
    
    return functionalcall;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if( indexPath.row == 3 ){
        [FCachePreviewText resetDefault];
        self.previewTexts = [FCachePreviewText allPreviewTexts];
        [self.bear reloadData];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.shouldUpdate = YES;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
