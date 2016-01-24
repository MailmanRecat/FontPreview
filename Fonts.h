//
//  Fonts.h
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const LANG_ENGLISH  = @"ENGLISH";
static NSString *const LANG_CHINESE  = @"CHINSES";
static NSString *const LANG_JAPANESE = @"JAPANESE";

@interface Fonts : NSObject

+ (NSArray *)Fonts;

+ (void)setLang:(NSString *)lang;

@end
