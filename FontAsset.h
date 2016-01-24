//
//  FontAsset.h
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontAsset : NSObject

@property( nonatomic, strong ) NSString *name;
@property( nonatomic, strong ) NSString *intro;
@property( nonatomic, strong ) NSString *introFontName;
@property( nonatomic, strong ) NSString *fontName;
@property( nonatomic, strong ) NSString *type;

+ (instancetype)assetFromName:(NSString *)name
                        intro:(NSString *)intro introFontName:(NSString *)introFontName
                     fontName:(NSString *)fontName
                         type:(NSString *)type;

@end
