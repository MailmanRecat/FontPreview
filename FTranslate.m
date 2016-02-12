//
//  FTranslate.m
//  FontPreview
//
//  Created by caine on 2/6/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "FTranslate.h"
#import "FCachePreviewText.h"

@interface FTranslate()

@property( nonatomic, strong ) NSDictionary *keysAndValues;

@end

@implementation FTranslate

- (NSString *)stringFromString:(NSString *)string{
    return [[self.keysAndValues objectForKey:[FontsManager shareManager].lang] objectForKey:string];
}

+ (instancetype)standarTranslate{
    static FTranslate *translate;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        translate = [[FTranslate alloc] init];
    });
    return translate;
}

- (instancetype)init{
    self = [super init];
    if( self ){
        
        [self reload];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reload)
                                                     name:FTextPreviewDidChangeNotification
                                                   object:nil];
        
    }
    return self;
}

- (void)reload{
    self.keysAndValues = @{
                           @"ENGLISH" : @{
                                   FTTitleLang: @"Fonts",
                                   FTItemLang: @"English",
                                   FTLangsType: @"fonts",
                                   FTPreviewText: [FCachePreviewText previewTextFromName:TEXT_PREVIEW_ENGLISH_CACHE],
                                   FTTextPreview: @"Text preview",
                                   FTFontSize: @"Fontsize",
                                   FTFontWeight: @"Font weight",
                                   FTCancelDownload: @"Cancel download",
                                   FTStartDownload: @"Start download",
                                   FTFinishDownload: @"Finished download",
                                   FTDownload: @"Download",
                                   FTFontFileSize: @"File size"
                                   },
                           @"CHINESE" : @{
                                   FTTitleLang: @"字体",
                                   FTItemLang: @"中文",
                                   FTLangsType: @"种字体",
                                   FTPreviewText: [FCachePreviewText previewTextFromName:TEXT_PREVIEW_CHINESE_CACHE],
                                   FTTextPreview: @"字体预览",
                                   FTFontSize: @"字体大小",
                                   FTFontWeight: @"字体重量",
                                   FTCancelDownload: @"取消下载",
                                   FTStartDownload: @"正在开始下载",
                                   FTFinishDownload: @"下载完成",
                                   FTDownload: @"下载此字体",
                                   FTFontFileSize: @"字体容量"
                                   },
                           @"JAPANESE": @{
                                   FTTitleLang: @"フォント",
                                   FTItemLang: @"日本語",
                                   FTLangsType: @"フォント",
                                   FTPreviewText: [FCachePreviewText previewTextFromName:TEXT_PREVIEW_JAPANESE_CACHE],
                                   FTTextPreview: @"プレビュー",
                                   FTFontSize: @"フォントサイズ",
                                   FTFontWeight: @"フォントの重さ",
                                   FTCancelDownload: @"ダウンロードをキャンセル",
                                   FTStartDownload: @"ダウンロードを開始",
                                   FTFinishDownload: @"完全なダウンロード",
                                   FTDownload: @"ダウンロード",
                                   FTFontFileSize: @"フォントの容量"
                                   }
                           };
}

@end
