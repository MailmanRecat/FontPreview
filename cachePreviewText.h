//
//  cachePreviewText.h
//  FontPreview
//
//  Created by caine on 2/4/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const TEXT_PREVIEW_ENGLISH_CACHE  = @"TEXT_PREVIEW_ENGLISH_CACHE";
static NSString *const TEXT_PREVIEW_CHINESE_CACHE  = @"TEXT_PREVIEW_CHINESE_CACHE";
static NSString *const TEXT_PREVIEW_JAPANESE_CACHE = @"TEXT_PREVIEW_JAPANESE_CACHE";

@interface cachePreviewText : NSObject

+ (NSMutableArray *)allPreviewTexts;
+ (NSString *)previewTextFromName:(NSString *)name;
+ (void)letPreviewText:(NSString *)text withName:(NSString *)name;
+ (void)resetDefault;

@end
