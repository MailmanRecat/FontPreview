//
//  CFAsset.h
//  FontPreview
//
//  Created by caine on 2/11/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "FontsManager.h"

struct CFAsset{
    char *name;
    char *introName;
    char *fontName;
    int   type;
    char *postScriptName;
};
typedef struct CFAsset CFAsset;

CFAsset
CFAssetMake( char *name, char *introName, char *fontName, int type, char *postScriptName );

@interface CFonts : NSObject

+ (instancetype)shareFonts;

- (NSUInteger)numberOfFonts;
- (CFAsset)CFAssetAtIndex:(NSUInteger)index;
- (FontAsset *)fontAssetFronCFAsset:(CFAsset)c;
- (NSArray *)searchFonts:(NSString *)key;

@end