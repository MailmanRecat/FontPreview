//
//  Fonts.m
//  FontPreview
//
//  Created by caine on 1/21/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "Fonts.h"
#import "FontAsset.h"

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
    
//    NSString *target = @"hei";
//    [[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString *name, NSUInteger index, BOOL *sS){
//        if( [[name lowercaseString] rangeOfString:target].location != NSNotFound ){
//            NSLog(@"%@", name);
//            NSLog(@"%@", [UIFont fontNamesForFamilyName:name]);
//        }
//    }];
    
//    NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Kohinoor Bangla"]);
    
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
                        introFontName:@"SFUIDisplay-Regular"
                             fontName:@"SF UI Display"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"San Francisco Text"
                        introFontName:@"SFUIDisplay-Regular"
                             fontName:@"SF UI Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"San Francisco Compact Display"
                        introFontName:@"SFCompactDisplay-Medium"
                             fontName:@"SF Compact Display"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"San Francisco Compact Text"
                        introFontName:@"SF Compact Text"
                             fontName:@"SF Compact Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto"
                        introFontName:@"Roboto-Regular"
                             fontName:@"Roboto"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto Slab"
                        introFontName:@"RobotoSlab-Regular"
                             fontName:@"Roboto Slab"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto Mono"
                        introFontName:@"RobotoMono-Regular"
                             fontName:@"Roboto Mono"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Roboto Condensed"
                        introFontName:@"RobotoCondensed-Regular"
                             fontName:@"Roboto Condensed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Menlo"
                        introFontName:@"Menlo-Regular"
                             fontName:@"Menlo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Helvetica"
                        introFontName:@"Helvetica"
                             fontName:@"Helvetica"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Helvetica Neue"
                        introFontName:@"Helvetica Neue"
                             fontName:@"Helvetica Neue"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Times New Roman"
                        introFontName:@"Times New Roman"
                             fontName:@"Times New Roman"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Georgia"
                        introFontName:@"Georgia"
                             fontName:@"Georgia"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ubuntu"
                        introFontName:@"Ubuntu"
                             fontName:@"Ubuntu"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ubuntu Condensed"
                        introFontName:@"Ubuntu Condensed"
                             fontName:@"Ubuntu Condensed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ubuntu mono"
                        introFontName:@"Ubuntu mono"
                             fontName:@"Ubuntu mono"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Futura"
                        introFontName:@"Futura"
                             fontName:@"Futura"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Optima"
                        introFontName:@"Optima"
                             fontName:@"Optima"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Verdana"
                        introFontName:@"Verdana"
                             fontName:@"Verdana"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Didot"
                        introFontName:@"Didot"
                             fontName:@"Didot"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Iowan Old Style"
                        introFontName:@"Iowan Old Style"
                             fontName:@"Iowan Old Style"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Marker Felt"
                        introFontName:@"Marker Felt"
                             fontName:@"Marker Felt"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gill Sans"
                        introFontName:@"Gill Sans"
                             fontName:@"Gill Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Avenir"
                        introFontName:@"Avenir"
                             fontName:@"Avenir"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Avenir Next Condensed"
                        introFontName:@"Avenir Next Condensed"
                             fontName:@"Avenir Next Condensed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Copperplate"
                        introFontName:@"Copperplate"
                             fontName:@"Copperplate"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"American TypeWriter"
                        introFontName:@"American TypeWriter"
                             fontName:@"American TypeWriter"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arial"
                        introFontName:@"Arial"
                             fontName:@"Arial"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arial Hebrew"
                        introFontName:@"Arial Hebrew"
                             fontName:@"Arial Hebrew"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aclonica"
                        introFontName:@"Aclonica"
                             fontName:@"Aclonica"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arimo"
                        introFontName:@"Arimo"
                             fontName:@"Arimo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Calligraffitti"
                        introFontName:@"Calligraffitti"
                             fontName:@"Calligraffitti"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cherry Cream Soda"
                        introFontName:@"Cherry Cream Soda"
                             fontName:@"Cherry Cream Soda"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chewy"
                        introFontName:@"Chewy"
                             fontName:@"Chewy"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Coming Soon"
                        introFontName:@"Coming Soon"
                             fontName:@"Coming Soon"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Schoolbell"
                        introFontName:@"Schoolbell"
                             fontName:@"Schoolbell"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"UnifrakturMaguntia"
                        introFontName:@"UnifrakturMaguntia"
                             fontName:@"UnifrakturMaguntia"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Montserrat"
                        introFontName:@"Montserrat"
                             fontName:@"Montserrat"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lora"
                        introFontName:@"Lora"
                             fontName:@"Lora"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"PT Sans"
                        introFontName:@"PT Sans"
                             fontName:@"PT Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"PT Sans Caption"
                        introFontName:@"PT Sans Caption"
                             fontName:@"PT Sans Caption"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"PT Sans Narrow"
                        introFontName:@"PT Sans Narrow"
                             fontName:@"PT Sans Narrow"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lobster"
                        introFontName:@"Lobster"
                             fontName:@"Lobster"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lobster Two"
                        introFontName:@"Lobster Two"
                             fontName:@"Lobster Two"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Muli"
                        introFontName:@"Muli"
                             fontName:@"Muli"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Orbitron"
                        introFontName:@"Orbitron"
                             fontName:@"Orbitron"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Academy Engraved LET"
                        introFontName:@"Academy Engraved LET"
                             fontName:@"Academy Engraved LET"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hoefler Text"
                        introFontName:@"Hoefler Text"
                             fontName:@"Hoefler Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kohinoor Telugu"
                        introFontName:@"Kohinoor Telugu"
                             fontName:@"Kohinoor Telugu"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kohinoor Bangla"
                        introFontName:@"KohinoorBangla-Regular"
                             fontName:@"Kohinoor Bangla"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kohinoor Devanagari"
                        introFontName:@"KohinoorDevanagari-Regular"
                             fontName:@"Kohinoor Devanagari"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Thonburi"
                        introFontName:@"Thonburi"
                             fontName:@"Thonburi"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cochin"
                        introFontName:@"Cochin"
                             fontName:@"Cochin"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Courier"
                        introFontName:@"Courier"
                             fontName:@"Courier"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Courier New"
                        introFontName:@"Courier New"
                             fontName:@"Courier New"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Apple SD Gothic Neo"
                        introFontName:@"Apple SD Gothic Neo"
                             fontName:@"Apple SD Gothic Neo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Tamil Sangam MN"
                        introFontName:@"Tamil Sangam MN"
                             fontName:@"Tamil Sangam MN"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gurmukhi MN"
                        introFontName:@"Gurmukhi MN"
                             fontName:@"Gurmukhi MN"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kailasa"
                        introFontName:@"Kailasa"
                             fontName:@"Kailasa"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Damascus"
                        introFontName:@"Damascus"
                             fontName:@"Damascus"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Noteworthy"
                        introFontName:@"Noteworthy"
                             fontName:@"Noteworthy"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Geeza Pro"
                        introFontName:@"Geeza Pro"
                             fontName:@"Geeza Pro"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Mishafi"
                        introFontName:@"Mishafi"
                             fontName:@"Mishafi"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Farah"
                        introFontName:@"Farah"
                             fontName:@"Farah"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Palatino"
                        introFontName:@"Palatino"
                             fontName:@"Palatino"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Al Nile"
                        introFontName:@"Al Nile"
                             fontName:@"Al Nile"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bradley Hand"
                        introFontName:@"Bradley Hand"
                             fontName:@"Bradley Hand"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Trebuchet MS"
                        introFontName:@"Trebuchet MS"
                             fontName:@"Trebuchet MS"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hiragino Sans"
                        introFontName:@"Hiragino Sans"
                             fontName:@"Hiragino Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hiragino Mincho ProN"
                        introFontName:@"Hiragino Mincho ProN"
                             fontName:@"Hiragino Mincho ProN"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Devanagari Sangam MN"
                        introFontName:@"Devanagari Sangam MN"
                             fontName:@"Devanagari Sangam MN"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Oriya Sangam MN"
                        introFontName:@"OriyaSangamMN-Bold"
                             fontName:@"Oriya Sangam MN"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Zapf Dingbats"
                        introFontName:@"Zapf Dingbats"
                             fontName:@"Zapf Dingbats"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bodoni 72"
                        introFontName:@"Bodoni 72"
                             fontName:@"Bodoni 72"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bodoni 72 Smallcaps"
                        introFontName:@"Bodoni 72 Smallcaps"
                             fontName:@"Bodoni 72 Smallcaps"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bodoni 72 Oldstyle"
                        introFontName:@"Bodoni 72 Oldstyle"
                             fontName:@"Bodoni 72 Oldstyle"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baskerville"
                        introFontName:@"Baskerville"
                             fontName:@"Baskerville"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Khmer Sangam MN"
                        introFontName:@"Khmer Sangam MN"
                             fontName:@"Khmer Sangam MN"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Symbol"
                        introFontName:@"Symbol"
                             fontName:@"Symbol"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Papyrus"
                        introFontName:@"Papyrus"
                             fontName:@"Papyrus"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Euphemia UCAS"
                        introFontName:@"Euphemia UCAS"
                             fontName:@"Euphemia UCAS"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Telugu Sangam MN"
                        introFontName:@"Telugu Sangam MN"
                             fontName:@"Telugu Sangam MN"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bangla Sangam MN"
                        introFontName:@"Bangla Sangam MN"
                             fontName:@"Bangla Sangam MN"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Exo"
                        introFontName:@"Exo-Regular"
                             fontName:@"Exo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Exo 2"
                        introFontName:@"Exo 2-Regular"
                             fontName:@"Exo 2"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"ABeeZee"
                        introFontName:@"ABeeZee"
                             fontName:@"ABeeZee"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Abel"
                        introFontName:@"Abel"
                             fontName:@"Abel"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Abhaya Libre"
                        introFontName:@"Abhaya Libre"
                             fontName:@"Abhaya Libre"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"JejuGothic"
                        introFontName:@"JejuGothic"
                             fontName:@"JejuGothic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Elsie"
                        introFontName:@"Elsie"
                             fontName:@"Elsie"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Podkova"
                        introFontName:@"Podkova"
                             fontName:@"Podkova"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Abril Fatface"
                        introFontName:@"Abril Fatface"
                             fontName:@"Abril Fatface"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Abyssinica SIL"
                        introFontName:@"Abyssinica SIL"
                             fontName:@"Abyssinica SIL"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Acme"
                        introFontName:@"Acme"
                             fontName:@"Acme"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Actor"
                        introFontName:@"Actor"
                             fontName:@"Actor"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Advent Pro"
                        introFontName:@"Advent Pro-Regular"
                             fontName:@"Advent Pro"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aguafina Script"
                        introFontName:@"Aguafina Script"
                             fontName:@"Aguafina Script"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Adamina"
                        introFontName:@"Adamina"
                             fontName:@"Adamina"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Akronim"
                        introFontName:@"Akronim"
                             fontName:@"Akronim"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aksara Bali Galang"
                        introFontName:@"Aksara Bali Galang"
                             fontName:@"Aksara Bali Galang"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aladin"
                        introFontName:@"Aladin"
                             fontName:@"Aladin"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aldrich"
                        introFontName:@"Aldrich"
                             fontName:@"Aldrich"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alef"
                        introFontName:@"Alef"
                             fontName:@"Alef"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alegreya"
                        introFontName:@"Alegreya"
                             fontName:@"Alegreya"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alegreya SC"
                        introFontName:@"Alegreya SC"
                             fontName:@"Alegreya SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alegreya Sans SC"
                        introFontName:@"Alegreya Sans SC-Regular"
                             fontName:@"Alegreya Sans SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alex Brush"
                        introFontName:@"Alex Brush"
                             fontName:@"Alex Brush"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alfa Slab One"
                        introFontName:@"Alfa Slab One"
                             fontName:@"Alfa Slab One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alice"
                        introFontName:@"Alice"
                             fontName:@"Alice"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alike"
                        introFontName:@"Alike"
                             fontName:@"Alike"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Alike Angular"
                        introFontName:@"Alike Angular"
                             fontName:@"Alike Angular"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Allan"
                        introFontName:@"Allan"
                             fontName:@"Allan"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Allerta"
                        introFontName:@"Allerta"
                             fontName:@"Allerta"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Allerta Stencil"
                        introFontName:@"Allerta Stencil"
                             fontName:@"Allerta Stencil"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Allura"
                        introFontName:@"Allura"
                             fontName:@"Allura"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Almendra"
                        introFontName:@"Almendra"
                             fontName:@"Almendra"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Almendra SC"
                        introFontName:@"Almendra SC"
                             fontName:@"Almendra SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Almendra Display"
                        introFontName:@"Almendra Display"
                             fontName:@"Almendra Display"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amatic SC"
                        introFontName:@"Amatic SC"
                             fontName:@"Amatic SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amaranth"
                        introFontName:@"Amaranth"
                             fontName:@"Amaranth"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amarante"
                        introFontName:@"Amarante"
                             fontName:@"Amarante"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amethysta"
                        introFontName:@"Amethysta"
                             fontName:@"Amethysta"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Angkor"
                        introFontName:@"Angkor"
                             fontName:@"Angkor"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Andika"
                        introFontName:@"Andika"
                             fontName:@"Andika"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Andada"
                        introFontName:@"Andada"
                             fontName:@"Andada"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Andada SC"
                        introFontName:@"Andada SC"
                             fontName:@"Andada SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Anaheim"
                        introFontName:@"Anaheim"
                             fontName:@"Anaheim"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amita"
                        introFontName:@"Amita"
                             fontName:@"Amita"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Amiri"
                        introFontName:@"Amiri"
                             fontName:@"Amiri"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arbutus"
                        introFontName:@"Arbutus"
                             fontName:@"Arbutus"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arbutus Slab"
                        introFontName:@"Arbutus Slab"
                             fontName:@"Arbutus Slab"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arapey"
                        introFontName:@"Arapey"
                             fontName:@"Arapey"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Anton"
                        introFontName:@"Anton"
                             fontName:@"Anton"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Antonio"
                        introFontName:@"Antonio-Regular"
                             fontName:@"Antonio"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Antic"
                        introFontName:@"Antic"
                             fontName:@"Antic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Antic Slab"
                        introFontName:@"Antic Slab"
                             fontName:@"Antic Slab"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Antic Didone"
                        introFontName:@"Antic Didone"
                             fontName:@"Antic Didone"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Anonymous Pro"
                        introFontName:@"Anonymous Pro"
                             fontName:@"Anonymous Pro"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Annie Use Your Telescope"
                        introFontName:@"Annie Use Your Telescope"
                             fontName:@"Annie Use Your Telescope"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Archivo Narrow"
                        introFontName:@"Archivo Narrow"
                             fontName:@"Archivo Narrow"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Archivo Black"
                        introFontName:@"Archivo Black"
                             fontName:@"Archivo Black"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Architects Daughter"
                        introFontName:@"Architects Daughter"
                             fontName:@"Architects Daughter"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Artifika"
                        introFontName:@"Artifika"
                             fontName:@"Artifika"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Armata"
                        introFontName:@"Armata"
                             fontName:@"Armata"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arizonia"
                        introFontName:@"Arizonia"
                             fontName:@"Arizonia"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Asset"
                        introFontName:@"Asset"
                             fontName:@"Asset"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Asar"
                        introFontName:@"Asar"
                             fontName:@"Asar"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Asap"
                        introFontName:@"Asap"
                             fontName:@"Asap"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arya"
                        introFontName:@"Arya"
                             fontName:@"Arya"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Arvo"
                        introFontName:@"Arvo"
                             fontName:@"Arvo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Aubrey"
                        introFontName:@"Aubrey"
                             fontName:@"Aubrey"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Atomic Age"
                        introFontName:@"Atomic Age"
                             fontName:@"Atomic Age"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Asul"
                        introFontName:@"Asul"
                             fontName:@"Asul"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Astloch"
                        introFontName:@"Astloch-Bold"
                             fontName:@"Astloch"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Average"
                        introFontName:@"Average"
                             fontName:@"Average"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Average Sans"
                        introFontName:@"Average Sans"
                             fontName:@"Average Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Autour One"
                        introFontName:@"Autour One"
                             fontName:@"Autour One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Audiowide"
                        introFontName:@"Audiowide"
                             fontName:@"Audiowide"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Averia Libre"
                        introFontName:@"Averia Libre"
                             fontName:@"Averia Libre"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Averia Serif Libre"
                        introFontName:@"Averia Serif Libre"
                             fontName:@"Averia Serif Libre"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Averia Sans Libre"
                        introFontName:@"Averia Sans Libre"
                             fontName:@"Averia Sans Libre"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Averia Gruesa Libre"
                        introFontName:@"Averia Gruesa Libre"
                             fontName:@"Averia Gruesa Libre"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baloo"
                        introFontName:@"Baloo"
                             fontName:@"Baloo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baloo Bhai"
                        introFontName:@"Baloo Bhai"
                             fontName:@"Baloo Bhai"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baloo Chettan"
                        introFontName:@"Baloo Chettan"
                             fontName:@"Baloo Chettan"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baloo Da"
                        introFontName:@"Baloo Da"
                             fontName:@"Baloo Da"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baloo Bhaina"
                        introFontName:@"Baloo Bhaina"
                             fontName:@"Baloo Bhaina"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baloo Tamma"
                        introFontName:@"Baloo Tamma"
                             fontName:@"Baloo Tamma"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baloo Tammudu"
                        introFontName:@"Baloo Tammudu"
                             fontName:@"Baloo Tammudu"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baloo Thambi"
                        introFontName:@"Baloo Thambi"
                             fontName:@"Baloo Thambi"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baloo Paaji"
                        introFontName:@"Baloo Paaji"
                             fontName:@"Baloo Paaji"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Basic"
                        introFontName:@"Basic"
                             fontName:@"Basic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bangers"
                        introFontName:@"Bangers"
                             fontName:@"Bangers"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Balthazar"
                        introFontName:@"Balthazar"
                             fontName:@"Balthazar"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bayon"
                        introFontName:@"Bayon"
                             fontName:@"Bayon"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Baumans"
                        introFontName:@"Baumans"
                             fontName:@"Baumans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bentham"
                        introFontName:@"Bentham"
                             fontName:@"Bentham"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Battambang"
                        introFontName:@"Battambang"
                             fontName:@"Battambang"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"BenchNine"
                        introFontName:@"BenchNine-Regular"
                             fontName:@"BenchNine"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Belleza"
                        introFontName:@"Belleza"
                             fontName:@"Belleza"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Belgrano"
                        introFontName:@"Belgrano"
                             fontName:@"Belgrano"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Berkshire Swash"
                        introFontName:@"Berkshire Swash"
                             fontName:@"Berkshire Swash"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bevan"
                        introFontName:@"Bevan"
                             fontName:@"Bevan"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bhavuka"
                        introFontName:@"Bhavuka"
                             fontName:@"Bhavuka"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bilbo"
                        introFontName:@"Bilbo"
                             fontName:@"Bilbo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bigshot One"
                        introFontName:@"Bigshot One"
                             fontName:@"Bigshot One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bigelow Rules"
                        introFontName:@"Bigelow Rules"
                             fontName:@"Bigelow Rules"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Black Ops One"
                        introFontName:@"Black Ops One"
                             fontName:@"Black Ops One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bitter"
                        introFontName:@"Bitter"
                             fontName:@"Bitter"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Biryani"
                        introFontName:@"Biryani"
                             fontName:@"Biryani"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bilbo Swash Caps"
                        introFontName:@"Bilbo Swash Caps"
                             fontName:@"Bilbo Swash Caps"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bokor"
                        introFontName:@"Bokor"
                             fontName:@"Bokor"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bonbon"
                        introFontName:@"Bonbon"
                             fontName:@"Bonbon"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Boogaloo"
                        introFontName:@"Boogaloo"
                             fontName:@"Boogaloo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bowlby One"
                        introFontName:@"Bowlby One"
                             fontName:@"Bowlby One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bowlby One SC"
                        introFontName:@"Bowlby One SC"
                             fontName:@"Bowlby One SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Brawler"
                        introFontName:@"Brawler"
                             fontName:@"Brawler"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bree Serif"
                        introFontName:@"Bree Serif"
                             fontName:@"Bree Serif"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bruno Ace"
                        introFontName:@"Bruno Ace"
                             fontName:@"Bruno Ace"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bruno Ace SC"
                        introFontName:@"Bruno Ace SC"
                             fontName:@"Bruno Ace SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bubblegum Sans"
                        introFontName:@"Bubblegum Sans"
                             fontName:@"Bubblegum Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Bubbler One"
                        introFontName:@"Bubbler One"
                             fontName:@"Bubbler One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Buda"
                        introFontName:@"Buda"
                             fontName:@"Buda"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Buenard"
                        introFontName:@"Buenard"
                             fontName:@"Buenard"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Butcherman"
                        introFontName:@"Butcherman"
                             fontName:@"Butcherman"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cabin"
                        introFontName:@"Cabin"
                             fontName:@"Cabin"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cabin Condensed"
                        introFontName:@"Cabin Condensed"
                             fontName:@"Cabin Condensed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cabin Sketch"
                        introFontName:@"Cabin Sketch"
                             fontName:@"Cabin Sketch"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Caesar Dressing"
                        introFontName:@"Caesar Dressing"
                             fontName:@"Caesar Dressing"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cagliostro"
                        introFontName:@"Cagliostro"
                             fontName:@"Cagliostro"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cambay"
                        introFontName:@"Cambay"
                             fontName:@"Cambay"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cambo"
                        introFontName:@"Cambo"
                             fontName:@"Cambo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Candal"
                        introFontName:@"Candal"
                             fontName:@"Candal"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cantarell"
                        introFontName:@"Cantarell"
                             fontName:@"Cantarell"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cantata One"
                        introFontName:@"Cantata One"
                             fontName:@"Cantata One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"CantoraOne"
                        introFontName:@"CantoraOne"
                             fontName:@"CantoraOne"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Capriola"
                        introFontName:@"Capriola"
                             fontName:@"Capriola"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cardo"
                        introFontName:@"Cardo"
                             fontName:@"Cardo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Carme"
                        introFontName:@"Carme"
                             fontName:@"Carme"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Carrois Gothic"
                        introFontName:@"Carrois Gothic"
                             fontName:@"Carrois Gothic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Carter One"
                        introFontName:@"Carter One"
                             fontName:@"Carter One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Catamaran"
                        introFontName:@"Catamaran-Regular"
                             fontName:@"Catamaran"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Caudex"
                        introFontName:@"Caudex"
                             fontName:@"Caudex"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Caveat"
                        introFontName:@"Caveat-Bold"
                             fontName:@"Caveat"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Caveat Brush"
                        introFontName:@"Caveat Brush"
                             fontName:@"Caveat Brush"
                                 type:TYPE_UNKNOW],
             
             ];
}

