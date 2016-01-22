//
//  FontsManager.h
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FontAsset.h"

static NSString *const FontLanguageEnglish  = @"Fonts";
static NSString *const FontLanguageChinese  = @"字体";
static NSString *const FontLanguageJapanese = @"";

@interface FontsManager : NSObject

@property( nonatomic, strong ) NSArray<FontAsset *> *fonts;
@property( nonatomic, strong ) NSArray *langs;

@property( nonatomic, strong ) NSString *currentLanguage;

+ (instancetype)shareManager;

@end
