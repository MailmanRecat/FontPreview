//
//  LicenseViewController.m
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "LicenseViewController.h"
#import "TXTContentViewController.h"

@interface LicenseViewController()<UITableViewDataSource, UITableViewDelegate>

@property( nonatomic, strong ) UITableView  *bear;
@property( nonatomic, strong ) NSArray      *licenses;
@property( nonatomic, strong ) NSDictionary *txt;

@end

@implementation LicenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"Licenses"];
    
    self.licenses = @[
                      @"Apache",
                      @"San Francisco UI",
                      @"San Francisco Compact",
                      @"Ubuntu"
                      ];
    
    self.txt      = @{
                      @"Apache": @"licenseRoboto",
                      @"San Francisco UI": @"licenseAgreementForSFUIFont",
                      @"San Francisco Compact": @"licenseAgreementForSFCompactFont",
                      @"Ubuntu": @"licenseUbuntu"
                      };
    
    [self letBear];
}

- (void)letBear{
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.licenses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const LICENSE_CELL_ID = @"LICENSE_CELL_ID";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:LICENSE_CELL_ID];
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LICENSE_CELL_ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.licenses[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        TXTContentViewController *txtContent = [[TXTContentViewController alloc] initWithFilename:self.txt[self.licenses[indexPath.row]]];
        txtContent.title = self.licenses[indexPath.row];
        [self.navigationController pushViewController:txtContent animated:YES];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
