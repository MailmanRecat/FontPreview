//
//  PreviewController.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#define PREVIEW_TEXTVIEW_HEI 172
#define PREVIEW_FONTSIZE_MIN 12
#define PREVIEW_FONTSIZE_MAX 142

#import <CoreText/CoreText.h>

#import "PreviewController.h"
#import "BlackboardViewController.h"
#import "UITableViewFunctionalCell.h"
#import "FTranslate.h"

#import "UIColor+Theme.h"
#import "Craig.h"

@interface PreviewController()<UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>

@property( nonatomic, strong ) UITableView  *bear;
@property( nonatomic, strong ) NSIndexPath  *weightIndexPath;
@property( nonatomic, assign ) CGFloat       textPreviewFontsize;
@property( nonatomic, strong ) NSString     *textPreviewText;
@property( nonatomic, strong ) UIView       *textPreviewHeaderView;
@property( nonatomic, strong ) UIView       *fontsizeHeaderView;
@property( nonatomic, strong ) UIView       *fontweightHeaderView;

@property( nonatomic, strong ) NSArray      *fontWeight;

@property( nonatomic, assign ) BOOL          syncFont;
@property( nonatomic, assign ) BOOL          downloading;
@property( nonatomic, assign ) BOOL          cancelDownload;

@property( nonatomic, strong ) UIButton                *downloadButton;
@property( nonatomic, strong ) UILabel                 *infoLabel;

@property( nonatomic, strong ) UIActivityIndicatorView *activityIndicatorView;

@property( nonatomic, strong ) NSDictionary *translate;

@end

@implementation PreviewController

