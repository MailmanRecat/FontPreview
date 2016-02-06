//
//  cachePreviewText.m
//  FontPreview
//
//  Created by caine on 2/4/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "cachePreviewText.h"

@implementation cachePreviewText

+ (NSMutableArray *)allPreviewTexts{
    return [[NSMutableArray alloc] initWithArray:@[
                                                   [self previewTextFromName:TEXT_PREVIEW_ENGLISH_CACHE],
                                                   [self previewTextFromName:TEXT_PREVIEW_CHINESE_CACHE],
                                                   [self previewTextFromName:TEXT_PREVIEW_JAPANESE_CACHE]
                                                   ]];
}

+ (NSString *)previewTextFromName:(NSString *)name{    
    NSString *text = [[NSUserDefaults standardUserDefaults] stringForKey:name];
    if( text == nil ){
        [[NSUserDefaults standardUserDefaults] setObject:[self defaultShorcutFromName:name] forKey:name];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        text = [self defaultShorcutFromName:name];
    }
    
    return text;
}

+ (void)letPreviewText:(NSString *)text withName:(NSString *)name{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FTextPreviewDidChangeNotification
                                                        object:nil
                                                      userInfo:nil];
    
    [[NSUserDefaults standardUserDefaults] setObject:text forKey:name];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)resetDefault{
    [[NSNotificationCenter defaultCenter] postNotificationName:FTextPreviewDidChangeNotification
                                                        object:nil
                                                      userInfo:nil];
    
    [[NSUserDefaults standardUserDefaults] setObject:[self defaultShorcutFromName:TEXT_PREVIEW_ENGLISH_CACHE]
                                              forKey:TEXT_PREVIEW_ENGLISH_CACHE];
    [[NSUserDefaults standardUserDefaults] setObject:[self defaultShorcutFromName:TEXT_PREVIEW_CHINESE_CACHE]
                                              forKey:TEXT_PREVIEW_CHINESE_CACHE];
    [[NSUserDefaults standardUserDefaults] setObject:[self defaultShorcutFromName:TEXT_PREVIEW_JAPANESE_CACHE]
                                              forKey:TEXT_PREVIEW_JAPANESE_CACHE];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)defaultShorcutFromName:(NSString *)name{
    return [@{
              TEXT_PREVIEW_ENGLISH_CACHE : @"the quick brown fox jumps over the lazy dog",
              TEXT_PREVIEW_CHINESE_CACHE : @"棕色狐狸跃过懒惰的狗",
              TEXT_PREVIEW_JAPANESE_CACHE: @"速い茶色のキツネは、のろまなイヌに飛びかかっ"
              } objectForKey:name];
}

@end
