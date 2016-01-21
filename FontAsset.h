//
//  FontAsset.h
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontAsset : NSObject

@property( nonatomic, strong ) NSString *auth;
@property( nonatomic, strong ) NSString *name;
@property( nonatomic, strong ) NSString *intro;
@property( nonatomic, strong ) UIFont   *font;
@property( nonatomic, strong ) NSString *fontName;
@property( nonatomic, strong ) NSString *type;

+ (instancetype)assetFromAuth:(NSString *)auth
                         Name:(NSString *)name
                        intro:(NSString *)intro
                         font:(UIFont *)font
                     fontName:(NSString *)fontName
                         type:(NSString *)type;

@end
