//
//  FontAsset.m
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "FontAsset.h"

@implementation FontAsset

+ (instancetype)assetFromName:(NSString *)name
                introFontName:(NSString *)introFontName
                     fontName:(NSString *)fontName
                         type:(NSUInteger)type{
    
    FontAsset *asset = [[FontAsset alloc] init];
    
    asset.name          = name;
    asset.introFontName = introFontName ? : name;
    asset.fontName      = fontName ? : name;
    asset.type          = type;
    
    return asset;
}

+ (instancetype)assetFromName:(NSString *)name
                introFontName:(NSString *)introFontName
                     fontName:(NSString *)fontName
               postScriptName:(NSString *)scriptName
                         type:(NSUInteger)type{
    FontAsset *asset = [FontAsset assetFromName:name
                                  introFontName:introFontName
                                       fontName:fontName
                                           type:type];
    asset.PostScriptName = scriptName;
    
    return asset;
}

@end
