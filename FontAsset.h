//
//  FontAsset.h
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

//typedef struct FCAsset{
//    char *name;
//    char *introName;
//    char *fontName;
//    int   type;
//    char *postScriptName;
//} FCAsset;
//
//FCAsset FCAssetMake( char *name, char *introName, char *fontName, int type, char *postScriptName ){
//    FCAsset asset;
//    asset.name = name;
//    asset.introName = introName;
//    asset.fontName = fontName;
//    asset.type = type;
//    asset.postScriptName = postScriptName;
//    return asset;
//};

#import <UIKit/UIKit.h>

@interface FontAsset : NSObject

@property( nonatomic, strong ) NSString   *name;
@property( nonatomic, strong ) NSString   *introFontName;
@property( nonatomic, strong ) NSString   *fontName;
@property( nonatomic, assign ) NSUInteger  type;
@property( nonatomic, strong ) NSString   *PostScriptName;

+ (instancetype)assetFromName:(NSString *)name
                introFontName:(NSString *)introFontName
                     fontName:(NSString *)fontName
                         type:(NSUInteger)type;

+ (instancetype)assetFromName:(NSString *)name
                introFontName:(NSString *)introFontName
                     fontName:(NSString *)fontName
               postScriptName:(NSString *)scriptName
                         type:(NSUInteger)type;

@end
