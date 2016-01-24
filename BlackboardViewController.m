//
//  BlackboardViewController.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "BlackboardViewController.h"
#import "UIFont+MaterialDesignIcons.h"

static NSString *const PREFER_BLACKBOARD_TYPE_KEY = @"PERFER_BLACKBOARD_TYPE_KEY";

@interface BlackboardViewController ()

@property( nonatomic, assign ) BOOL lock;
@property( nonatomic, strong ) UIButton *lockBtn;
@property( nonatomic, strong ) UILabel  *contentLabel;

@property( nonatomic, strong ) UIVisualEffectView *settingContainer;
@property( nonatomic, strong ) UISegmentedControl *segmentedControl;

@end

@implementation BlackboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self blankboard];
    [self changeBackgroundColor];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideOrShowSetting)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft;
    
    UITapGestureRecognizer   *tap   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissSelf)];
    
    [self.view addGestureRecognizer:swipe];
    [self.view addGestureRecognizer:tap];
}

- (void)changeBackgroundColor{
    UIColor *bcolor, *tcolor;
    if( self.segmentedControl.selectedSegmentIndex == 0 ){
        
        bcolor = [UIColor colorWithWhite:1 alpha:1];
        tcolor = [UIColor blackColor];
        
        [self setBlackboardType:0];
        
    }else if( self.segmentedControl.selectedSegmentIndex == 1 ){
        
        bcolor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
        tcolor = [UIColor whiteColor];
        
        [self setBlackboardType:1];
        
    }else if( self.segmentedControl.selectedSegmentIndex == 2 ){
        
        bcolor = [UIColor colorWithRed:0 green:122 / 255.0 blue:1 alpha:1];
        tcolor = [UIColor whiteColor];
        
        [self setBlackboardType:2];
        
    }else if( self.segmentedControl.selectedSegmentIndex == 3 ){
        
        bcolor = [UIColor colorWithWhite:0 alpha:1];
        tcolor = [UIColor whiteColor];
        
        [self setBlackboardType:3];
        
    }
    
    [UIView animateWithDuration:0.25f
                          delay:0.0f options:(7 << 16)
                     animations:^{
                         self.view.backgroundColor = bcolor;
                         self.contentLabel.textColor = tcolor;
                     }completion:nil];
}

- (void)lockOrUnlock:(UIButton *)btn{
    self.lock = !self.lock;
    
    [btn setTitle:self.lock ? @"Locked" : @"Lock" forState:UIControlStateNormal];
}

- (void)hideOrShowSetting{
    [self.view.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *con, NSUInteger index, BOOL *sS){
        if( con.firstItem == self.settingContainer && con.firstAttribute == NSLayoutAttributeLeft ){
            con.constant = con.constant == 0 ? -52 : 0;
            [UIView animateWithDuration:0.25 delay:0.0f options:(7 << 16)
                             animations:^{
                                 [self.view layoutIfNeeded];
                             }completion:nil];
            
            *sS = YES;
        }
    }];
}

- (void)blankboard{
    
    UIInterfaceOrientation orientation = ({
        UIInterfaceOrientation result;
        if( self.view.frame.size.width <= self.view.frame.size.height )
            result = UIInterfaceOrientationPortrait;
        else
            result = UIInterfaceOrientationLandscapeLeft;
        
        result;
    });
    
    self.contentLabel = ({
        UILabel *board = [[UILabel alloc] init];
        board.userInteractionEnabled = NO;
        board.adjustsFontSizeToFitWidth = YES;
        board.numberOfLines = 0;
        board.textAlignment = NSTextAlignmentCenter;
        board.font = [UIFont systemFontOfSize:64 weight:UIFontWeightUltraLight];
        board.translatesAutoresizingMaskIntoConstraints = NO;
        
//        board.text = @"Get your apps ready with the latest beta versions of the San Francisco fonts for iOS 9, OS X El Capitan, watchOS 2, and tvOS. To download, sign in with your Apple ID associated with your Apple Developer Program membership.";
        board.font = self.boardFont;
        board.text = self.boardString;
        
        [self.view addSubview:board];
        [board.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
        [board.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
        
        if( orientation == UIInterfaceOrientationPortrait ){
            [board setTransform:CGAffineTransformMakeRotation(M_PI_2)];
            [board.widthAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
            [board.heightAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
        }else{
            [board.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
            [board.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
        }
        
        board;
    });
    
    self.settingContainer = ({
        UIVisualEffectView *settingContainer = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        settingContainer.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.view addSubview:settingContainer];
        [settingContainer.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [settingContainer.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:-52].active = YES;
        [settingContainer.widthAnchor constraintEqualToConstant:44].active = YES;
        [settingContainer.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
        
        settingContainer;
    });
    
    self.segmentedControl = ({
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[ @"White", @"Gray", @"Blue", @"Black" ]];
        segmentedControl.tintColor = [UIColor colorWithWhite:51 / 255.0 alpha:1];
        segmentedControl.transform = CGAffineTransformMakeRotation(M_PI_2);
        segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
        segmentedControl.selectedSegmentIndex = [self preferBlackboard];
        
        [segmentedControl addTarget:self action:@selector(changeBackgroundColor) forControlEvents:UIControlEventValueChanged];
        
        [self.settingContainer.contentView addSubview:segmentedControl];
        [segmentedControl.centerXAnchor constraintEqualToAnchor:self.settingContainer.contentView.centerXAnchor].active = YES;
        [segmentedControl.centerYAnchor constraintEqualToAnchor:self.settingContainer.contentView.centerYAnchor].active = YES;
        [segmentedControl.widthAnchor constraintEqualToAnchor:self.settingContainer.contentView.heightAnchor constant:-144].active = YES;
        
        segmentedControl;
    });
    
    self.lockBtn = ({
        UIButton *lock = [[UIButton alloc] init];
        lock.transform = CGAffineTransformMakeRotation(M_PI_2);
        lock.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
        [lock setTitle:@"Lock" forState:UIControlStateNormal];
        [lock setTitleColor:[UIColor colorWithRed:0 green:122 / 255.0 blue:1 alpha:1] forState:UIControlStateNormal];
        [lock setTitleColor:[UIColor colorWithRed:0 green:122 / 255.0 blue:1 alpha:0.4] forState:UIControlStateHighlighted];
        lock.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.settingContainer.contentView addSubview:lock];
        [lock.centerXAnchor constraintEqualToAnchor:self.settingContainer.contentView.centerXAnchor].active = YES;
        [lock.centerYAnchor constraintEqualToAnchor:self.settingContainer.contentView.topAnchor constant:36].active = YES;
        [lock.heightAnchor constraintEqualToConstant:44].active = YES;
        [lock.widthAnchor constraintEqualToConstant:72].active = YES;
        
        [lock addTarget:self action:@selector(lockOrUnlock:) forControlEvents:UIControlEventTouchUpInside];
        
        lock;
    });
}

- (void)dismissSelf{
    if( self.lock == NO ){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)setBlackboardType:(NSUInteger)type{
    [[NSUserDefaults standardUserDefaults] setInteger:type forKey:PREFER_BLACKBOARD_TYPE_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSUInteger)preferBlackboard{
    return [[NSUserDefaults standardUserDefaults] integerForKey:PREFER_BLACKBOARD_TYPE_KEY];
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
