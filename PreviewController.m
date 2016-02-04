//
//  PreviewController.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#define PREVIEW_TEXTVIEW_HEI 172
#define PREVIEW_FONTSIZE_MIN 12
#define PREVIEW_FONTSIZE_MAX 72

#import "PreviewController.h"
#import "BlackboardViewController.h"
#import "UITableViewFunctionalCell.h"
#import "cachePreviewText.h"

#import "UIColor+Theme.h"
#import "Craig.h"

@interface PreviewController()<UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>

@property( nonatomic, strong ) UITableView *bear;
@property( nonatomic, strong ) NSIndexPath *weightIndexPath;
@property( nonatomic, assign ) CGFloat      textPreviewFontsize;
@property( nonatomic, strong ) NSString    *textPreviewText;
@property( nonatomic, strong ) UIView      *textPreviewHeaderView;
@property( nonatomic, strong ) UIView      *fontsizeHeaderView;
@property( nonatomic, strong ) UIView      *fontweightHeaderView;

@property( nonatomic, strong ) NSArray     *fontWeight;

@end

@implementation PreviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.fontAsset.name;
    self.weightIndexPath     = [NSIndexPath indexPathForRow:0 inSection:2];
    self.textPreviewFontsize = 24.0f;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                                                                                           target:self
                                                                                           action:@selector(blackboard)];
    
    if( [self.lang isEqualToString:@"ENGLISH"] ){
        self.textPreviewText = [cachePreviewText previewTextFromName:TEXT_PREVIEW_ENGLISH_CACHE];
        
    }else if( [self.lang isEqualToString:@"CHINSES"] ){
        self.textPreviewText = [cachePreviewText previewTextFromName:TEXT_PREVIEW_CHINESE_CACHE];
        
    }else if( [self.lang isEqualToString:@"JAPANESE"] ){
        self.textPreviewText = [cachePreviewText previewTextFromName:TEXT_PREVIEW_JAPANESE_CACHE];
        
    }
    
    [self doBear];
}

- (void)setFontAsset:(FontAsset *)fontAsset{
    _fontAsset = fontAsset;
    
    self.fontWeight = [[UIFont fontNamesForFamilyName:fontAsset.fontName] sortedArrayUsingComparator:
                       ^(NSString *str1, NSString *str2){
                           
                           NSUInteger number1 = [Craig positionOfFontWeight:str1];
                           NSUInteger number2 = [Craig positionOfFontWeight:str2];
                           
                           if( number1 < number2 )
                               return (NSComparisonResult)NSOrderedAscending;
                           
                           if( number1 > number2 )
                               return (NSComparisonResult)NSOrderedDescending;
                           
                           return (NSComparisonResult)NSOrderedSame;
                       }];
    
    if( self.fontWeight.count == 0 )
        self.fontWeight = @[ fontAsset.fontName ];
}

- (void)viewWillAppear:(BOOL)animated{

}

- (void)adjustTextSize:(UISlider *)slider{
    self.textPreviewFontsize = (NSUInteger)slider.value;
    
    ((UILabel *)self.fontsizeHeaderView.subviews.firstObject).text = [NSString stringWithFormat:@"Fontsize: %ldpt", (NSUInteger)slider.value];
    
    [self.bear reloadRowsAtIndexPaths:@[
                                        [NSIndexPath indexPathForRow:0 inSection:0]
                                        ]
                     withRowAnimation:UITableViewRowAnimationNone];
}

