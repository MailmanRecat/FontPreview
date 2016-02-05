//
//  Fonts.m
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "Fonts.h"
#import "FontAsset.h"

static NSString *const THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG = @"the quick brown fox jumps over the lazy dog";
static NSString *const TYPE_UNKNOW = @"Unknow";

static NSString *const CURRENT_LANG_KEY = @"CURRENT_LANG_KEY";

@implementation Fonts

+ (void)setLang:(NSString *)lang{
    [[NSUserDefaults standardUserDefaults] setObject:lang forKey:CURRENT_LANG_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)lang{
    NSString *l = [[NSUserDefaults standardUserDefaults] stringForKey:CURRENT_LANG_KEY];
    if( l == nil ){
        l =  LANG_ENGLISH;
        [[NSUserDefaults standardUserDefaults] setObject:l forKey:CURRENT_LANG_KEY];
    }
    
    return l;
}

+ (NSArray *)Fonts{
    
//    NSLog(@"%@", [UIFont familyNames]);
    NSString *target = @"anton";
    [[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString *name, NSUInteger index, BOOL *sS){
        if( [[name lowercaseString] rangeOfString:target].location != NSNotFound ){
            NSLog(@"%@", name);
        }
    }];
//    NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Elsie"]);
    
    NSString *l = [Fonts lang];
    
    if( [l isEqualToString:LANG_ENGLISH] )
        return [Fonts englishFonts];
    
    if( [l isEqualToString:LANG_CHINESE] )
        return [Fonts chinsesFonts];
    
    if( [l isEqualToString:LANG_JAPANESE] )
        return [Fonts japansesFonts];

    return [Fonts englishFonts];
}

+ (NSArray *)englishFonts{
    return @[
             [FontAsset assetFromName:@"San Francisco Display"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"SFUIDisplay-Regular"
                             fontName:@"SF UI Display"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"San Francisco Text"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"SFUIDisplay-Regular"
                             fontName:@"SF UI Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"San Francisco Compact Display"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"SFCompactDisplay-Medium"
                             fontName:@"SF Compact Display"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"San Francisco Compact Text"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"SF Compact Text"
                             fontName:@"SF Compact Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Roboto-Regular"
                             fontName:@"Roboto"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto Slab"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"RobotoSlab-Regular"
                             fontName:@"Roboto Slab"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto Mono"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"RobotoMono-Regular"
                             fontName:@"Roboto Mono"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto Condensed"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"RobotoCondensed-Regular"
                             fontName:@"Roboto Condensed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Menlo"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Menlo-Regular"
                             fontName:@"Menlo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Helvetica Neue"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Helvetica Neue"
                             fontName:@"Helvetica Neue"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Times New Roman"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Times New Roman"
                             fontName:@"Times New Roman"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Georgia"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Georgia"
                             fontName:@"Georgia"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ubuntu"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Ubuntu"
                             fontName:@"Ubuntu"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ubuntu Condensed"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Ubuntu Condensed"
                             fontName:@"Ubuntu Condensed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ubuntu mono"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Ubuntu mono"
                             fontName:@"Ubuntu mono"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Futura"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Futura"
                             fontName:@"Futura"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Optima"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Optima"
                             fontName:@"Optima"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Verdana"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Verdana"
                             fontName:@"Verdana"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Didot"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Didot"
                             fontName:@"Didot"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Iowan Old Style"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Iowan Old Style"
                             fontName:@"Iowan Old Style"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Marker Felt"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Marker Felt"
                             fontName:@"Marker Felt"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gill Sans"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Gill Sans"
                             fontName:@"Gill Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Avenir"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Avenir"
                             fontName:@"Avenir"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Copperplate"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Copperplate"
                             fontName:@"Copperplate"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"American TypeWriter"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"American TypeWriter"
                             fontName:@"American TypeWriter"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arial"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Arial"
                             fontName:@"Arial"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arial Hebrew"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Arial Hebrew"
                             fontName:@"Arial Hebrew"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aclonica"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Aclonica"
                             fontName:@"Aclonica"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arimo"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Arimo"
                             fontName:@"Arimo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Calligraffitti"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Calligraffitti"
                             fontName:@"Calligraffitti"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cherry Cream Soda"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Cherry Cream Soda"
                             fontName:@"Cherry Cream Soda"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chewy"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Chewy"
                             fontName:@"Chewy"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Coming Soon"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Coming Soon"
                             fontName:@"Coming Soon"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Schoolbell"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Schoolbell"
                             fontName:@"Schoolbell"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"UnifrakturMaguntia"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"UnifrakturMaguntia"
                             fontName:@"UnifrakturMaguntia"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Montserrat"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Montserrat"
                             fontName:@"Montserrat"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lora"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Lora"
                             fontName:@"Lora"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"PT Sans"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"PT Sans"
                             fontName:@"PT Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"PT Sans Caption"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"PT Sans Caption"
                             fontName:@"PT Sans Caption"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"PT Sans Narrow"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"PT Sans Narrow"
                             fontName:@"PT Sans Narrow"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lobster"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Lobster"
                             fontName:@"Lobster"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lobster Two"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Lobster Two"
                             fontName:@"Lobster Two"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Muli"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Muli"
                             fontName:@"Muli"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Orbitron"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Orbitron"
                             fontName:@"Orbitron"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Exo"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Exo-Regular"
                             fontName:@"Exo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Exo 2"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Exo 2-Regular"
                             fontName:@"Exo 2"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"ABeeZee"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"ABeeZee"
                             fontName:@"ABeeZee"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Abel"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Abel"
                             fontName:@"Abel"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Abhaya Libre"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Abhaya Libre"
                             fontName:@"Abhaya Libre"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"JejuGothic"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"JejuGothic"
                             fontName:@"JejuGothic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Elsie"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Elsie"
                             fontName:@"Elsie"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Podkova"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Podkova"
                             fontName:@"Podkova"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Abril Fatface"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Abril Fatface"
                             fontName:@"Abril Fatface"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Abyssinica SIL"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Abyssinica SIL"
                             fontName:@"Abyssinica SIL"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Acme"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Acme"
                             fontName:@"Acme"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Actor"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Actor"
                             fontName:@"Actor"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Advent Pro"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Advent Pro-Regular"
                             fontName:@"Advent Pro"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aguafina Script"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Aguafina Script"
                             fontName:@"Aguafina Script"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Adamina"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Adamina"
                             fontName:@"Adamina"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Akronim"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Akronim"
                             fontName:@"Akronim"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aksara Bali Galang"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Aksara Bali Galang"
                             fontName:@"Aksara Bali Galang"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aladin"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Aladin"
                             fontName:@"Aladin"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aldrich"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Aldrich"
                             fontName:@"Aldrich"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alef"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Alef"
                             fontName:@"Alef"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alegreya"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Alegreya"
                             fontName:@"Alegreya"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alegreya SC"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Alegreya SC"
                             fontName:@"Alegreya SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alegreya Sans SC"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Alegreya Sans SC-Regular"
                             fontName:@"Alegreya Sans SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alex Brush"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Alex Brush"
                             fontName:@"Alex Brush"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alfa Slab One"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Alfa Slab One"
                             fontName:@"Alfa Slab One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alice"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Alice"
                             fontName:@"Alice"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alike"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Alike"
                             fontName:@"Alike"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alike Angular"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Alike Angular"
                             fontName:@"Alike Angular"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Allan"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Allan"
                             fontName:@"Allan"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Allerta"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Allerta"
                             fontName:@"Allerta"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Allerta Stencil"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Allerta Stencil"
                             fontName:@"Allerta Stencil"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Allura"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Allura"
                             fontName:@"Allura"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Almendra"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Almendra"
                             fontName:@"Almendra"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Almendra SC"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Almendra SC"
                             fontName:@"Almendra SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Almendra Display"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Almendra Display"
                             fontName:@"Almendra Display"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amatic SC"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Amatic SC"
                             fontName:@"Amatic SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amaranth"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Amaranth"
                             fontName:@"Amaranth"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amarante"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Amarante"
                             fontName:@"Amarante"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amethysta"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Amethysta"
                             fontName:@"Amethysta"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Angkor"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Angkor"
                             fontName:@"Angkor"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Andika"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Andika"
                             fontName:@"Andika"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Andada"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Andada"
                             fontName:@"Andada"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Andada SC"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Andada SC"
                             fontName:@"Andada SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Anaheim"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Anaheim"
                             fontName:@"Anaheim"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amita"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Amita"
                             fontName:@"Amita"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amiri"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Amiri"
                             fontName:@"Amiri"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arbutus"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Arbutus"
                             fontName:@"Arbutus"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arbutus Slab"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Arbutus Slab"
                             fontName:@"Arbutus Slab"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arapey"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Arapey"
                             fontName:@"Arapey"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Anton"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Anton"
                             fontName:@"Anton"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Antonio"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Antonio-Regular"
                             fontName:@"Antonio"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Antic"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Antic"
                             fontName:@"Antic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Antic Slab"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Antic Slab"
                             fontName:@"Antic Slab"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Antic Didone"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Antic Didone"
                             fontName:@"Antic Didone"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Anonymous Pro"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Anonymous Pro"
                             fontName:@"Anonymous Pro"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Annie Use Your Telescope"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                        introFontName:@"Annie Use Your Telescope"
                             fontName:@"Annie Use Your Telescope"
                                 type:TYPE_UNKNOW],
             
             ];
}

+ (NSArray *)chinsesFonts{
    return @[
             [FontAsset assetFromName:@"苹方 简体"
                                intro:@"苹方字体"
                        introFontName:@"PingFang SC"
                             fontName:@"PingFang SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"黑体 简体"
                                intro:@"黑体 简体"
                        introFontName:@"Heiti SC"
                             fontName:@"Heiti SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"圆体 简体"
                                intro:@"圆体 简体"
                        introFontName:@"STYuanti-SC-Regular"
                             fontName:@"Yuanti SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"宋体"
                                intro:@"宋体"
                        introFontName:@"SimSun"
                             fontName:@"SimSun"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"新宋体"
                                intro:@"新宋体"
                        introFontName:@"NSimSun"
                             fontName:@"NSimSun"
                                 type:TYPE_UNKNOW]
             
             ];
}

+ (NSArray *)japansesFonts{
    return @[
             [FontAsset assetFromName:@"Klee"
                                intro:@"フォント"
                        introFontName:@"Klee"
                             fontName:@"Klee"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"YuMincho +36p Kana"
                                intro:@"フォント"
                        introFontName:@"YuMincho +36p Kana"
                             fontName:@"YuMincho +36p Kana"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Tsukushi A Round Gothic"
                                intro:@"フォント"
                        introFontName:@"Tsukushi A Round Gothic"
                             fontName:@"Tsukushi A Round Gothic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Tsukushi B Round Gothic"
                                intro:@"フォント"
                        introFontName:@"Tsukushi B Round Gothic"
                             fontName:@"Tsukushi B Round Gothic"
                                 type:TYPE_UNKNOW]
             ];
}

@end
