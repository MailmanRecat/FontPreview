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
               postScriptName:(NSString *)scriptName
                         type:(NSUInteger)type{
    
    FontAsset *fa    = [[FontAsset alloc] init];
    fa.name           = name;
    fa.introFontName  = introFontName ? : name;
    fa.fontName       = fontName ? : name;
    fa.type           = type;
    fa.PostScriptName = scriptName;
    
    return fa;
}

@end