+ (NSArray *)chinsesFonts{
    return @[
             [FontAsset assetFromName:@"苹方简体"
                        introFontName:@"PingFang SC"
                             fontName:@"PingFang SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"黑体"
                        introFontName:@"Heiti SC"
                             fontName:@"Heiti SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"报隶"
                        introFontName:@"Baoli SC"
                             fontName:@"Baoli SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"点阵体 GB18030"
                        introFontName:@"GB18030 Bitmap"
                             fontName:@"GB18030 Bitmap"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"华康手札简体"
                        introFontName:@"Hannotate SC"
                             fontName:@"Hannotate SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"华康翩翩简体"
                        introFontName:@"HanziPen SC"
                             fontName:@"HanziPen SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"苹果丽黑"
                        introFontName:@"Hiragino Sans GB"
                             fontName:@"Hiragino Sans GB"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"楷书简体"
                        introFontName:@"Kaiti SC"
                             fontName:@"Kaiti SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"兰亭黑简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"方正隶变简体"
                        introFontName:@"Libian SC"
                             fontName:@"Libian SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"兰亭黑简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             [FontAsset assetFromName:@"兰亭黑 简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             [FontAsset assetFromName:@"兰亭黑 简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             [FontAsset assetFromName:@"兰亭黑 简体"
                        introFontName:@"Lantinghei SC"
                             fontName:@"Lantinghei SC"
                                 type:TYPE_UNKNOW],
             
             ];
}

+ (NSArray *)japansesFonts{
    return @[
             [FontAsset assetFromName:@"Klee"
                        introFontName:@"Klee"
                             fontName:@"Klee"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"YuMincho +36p Kana"
                        introFontName:@"YuMincho +36p Kana"
                             fontName:@"YuMincho +36p Kana"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Tsukushi A Round Gothic"
                        introFontName:@"Tsukushi A Round Gothic"
                             fontName:@"Tsukushi A Round Gothic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Tsukushi B Round Gothic"
                        introFontName:@"Tsukushi B Round Gothic"
                             fontName:@"Tsukushi B Round Gothic"
                                 type:TYPE_UNKNOW]
             ];
}

@end
