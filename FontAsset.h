//
//  FontAsset.h
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontAsset : NSObject

@property( nonatomic, strong ) NSString   *name;
@property( nonatomic, strong ) NSString   *introFontName;
@property( nonatomic, strong ) NSString   *fontName;
@property( nonatomic, assign ) NSUInteger  type;
@property( nonatomic, strong ) NSString   *PostScriptName;

+ (instancetype)assetFromName:(NSString *)name
                introFontName:(NSString *)introFontName
                     fontName:(NSString *)fontName
               postScriptName:(NSString *)scriptName
                         type:(NSUInteger)type;

@end
