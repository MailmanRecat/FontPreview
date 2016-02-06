//
//  FTranslate.h
//  FontPreview
//
//  Created by caine on 2/6/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FontsManager.h"

static NSString *const FTLangsType      = @"FT_KEY_LANGS_TYPE";
static NSString *const FTTitleLang      = @"FT_KEY_TITLE_LANG";
static NSString *const FTItemLang       = @"FT_KEY_ITEM_LANG";
static NSString *const FTPreviewText    = @"FT_KEY_PREVIEW_TEXT";
static NSString *const FTStartDownload  = @"FT_KEY_DOWNLOAD_START";
static NSString *const FTCancelDownload = @"FT_KEY_DOWNLOAD_CANCEL";
static NSString *const FTFinishDownload = @"FT_KEY_DOWNLOAD_FINISHED";
static NSString *const FTDownload       = @"FT_KEY_DOWNLOAD";
static NSString *const FTTextPreview    = @"FT_KEY_TEXT_PREVIEW";
static NSString *const FTFontSize       = @"FT_KEY_FONT_SIZE";
static NSString *const FTFontWeight     = @"FT_KEY_FONT_WEIGHT";
static NSString *const FTFontFileSize   = @"FT_KEY_FILE_FONT_SIZE";

@interface FTranslate : NSObject

+ (instancetype)standarTranslate;

- (void)reload;
- (NSString *)stringFromString:(NSString *)string;

@end
