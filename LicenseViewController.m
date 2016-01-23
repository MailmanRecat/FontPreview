//
//  LicenseViewController.m
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "LicenseViewController.h"

@interface LicenseViewController ()

@property( nonatomic, strong ) UITableView *bear;

@end

@implementation LicenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *b = [[NSBundle mainBundle] pathForResource:@"licenseRoboto" ofType:@"txt"];
    
//    NSLog(@"%@", b);
    
//    NSString *string = [NSString stringWithContentsOfURL:[NSURL URLWithString:b] encoding:NSUTF8StringEncoding error:nil];
    NSString *string = [NSString stringWithContentsOfFile:b encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@", string);
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