//
//  FontAsset.m
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "FontAsset.h"

@implementation FontAsset

+ (instancetype)assetFromAuth:(NSString *)auth
                         Name:(NSString *)name
                        intro:(NSString *)intro
                         font:(UIFont *)font
                     fontName:(NSString *)fontName
                         type:(NSString *)type{
    
    FontAsset *asset = [[FontAsset alloc] init];
    
    asset.auth     = auth;
    asset.name     = name;
    asset.intro    = intro;
    asset.font     = font;
    asset.fontName = fontName;
    asset.type     = type;
    
    return asset;
}

@end
