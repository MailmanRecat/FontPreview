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

+ (NSString *)lang{
    NSString *l = [[NSUserDefaults standardUserDefaults] stringForKey:CURRENT_LANG_KEY];
    if( l == nil ){
        l =  LANG_ENGLISH;
        [[NSUserDefaults standardUserDefaults] setObject:l forKey:CURRENT_LANG_KEY];
    }
    
    return l;
}

+ (NSArray *)Fonts{
    
//    NSLog(@"%@", [UIFont familyNames]);
//    NSString *target = @"yuanti";
//    [[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString *name, NSUInteger index, BOOL *sS){
//        if( [[name lowercaseString] rangeOfString:target].location != NSNotFound ){
//            NSLog(@"%@", name);
//        }
//    }];
//    NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Yuanti SC"]);
    
    NSString *l = [Fonts lang];
    
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
             [FontAsset assetFromName:@"San Francisco Display"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"SFUIDisplay-Regular"
                             fontName:@"SF UI Display"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"San Francisco Text"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"SFUIDisplay-Regular"
                             fontName:@"SF UI Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"San Francisco Compact Display"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"SFCompactDisplay-Medium"
                             fontName:@"SF Compact Display"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"San Francisco Compact Text"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"SF Compact Text"
                             fontName:@"SF Compact Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Roboto-Regular"
                             fontName:@"Roboto"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto Slab"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"RobotoSlab-Regular"
                             fontName:@"Roboto Slab"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto Mono"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"RobotoMono-Regular"
                             fontName:@"Roboto Mono"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto Condensed"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"RobotoCondensed-Regular"
                             fontName:@"Roboto Condensed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Menlo"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Menlo-Regular"
                             fontName:@"Menlo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Helvetica Neue"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Helvetica Neue"
                             fontName:@"Helvetica Neue"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Times New Roman"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Times New Roman"
                             fontName:@"Times New Roman"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ubuntu"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Ubuntu"
                             fontName:@"Ubuntu"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ubuntu Condensed"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Ubuntu Condensed"
                             fontName:@"Ubuntu Condensed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ubuntu mono"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Ubuntu mono"
                             fontName:@"Ubuntu mono"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aclonica"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Aclonica"
                             fontName:@"Aclonica"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arimo"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Arimo"
                             fontName:@"Arimo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Calligraffitti"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Calligraffitti"
                             fontName:@"Calligraffitti"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cherry Cream Soda"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Cherry Cream Soda"
                             fontName:@"Cherry Cream Soda"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chewy"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Chewy"
                             fontName:@"Chewy"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Coming Soon"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Coming Soon"
                             fontName:@"Coming Soon"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Schoolbell"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Schoolbell"
                             fontName:@"Schoolbell"
                                 type:TYPE_UNKNOW],
             
             ];
}

+ (NSArray *)chinsesFonts{
    return @[
             [FontAsset assetFromName:@"苹方 简体"
                                intro:@"苹方字体"
                        introFontName:@"PingFang SC"
                             fontName:@"PingFang SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"黑体 简体"
                                intro:@"黑体 简体"
                        introFontName:@"Heiti SC"
                             fontName:@"Heiti SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"圆体 简体"
                                intro:@"圆体 简体"
                        introFontName:@"STYuanti-SC-Regular"
                             fontName:@"Yuanti SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"宋体"
                                intro:@"宋体"
                        introFontName:@"SimSun"
                             fontName:@"SimSun"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"新宋体"
                                intro:@"新宋体"
                        introFontName:@"NSimSun"
                             fontName:@"NSimSun"
                                 type:TYPE_UNKNOW]
             
             ];
}

+ (NSArray *)japansesFonts{
    return @[
             [FontAsset assetFromName:@"Klee"
                                intro:@"フォント"
                        introFontName:@"Klee"
                             fontName:@"Klee"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"YuMincho +36p Kana"
                                intro:@"フォント"
                        introFontName:@"YuMincho +36p Kana"
                             fontName:@"YuMincho +36p Kana"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Tsukushi A Round Gothic"
                                intro:@"フォント"
                        introFontName:@"Tsukushi A Round Gothic"
                             fontName:@"Tsukushi A Round Gothic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Tsukushi B Round Gothic"
                                intro:@"フォント"
                        introFontName:@"Tsukushi B Round Gothic"
                             fontName:@"Tsukushi B Round Gothic"
                                 type:TYPE_UNKNOW]
             ];
}

@end
