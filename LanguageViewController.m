//
//  LanguageViewController.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "LanguageViewController.h"
#import "UIColor+Theme.h"
#import "APPADUITableViewCell.h"
#import "LicenseViewController.h"
#import "Fonts.h"
#import "FontsManager.h"

@interface LanguageViewController()<UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate>

@property( nonatomic, strong ) UITableView *bear;

@property( nonatomic, strong ) NSIndexPath *currentIndexPath;
@property( nonatomic, strong ) NSArray *langs;

@property( nonatomic, strong ) NSArray *QArray;
@property( nonatomic, strong ) NSArray *AArray;
@property( nonatomic, strong ) NSArray *ADArray;
@property( nonatomic, strong ) NSArray *AIArray;
@property( nonatomic, strong ) NSArray *ALArray;

@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.QArray  = @[ @"Feedback", @"Version", @"Author" ];
    self.AArray  = @[ @"", @"9.0", @"mailman" ];
    self.ADArray = @[ @"richundo", @"note idea" ];
    self.AIArray = @[ @"icon120.png", @"noteicon120.png" ];
    self.ALArray = @[
                     @"https://appsto.re/cn/-Iuaab.i",
                     @"https://appsto.re/cn/X6A4_.i"
                     ];
    
    self.title = @"Languages";
    self.langs = @[ @"English", @"中文", @"日本語" ];
    
    if( [[FontsManager shareManager].lang isEqualToString:LANG_ENGLISH] )
        self.currentIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    else if( [[FontsManager shareManager].lang isEqualToString:LANG_CHINESE] )
        self.currentIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    
    else if( [[FontsManager shareManager].lang isEqualToString:LANG_JAPANESE] )
        self.currentIndexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    
    [self letBear];
}

- (void)letBear{
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                           target:self
                                                                                           action:@selector(dismissSelf)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                           target:self
                                                                                           action:@selector(doneSelf)];
    self.navigationController.navigationBar.tintColor= [UIColor colorWithWhite:51 / 255.0 alpha:1];
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if( section == 0 )
        return self.langs.count;
    
    if( section == 1 )
        return 1;
    
    if( section == 2 )
        return self.AArray.count;
    
    if( section == 3 )
        return self.ADArray.count;

    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if( indexPath.section == 3 )
        return 60.0;
    
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if( section == 3 )
        return 44.0;
    
    return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if( section == 3 ){
        UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"APP_AD"];
        if( footer == nil ){
            footer =  [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"APP_AD"];
            footer.textLabel.text = @"app you may interesting";
        }
        
        return footer;
    }
    
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const TABLEVIEW_CELL_ID = @"TABLEVIEW_CELL_ID_FOR_LANG";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_ID];
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TABLEVIEW_CELL_ID];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    if( indexPath.section == 0 ){
        if( indexPath.row == self.currentIndexPath.row )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        cell.textLabel.text = self.langs[indexPath.row];
    }else if( indexPath.section == 1 ){
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"License";
    }else if( indexPath.section == 2 ){
        if( indexPath.row == 0 )
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.text = self.QArray[indexPath.row];
        cell.detailTextLabel.text = self.AArray[indexPath.row];
    }else if( indexPath.section == 3 ){
        APPADUITableViewCell *appad = [tableView dequeueReusableCellWithIdentifier:APP_AD_TABLEVIEW_CELL_IDENT];
        if( appad == nil ){
            appad =  [[APPADUITableViewCell alloc] initWithReuseString:APP_AD_TABLEVIEW_CELL_IDENT];
            
            [appad.switchControl addTarget:self action:@selector(toAPPStore:) forControlEvents:UIControlEventValueChanged];
        }
        
        appad.switchControl.tag = indexPath.row;
        appad.textLabel.text = self.ADArray[indexPath.row];
        appad.imageView.image = [UIImage imageNamed:self.AIArray[indexPath.row]];
        
        return appad;
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
        [self.navigationController pushViewController:[LicenseViewController new] animated:YES];
    }else if( indexPath.section == 2 && indexPath.row == 0 ){
        MFMailComposeViewController *mailCompose = [[MFMailComposeViewController alloc] init];
        mailCompose.mailComposeDelegate = self;
        [mailCompose setToRecipients:@[ @"mailmanrecat@gmail.com" ]];
        [mailCompose setSubject:@"Feedback to fonts browse"];
        [self presentViewController:mailCompose animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)toAPPStore:(UISwitch *)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.ALArray[sender.tag]]];
}

- (void)doneSelf{
    
    if( self.currentIndexPath.row == 0 && [[Fonts lang] isEqualToString:LANG_ENGLISH] == NO )
        [Fonts setLang:LANG_ENGLISH];
    
    else if( self.currentIndexPath.row == 1 && [[Fonts lang] isEqualToString:LANG_CHINESE] == NO )
        [Fonts setLang:LANG_CHINESE];
    
    else if( self.currentIndexPath.row == 2 && [[Fonts lang] isEqualToString:LANG_JAPANESE] == NO )
        [Fonts setLang:LANG_JAPANESE];
    
    [[FontsManager shareManager] update];
    [[NSNotificationCenter defaultCenter] postNotificationName:DidFontLanguageChangeNotification object:nil];
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
