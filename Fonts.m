//
//  Fonts.m
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "Fonts.h"
#import "FontAsset.h"

static NSString *const THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG = @"the quick brown fox jumps over the lazy dog";
static NSString *const TYPE_UNKNOW = @"Unknow";

static NSString *const CURRENT_LANG_KEY = @"CURRENT_LANG_KEY";

@implementation Fonts

+ (void)setLang:(NSString *)lang{
    [[NSUserDefaults standardUserDefaults] setObject:lang forKey:CURRENT_LANG_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSArray *)Fonts{
    
    NSLog(@"%@", [UIFont familyNames]);
//    NSLog(@"%@", [UIFont fontNamesForFamilyName:@"PingFang SC"]);
    
    NSString *l = [[NSUserDefaults standardUserDefaults] stringForKey:CURRENT_LANG_KEY];
    if( l == nil ){
        l =  LANG_ENGLISH;
        [[NSUserDefaults standardUserDefaults] setObject:l forKey:CURRENT_LANG_KEY];
    }
    
    if( [l isEqualToString:LANG_ENGLISH] )
        return [Fonts englishFonts];
    
    if( [l isEqualToString:LANG_CHINESE] )
        return [Fonts chinsesFonts];
    
    if( [l isEqualToString:LANG_JAPANESE] )
        return [Fonts japansesFonts];

    return [Fonts englishFonts];
}

+ (NSArray *)englishFonts{
    return @[
             [FontAsset assetFromAuth:@"SF-UI-Display"
                                 Name:@"San Francisco Display"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"SFUIDisplay-Regular" size:17]
                             fontName:@"SF UI Display"
                               prefix:@"SFUIDisplay-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"SF-UI-Text"
                                 Name:@"San Francisco Text"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"SFUIDisplay-Regular" size:17]
                             fontName:@"SF UI Text"
                               prefix:@"SFUIText-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"SF-Compact-Display"
                                 Name:@"San Francisco Compact Display"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"SFCompactDisplay-Medium" size:17]
                             fontName:@"SF Compact Display"
                               prefix:@"SFCompactDisplay-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"SF-Compact-Text"
                                 Name:@"San Francisco Compact Text"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"SF Compact Text" size:17]
                             fontName:@"SF Compact Text"
                               prefix:@"SFCompactText-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Roboto"
                                 Name:@"Roboto"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"Roboto-Regular" size:17]
                             fontName:@"Roboto"
                               prefix:@"Roboto-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Menlo"
                                 Name:@"Menlo"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"Menlo-Regular" size:17]
                             fontName:@"Menlo"
                               prefix:@"Menlo-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Helvetica Neue"
                                 Name:@"Helvetica Neue"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"Helvetica Neue" size:17]
                             fontName:@"Helvetica Neue"
                               prefix:@"HelveticaNeue-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Times New Roman"
                                 Name:@"Times New Roman"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"Times New Roman" size:17]
                             fontName:@"Times New Roman"
                               prefix:@"TimesNewRomanPS-"
                                 type:TYPE_UNKNOW]
             ];
}

+ (NSArray *)chinsesFonts{
    return @[
             [FontAsset assetFromAuth:@"PingFang SC"
                                 Name:@"苹方 简体"
                                intro:@"苹方字体"
                                 font:[UIFont fontWithName:@"PingFang SC" size:17]
                             fontName:@"PingFang SC"
                               prefix:@"PingFangSC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Heiti SC"
                                 Name:@"黑体 简体"
                                intro:@"黑体 简体"
                                 font:[UIFont fontWithName:@"Heiti SC" size:17]
                             fontName:@"Heiti SC"
                               prefix:@"Heiti SC"
                                 type:TYPE_UNKNOW],
             ];
}

+ (NSArray *)japansesFonts{
    return @[
             
             ];
}

@end
