//
//  Fonts.h
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FontAsset.h"

static NSString *const LANG_ENGLISH  = @"ENGLISH";
static NSString *const LANG_CHINESE  = @"CHINESE";
static NSString *const LANG_JAPANESE = @"JAPANESE";

@interface Fonts : NSObject

+ (void)setLang:(NSString *)lang;
+ (NSString *)lang;

@end