- (void)doBear{
    self.bear = ({
        UITableView *bear = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        bear.translatesAutoresizingMaskIntoConstraints = NO;
        bear.showsHorizontalScrollIndicator = NO;
        bear.showsVerticalScrollIndicator = NO;
        bear.sectionFooterHeight = 0.0f;
        bear.contentInset    = UIEdgeInsetsMake(0, 0, 44, 0);
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if( section == 0 )
        return 1;
    else if( section == 1 )
        return 1;
    else if( section == 2 )
        return self.fontWeight.count;
    else if( section == 3 )
        return 1;
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if( indexPath.section == 0 && indexPath.row == 0 )
        return PREVIEW_TEXTVIEW_HEI;
    
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if( section == 1 ){
        if( self.fontsizeHeaderView == nil ){
            self.fontsizeHeaderView =  [Craig tableHeaderContentViewWithTitle:@"Fontsize: 24pt"];
        }
        
        return self.fontsizeHeaderView;
    }else if( section == 0 ){
        if( self.textPreviewHeaderView == nil ){
            self.textPreviewHeaderView =  [Craig tableHeaderContentViewWithTitle:@"Text preview"];
        }
        
        return self.textPreviewHeaderView;
    }else if( section == 2 ){
        if( self.fontweightHeaderView == nil ){
            self.fontweightHeaderView =  [Craig tableHeaderContentViewWithTitle:@"Font weight"];
        }
        
        return self.fontweightHeaderView;
    }
    
    return [Craig tableHeaderContentViewWithTitle:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const TABLEVIEW_CELL_ID = @"TABLEVIEW_CELL_ID_FOR_LANG";
    
    UITableViewFunctionalCell *functionalCell;
    
    if( indexPath.row == 0 && indexPath.section == 0 ){
        functionalCell = [tableView dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_CELL_ID_TEXT];
        if( functionalCell == nil ){
            functionalCell =  [[UITableViewFunctionalCell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_TEXT];
            functionalCell.textView.tintColor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
            functionalCell.textView.delegate  = self;
        }
        
        functionalCell.textView.text = self.textPreviewText;
        functionalCell.textView.font = [UIFont fontWithName:(NSString *)self.fontWeight[self.weightIndexPath.row]
                                                       size:self.textPreviewFontsize];
        
        return functionalCell;
    }else if( indexPath.row == 0 && indexPath.section == 1 ){
        functionalCell = [tableView dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_CELL_ID_SLIDER];
        if( functionalCell == nil ){
            functionalCell = [[UITableViewFunctionalCell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_SLIDER];
            functionalCell.slider.tintColor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
            functionalCell.slider.minimumValue = PREVIEW_FONTSIZE_MIN;
            functionalCell.slider.maximumValue = PREVIEW_FONTSIZE_MAX;
            functionalCell.slider.value        = self.textPreviewFontsize;
            
            [functionalCell.slider addTarget:self action:@selector(adjustTextSize:) forControlEvents:UIControlEventValueChanged];
        }
        
        return functionalCell;
    }else if( indexPath.row == 0 && indexPath.section == 3 ){
        functionalCell = [tableView dequeueReusableCellWithIdentifier:REUSE_FUNCTIONAL_CELL_ID_BUTTON];
        if( functionalCell == nil ){
            functionalCell =  [[UITableViewFunctionalCell alloc] initWithReuseString:REUSE_FUNCTIONAL_CELL_ID_BUTTON];
            functionalCell.textLabel.textColor = [UIColor colorWithHex:CLThemeRedlight alpha:1];
            functionalCell.textLabel.text = @"Add favorite";
        }
        
        return functionalCell;
    }
    
    if( indexPath.section == 2 ){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_ID];
        if( cell == nil ){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLEVIEW_CELL_ID];
        }
        
        if( indexPath.row == self.weightIndexPath.row && indexPath.section == self.weightIndexPath.section )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
        if( [self.fontWeight[indexPath.row] isEqualToString:@""] )
            cell.textLabel.text = self.fontAsset.fontName;
        else
            cell.textLabel.text = ({
                NSString *weight = (NSString *)self.fontWeight[indexPath.row];
                NSRange   range  = [weight rangeOfString:@"-"];
                if( range.location != NSNotFound )
                    weight = [weight substringFromIndex:range.location + 1];
                    
                weight;
            });
        
        return cell;
    }
    
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if( indexPath.row == 0 && (indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 3) ){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }else if( indexPath.section == 2 && indexPath.row != self.weightIndexPath.row ){
        [tableView cellForRowAtIndexPath:self.weightIndexPath].accessoryType = UITableViewCellAccessoryNone;
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [self setWeightIndexPath:indexPath];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        [tableView reloadRowsAtIndexPaths:@[
                                            [NSIndexPath indexPathForRow:0 inSection:0]
                                            ]
                         withRowAnimation:UITableViewRowAnimationNone];
    }else{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

- (void)textViewDidChange:(UITextView *)textView{
    self.textPreviewText = textView.text;
}

- (void)displayOrText{
    UIVisualEffectView *visual = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    visual.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:visual];
    [visual.topAnchor constraintEqualToAnchor:self.view.topAnchor
                                     constant:[UIApplication sharedApplication].statusBarFrame.size.height + 44].active = YES;
    [visual.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [visual.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [visual.heightAnchor constraintEqualToConstant:44].active = YES;
    
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = [UIColor colorWithWhite:178 / 255.0 alpha:1];
    border.translatesAutoresizingMaskIntoConstraints = NO;
    
    [visual.contentView addSubview:border];
    [border.heightAnchor constraintEqualToConstant:0.5].active = YES;
    [border.leftAnchor constraintEqualToAnchor:visual.contentView.leftAnchor].active = YES;
    [border.rightAnchor constraintEqualToAnchor:visual.contentView.rightAnchor].active = YES;
    [border.bottomAnchor constraintEqualToAnchor:visual.contentView.bottomAnchor].active = YES;
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:@[ @"Text", @"Display" ]];
    segmented.tintColor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
    segmented.selectedSegmentIndex = 0;
    segmented.translatesAutoresizingMaskIntoConstraints = NO;
    
    [visual.contentView addSubview:segmented];
    [segmented.leftAnchor constraintEqualToAnchor:visual.contentView.leftAnchor constant:32].active = YES;
    [segmented.rightAnchor constraintEqualToAnchor:visual.contentView.rightAnchor constant:-32].active = YES;
    [segmented.centerXAnchor constraintEqualToAnchor:visual.contentView.centerXAnchor].active = YES;
    [segmented.centerYAnchor constraintEqualToAnchor:visual.contentView.centerYAnchor].active = YES;
}

- (void)blackboard{
    [self presentViewController:({
        BlackboardViewController *blackboard = [[BlackboardViewController alloc] init];
        blackboard.boardString = self.textPreviewText;
        blackboard.boardFont   = [UIFont fontWithName:(NSString *)self.fontWeight[self.weightIndexPath.row]
                                                 size:self.textPreviewFontsize];
        blackboard;
    })
                       animated:YES
                     completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
