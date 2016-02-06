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
                         type:(NSString *)type{
    
    FontAsset *asset = [[FontAsset alloc] init];
    
    asset.name          = name;
    asset.introFontName = introFontName;
    asset.fontName      = fontName;
    asset.type          = type;
    
    return asset;
}

@end
