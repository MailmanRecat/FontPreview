//
//  Fonts.m
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "Fonts.h"

static NSUInteger      TYPE_UNKNOW = 0;
static NSString *const CURRENT_LANG_KEY = @"CURRENT_LANG_KEY_NEW";

@interface Fonts()

@end

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

//+ (void)transfer{
//    NSArray *transfer = [self englishFonts];
//    
//    __block NSUInteger counter = 0;
//    __block NSMutableString *r = [[NSMutableString alloc] init];
//    [transfer enumerateObjectsUsingBlock:^(FontAsset *asset, NSUInteger index, BOOL *sS){
//        [r appendFormat:@"_fonts_EN[%ld] = CFAssetMake(\"%@\", \"%@\", \"%@\", 0, nil); \n", counter++, asset.name, asset.introFontName, asset.fontName];
//    }];
//    
//    [r writeToFile:@"/users/caine/downloads/frifeben.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
//    
//    NSLog(@"over");
//}


+ (NSArray *)chinsesFonts{
    return @[
             [FontAsset assetFromName:@"苹方简体"
                        introFontName:@"PingFang SC"
                             fontName:@"PingFang SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"黑体"
                        introFontName:@"Heiti SC"
                             fontName:@"Heiti SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"报隶"
                        introFontName:@"Baoli SC"
                             fontName:@"STBaoli-SC-Regular"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"点阵体 GB18030"
                        introFontName:@"GB18030 Bitmap"
                             fontName:@"GB18030 Bitmap"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"华康手札简体"
                        introFontName:@"Hannotate SC"
                             fontName:@"Hannotate SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"华康翩翩简体"
                        introFontName:@"HanziPen SC"
                             fontName:@"HanziPen SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"苹果丽黑"
                        introFontName:@"Hiragino Sans GB"
                             fontName:@"Hiragino Sans GB"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"楷书简体"
                        introFontName:@"Kaiti SC"
                             fontName:@"Kaiti SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"兰亭黑简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"方正隶变简体"
                        introFontName:@"Libian SC"
                             fontName:@"Libian SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"兰亭黑简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             [FontAsset assetFromName:@"兰亭黑 简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             [FontAsset assetFromName:@"兰亭黑 简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             [FontAsset assetFromName:@"兰亭黑 简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             
             ];
}

@end