- (instancetype)initWithFontAsset:(FontAsset *)fontAsset lang:(NSString *)lang{
    self = [super init];
    if( self ){
        self.fontAsset = fontAsset;
        self.lang      = lang;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.fontAsset.name;
    self.weightIndexPath     = [NSIndexPath indexPathForRow:0 inSection:2];
    self.textPreviewFontsize = 24.0f;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                                                                                           target:self
                                                                                           action:@selector(blackboard)];
    
    self.textPreviewText = [[FTranslate standarTranslate] stringFromString:FTPreviewText];
    
    [self doBear];
    
    if( self.syncFont ){
        [self downloadInfoAndAction];
        
        self.navigationItem.rightBarButtonItem.enabled = NO;
        
        [self.activityIndicatorView startAnimating];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)setFontAsset:(FontAsset *)fontAsset{
    _fontAsset = fontAsset;
    
    [self sortFontWeight];
    
    int debug = 1;
    
    if( debug != 0 ){
        return;
    }
    
    if( [self fontSupport] ){
        [self sortFontWeight];
    }else{
        self.syncFont    = YES;
        
        self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        self.activityIndicatorView.hidesWhenStopped = YES;
        
        [self.view addSubview:self.activityIndicatorView];
        [self.activityIndicatorView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
        [self.activityIndicatorView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    }
}

- (BOOL)fontSupport{
    UIFont *aFont = [UIFont fontWithName:self.fontAsset.fontName size:12.0];
    return aFont && ([aFont.fontName compare:self.fontAsset.fontName] == NSOrderedSame || [aFont.familyName compare:self.fontAsset.fontName] == NSOrderedSame);
}

- (void)sortFontWeight{
    self.fontWeight = [[UIFont fontNamesForFamilyName:self.fontAsset.fontName] sortedArrayUsingComparator:
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
        self.fontWeight = @[ self.fontAsset.fontName ];
}

- (void)adjustTextSize:(UISlider *)slider{
    self.textPreviewFontsize = (NSUInteger)slider.value;
    
    ((UILabel *)self.fontsizeHeaderView.subviews.firstObject).text = [NSString stringWithFormat:@"%@: %ldpt", [[FTranslate standarTranslate] stringFromString:FTFontSize], (NSUInteger)slider.value];
    
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
    if( self.syncFont )
        return 0;
    
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
            NSString *t = [NSString stringWithFormat:@"%@: 24pt", [[FTranslate standarTranslate] stringFromString:FTFontSize]];
            self.fontsizeHeaderView =  [Craig tableHeaderContentViewWithTitle:t];
        }
        
        return self.fontsizeHeaderView;
    }else if( section == 0 ){
        if( self.textPreviewHeaderView == nil ){
            self.textPreviewHeaderView =  [Craig tableHeaderContentViewWithTitle:[[FTranslate standarTranslate] stringFromString:FTTextPreview]];
        }
        
        return self.textPreviewHeaderView;
    }else if( section == 2 ){
        if( self.fontweightHeaderView == nil ){
            self.fontweightHeaderView =  [Craig tableHeaderContentViewWithTitle:[[FTranslate standarTranslate] stringFromString:FTFontWeight]];
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
            cell.tintColor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
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

- (void)downloadInfoAndAction{
    UIButton *download = [[UIButton alloc] init];
    [self.view addSubview:download];
    [download setTranslatesAutoresizingMaskIntoConstraints:NO];
    [download.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.618].active = YES;
    [download.heightAnchor constraintEqualToConstant:36].active = YES;
    [download.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [download.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:36].active = YES;
    
    download.layer.borderColor = [UIColor colorWithWhite:51 / 255.0 alpha:1].CGColor;
    download.layer.borderWidth = 1.0f;
    download.layer.cornerRadius = 4.0f;
    download.titleLabel.adjustsFontSizeToFitWidth = YES;
    download.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
    
    [download setTitle:[[FTranslate standarTranslate] stringFromString:FTDownload] forState:UIControlStateNormal];
    [download setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    [download setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:0.4] forState:UIControlStateDisabled];
    [download setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:0.4] forState:UIControlStateHighlighted];
    
    UILabel *info = [[UILabel alloc] init];
    info.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    info.textColor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
    info.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:info];
    [info setTranslatesAutoresizingMaskIntoConstraints:NO];
    [info.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [info.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-22].active = YES;
    [info.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-32].active = YES;
    [info.heightAnchor constraintEqualToConstant:44].active = YES;
    
    [download addTarget:self action:@selector(startDownload) forControlEvents:UIControlEventTouchUpInside];
    
    _downloadButton = download;
    _infoLabel      = info;
}

- (void)blackboard{
    UIFont *font = [UIFont fontWithName:(NSString *)self.fontWeight[self.weightIndexPath.row]
                                   size:self.textPreviewFontsize];
    
    [self presentViewController:[[BlackboardViewController alloc] initWithString:self.textPreviewText font:font]
                       animated:YES
                     completion:nil];
}

- (void)startDownload{
    if( self.downloading ){
        
        self.cancelDownload = YES;
    }else{
        self.downloading = YES;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        [self.downloadButton setTitle:[[FTranslate standarTranslate] stringFromString:FTCancelDownload] forState:UIControlStateNormal];
        [self.downloadButton setTitleColor:[UIColor colorWithRed:250 / 255.0 green:17 / 255.0 blue:79 / 255.0 alpha:1]
                                  forState:UIControlStateNormal];
        [self.downloadButton setTitleColor:[UIColor colorWithRed:250 / 255.0 green:17 / 255.0 blue:79 / 255.0 alpha:0.4]
                                  forState:UIControlStateDisabled];
        
//        [self asynchronouslySetFontName:self.fontAsset.fontName];
    }
}

- (void)finishedDownload{
    
}

- (void)canceledDownload{
    [self.downloadButton setTitle:[[FTranslate standarTranslate] stringFromString:FTDownload] forState:UIControlStateNormal];
    [self.downloadButton setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.downloadButton setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:0.4] forState:UIControlStateDisabled];
    [self.downloadButton setEnabled:YES];
}

//- (void)asynchronouslySetFontName:(NSString *)fontName{
//    self.cancelDownload = NO;
//    
//    // Create a dictionary with the font's PostScript name.
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName, kCTFontNameAttribute, nil];
//    
//    // Create a new font descriptor reference from the attributes dictionary.
//    CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
//    
//    NSMutableArray *descs = [NSMutableArray arrayWithCapacity:0];
//    [descs addObject:(__bridge id)desc];
//    CFRelease(desc);
//    
//    __block BOOL errorDuringDownload = NO;
//    
//    // Start processing the font descriptor..
//    // This function returns immediately, but can potentially take long time to process.
//    // The progress is notified via the callback block of CTFontDescriptorProgressHandler type.
//    // See CTFontDescriptor.h for the list of progress states and keys for progressParameter dictionary.
//    CTFontDescriptorMatchFontDescriptorsWithProgressHandler( (__bridge CFArrayRef)descs, NULL,  ^(CTFontDescriptorMatchingState state, CFDictionaryRef progressParameter) {
//        
//        double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
//        
//        if (state == kCTFontDescriptorMatchingDidBegin) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//                NSLog(@"Begin Matching");
//            });
//        } else if (state == kCTFontDescriptorMatchingDidFinish) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//                // Log the font URL in the console
//                CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)fontName, 0., NULL);
//                CFStringRef fontURL = CTFontCopyAttribute(fontRef, kCTFontURLAttribute);
//                NSLog(@"%@", (__bridge NSString *)(fontURL));
//                CFRelease(fontURL);
//                CFRelease(fontRef);
//                
//                if (!errorDuringDownload) {
//                    NSLog(@"%@ downloaded", fontName);
//                    self.infoLabel.text = [[FTranslate standarTranslate] stringFromString:FTFinishDownload];
//                    
//                    NSLog(@"MatchingFinished %d", [self fontSupport]);
//                    
//                    self.syncFont = NO;
//                    [self sortFontWeight];
//                    [self.bear reloadData];
//                }
//            });
//        } else if (state == kCTFontDescriptorMatchingWillBeginDownloading) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//                self.infoLabel.text = [[FTranslate standarTranslate] stringFromString:FTStartDownload];
//            });
//        } else if (state == kCTFontDescriptorMatchingDidFinishDownloading) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//                NSLog(@"Finish downloading");
//            });
//        } else if (state == kCTFontDescriptorMatchingDownloading) {
//            dispatch_async( dispatch_get_main_queue(), ^ {
//                // Use the progress bar to indicate the progress of the downloading
//                NSLog(@"Downloading %.0f%% complete", progressValue);
//                self.infoLabel.text = [NSString stringWithFormat:@"%@ %.0f%%", [[FTranslate standarTranslate] stringFromString:FTStartDownload], progressValue];
//            });
//            
//            if( self.cancelDownload )
//                return NO;
//            
//        } else if (state == kCTFontDescriptorMatchingDidFailWithError) {
//            // An error has occurred.
//            // Get the error message
//            NSError *error = [(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingError];
//            if (error != nil) {
////                _errorMessage = [error description];
//            } else {
////                _errorMessage = @"ERROR MESSAGE IS NOT AVAILABLE!";
//            }
//            
//            errorDuringDownload = YES;
//            
//            dispatch_async( dispatch_get_main_queue(), ^ {
//                UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@""
//                                                                                    message:@""
//                                                                             preferredStyle:UIAlertControllerStyleAlert];
//                
//                NSLog(@"error");
//                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//            });
//        }
//        
//        return (bool)YES;
//    });
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
