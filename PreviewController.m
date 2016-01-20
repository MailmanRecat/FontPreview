//
//  PreviewController.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "PreviewController.h"
#import "BlackboardViewController.h"

@interface PreviewController ()

@end

@implementation PreviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"San Francisco";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                                                                                           target:self
                                                                                           action:@selector(blackboard)];    
    [self displayOrText];
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
    segmented.translatesAutoresizingMaskIntoConstraints = NO;
    
    [visual.contentView addSubview:segmented];
    [segmented.leftAnchor constraintEqualToAnchor:visual.contentView.leftAnchor constant:32].active = YES;
    [segmented.rightAnchor constraintEqualToAnchor:visual.contentView.rightAnchor constant:-32].active = YES;
    [segmented.centerXAnchor constraintEqualToAnchor:visual.contentView.centerXAnchor].active = YES;
    [segmented.centerYAnchor constraintEqualToAnchor:visual.contentView.centerYAnchor].active = YES;
}

- (void)blackboard{
    [self presentViewController:[BlackboardViewController new] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
