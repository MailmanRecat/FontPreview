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
    
    NSString *target = @"lateef";
    [[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString *name, NSUInteger index, BOOL *sS){
        if( [[name lowercaseString] rangeOfString:target].location != NSNotFound ){
            NSLog(@"%@", name);
            NSLog(@"%@", [UIFont fontNamesForFamilyName:name]);
        }
    }];
    
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
             
             [FontAsset assetFromName:@"Cedarville Cursive"
                        introFontName:@"Cedarville Cursive"
                             fontName:@"Cedarville Cursive"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ceviche One"
                        introFontName:@"Ceviche One"
                             fontName:@"Ceviche One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Changa One"
                        introFontName:@"Changa One"
                             fontName:@"Changa One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chango"
                        introFontName:@"Chango"
                             fontName:@"Chango"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chau Philomene One"
                        introFontName:@"Chau Philomene One"
                             fontName:@"Chau Philomene One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chela One"
                        introFontName:@"Chela One"
                             fontName:@"Chela One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chelsea Market"
                        introFontName:@"Chelsea Market"
                             fontName:@"Chelsea Market"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chenla"
                        introFontName:@"Chenla"
                             fontName:@"Chenla"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cherry Swash"
                        introFontName:@"Cherry Swash"
                             fontName:@"Cherry Swash"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chicle"
                        introFontName:@"Chicle"
                             fontName:@"Chicle"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chivo"
                        introFontName:@"Chivo"
                             fontName:@"Chivo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Chonburi"
                        introFontName:@"Chonburi"
                             fontName:@"Chonburi"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cinzel"
                        introFontName:@"Cinzel"
                             fontName:@"Cinzel"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cinzel Decorative"
                        introFontName:@"Cinzel Decorative"
                             fontName:@"Cinzel Decorative"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Clara"
                        introFontName:@"Clara"
                             fontName:@"Clara"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Clicker Script"
                        introFontName:@"Clicker Script"
                             fontName:@"Clicker Script"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Coda"
                        introFontName:@"Coda"
                             fontName:@"Coda"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Coda Caption"
                        introFontName:@"Coda Caption"
                             fontName:@"Coda Caption"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Codystar"
                        introFontName:@"Codystar"
                             fontName:@"Codystar"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Combo"
                        introFontName:@"Combo"
                             fontName:@"Combo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Comfortaa"
                        introFontName:@"Comfortaa"
                             fontName:@"Comfortaa"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Concert One"
                        introFontName:@"Concert One"
                             fontName:@"Concert One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Condiment"
                        introFontName:@"Condiment"
                             fontName:@"Condiment"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Content"
                        introFontName:@"Content"
                             fontName:@"Content"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Contrail One"
                        introFontName:@"Contrail One"
                             fontName:@"Contrail One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Convergence"
                        introFontName:@"Convergence"
                             fontName:@"Convergence"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cookie"
                        introFontName:@"Cookie"
                             fontName:@"Cookie"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Copse"
                        introFontName:@"Copse"
                             fontName:@"Copse"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Corben"
                        introFontName:@"Corben"
                             fontName:@"Corben"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Courgette"
                        introFontName:@"Courgette"
                             fontName:@"Courgette"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Coustard"
                        introFontName:@"Coustard"
                             fontName:@"Coustard"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Covered By Your Grace"
                        introFontName:@"Covered By Your Grace"
                             fontName:@"Covered By Your Grace"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Creepster"
                        introFontName:@"Creepster"
                             fontName:@"Creepster"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Crete Round"
                        introFontName:@"Crete Round"
                             fontName:@"Crete Round"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Crimson Text"
                        introFontName:@"Crimson Text"
                             fontName:@"Crimson Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Croissant One"
                        introFontName:@"Croissant One"
                             fontName:@"Croissant One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cuprum"
                        introFontName:@"Cuprum"
                             fontName:@"Cuprum"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cutive"
                        introFontName:@"Cutive"
                             fontName:@"Cutive"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Cutive Mono"
                        introFontName:@"Cutive Mono"
                             fontName:@"Cutive Mono"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Damion"
                        introFontName:@"Damion"
                             fontName:@"Damion"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dancing Script"
                        introFontName:@"Dancing Script"
                             fontName:@"Dancing Script"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dangrek"
                        introFontName:@"Dangrek"
                             fontName:@"Dangrek"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dawning of a New Day"
                        introFontName:@"Dawning of a New Day"
                             fontName:@"Dawning of a New Day"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Days One"
                        introFontName:@"Days One"
                             fontName:@"Days One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dekko"
                        introFontName:@"Dekko"
                             fontName:@"Dekko"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Delius"
                        introFontName:@"Delius"
                             fontName:@"Delius"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Delius Swash Caps"
                        introFontName:@"Delius Swash Caps"
                             fontName:@"Delius Swash Caps"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Delius Unicase"
                        introFontName:@"Delius Unicase"
                             fontName:@"Delius Unicase"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Della Respira"
                        introFontName:@"Della Respira"
                             fontName:@"Della Respira"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Denk One"
                        introFontName:@"Denk One"
                             fontName:@"Denk One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Devonshire"
                        introFontName:@"Devonshire"
                             fontName:@"Devonshire"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dhurjati"
                        introFontName:@"Dhurjati"
                             fontName:@"Dhurjati"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dhyana"
                        introFontName:@"Dhyana"
                             fontName:@"Dhyana"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Didact Gothic"
                        introFontName:@"Didact Gothic"
                             fontName:@"Didact Gothic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Digital Numbers"
                        introFontName:@"Digital Numbers"
                             fontName:@"Digital Numbers"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dinah"
                        introFontName:@"Dinah"
                             fontName:@"Dinah"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Diplomata"
                        introFontName:@"Diplomata"
                             fontName:@"Diplomata"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Diplomata SC"
                        introFontName:@"Diplomata SC"
                             fontName:@"Diplomata SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Domine"
                        introFontName:@"Domine"
                             fontName:@"Domine"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Donegal One"
                        introFontName:@"Donegal One"
                             fontName:@"Donegal One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Doppio One"
                        introFontName:@"Doppio One"
                             fontName:@"Doppio One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dorsa"
                        introFontName:@"Dorsa"
                             fontName:@"Dorsa"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dosis"
                        introFontName:@"Dosis-Regular"
                             fontName:@"Dosis"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dr Sugiyama"
                        introFontName:@"Dr Sugiyama"
                             fontName:@"Dr Sugiyama"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Duru Sans"
                        introFontName:@"Duru Sans"
                             fontName:@"Duru Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Dynalight"
                        introFontName:@"Dynalight"
                             fontName:@"Dynalight"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Eagle Lake"
                        introFontName:@"Eagle Lake"
                             fontName:@"Eagle Lake"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Eater"
                        introFontName:@"Eater"
                             fontName:@"Eater"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Eater Caps"
                        introFontName:@"Eater Caps"
                             fontName:@"Eater Caps"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"EB Garamond"
                        introFontName:@"EB Garamond"
                             fontName:@"EB Garamond"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Economica"
                        introFontName:@"Economica"
                             fontName:@"Economica"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Eczar"
                        introFontName:@"Eczar"
                             fontName:@"Eczar"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ek Mukta"
                        introFontName:@"EkMukta-Regula"
                             fontName:@"Ek Mukta"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Electrolize"
                        introFontName:@"Electrolize"
                             fontName:@"Electrolize"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Elsie Swash Caps"
                        introFontName:@"Elsie Swash Caps"
                             fontName:@"Elsie Swash Caps"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Emblema One"
                        introFontName:@"Emblema One"
                             fontName:@"Emblema One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Emilys Candy"
                        introFontName:@"Emilys Candy"
                             fontName:@"Emilys Candy"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Encode Sans"
                        introFontName:@"EncodeSans-Regula"
                             fontName:@"Encode Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Encode Sans Compressed"
                        introFontName:@"EncodeSansCompressed-Regula"
                             fontName:@"Encode Sans Compressed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Encode Sans Condensed"
                        introFontName:@"EncodeSansCondensed-Regula"
                             fontName:@"Encode Sans Condensed"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Encode Sans Narrow"
                        introFontName:@"EncodeSansNarrow-Regula"
                             fontName:@"Encode Sans Narrow"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Encode Sans Wide"
                        introFontName:@"EncodeSansWide-Regula"
                             fontName:@"Encode Sans Wide"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Engagement"
                        introFontName:@"Engagement"
                             fontName:@"Engagement"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Englebert"
                        introFontName:@"Englebert"
                             fontName:@"Englebert"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Enriqueta"
                        introFontName:@"Enriqueta"
                             fontName:@"Enriqueta"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Erica One"
                        introFontName:@"Erica One"
                             fontName:@"Erica One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Esteban"
                        introFontName:@"Esteban"
                             fontName:@"Esteban"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Euphoria Script"
                        introFontName:@"Euphoria Script"
                             fontName:@"Euphoria Script"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ewert"
                        introFontName:@"Ewert"
                             fontName:@"Ewert"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Expletus Sans"
                        introFontName:@"Expletus Sans"
                             fontName:@"Expletus Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fanwood Text"
                        introFontName:@"Fanwood Text"
                             fontName:@"Fanwood Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fascinate"
                        introFontName:@"Fascinate"
                             fontName:@"Fascinate"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fascinate Inline"
                        introFontName:@"Fascinate Inline"
                             fontName:@"Fascinate Inline"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Faster One"
                        introFontName:@"Faster One"
                             fontName:@"Faster One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fasthand"
                        introFontName:@"Fasthand"
                             fontName:@"Fasthand"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fauna One"
                        introFontName:@"Fauna One"
                             fontName:@"Fauna One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Federo"
                        introFontName:@"Federo"
                             fontName:@"Federo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Federant"
                        introFontName:@"Federant"
                             fontName:@"Federant"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Felipa"
                        introFontName:@"Felipa"
                             fontName:@"Felipa"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fenix"
                        introFontName:@"Fenix"
                             fontName:@"Fenix"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Finger Paint"
                        introFontName:@"Finger Paint"
                             fontName:@"Finger Paint"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fira Mono"
                        introFontName:@"Fira Mono"
                             fontName:@"Fira Mono"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fira Sans"
                        introFontName:@"FiraSans-Regular"
                             fontName:@"Fira Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fjalla One"
                        introFontName:@"Fjalla One"
                             fontName:@"Fjalla One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fjord"
                        introFontName:@"Fjord"
                             fontName:@"Fjord"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Flamenco"
                        introFontName:@"Flamenco-Regular"
                             fontName:@"Flamenco"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Flavors"
                        introFontName:@"Flavors"
                             fontName:@"Flavors"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fondamento"
                        introFontName:@"Fondamento"
                             fontName:@"Fondamento"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Forum"
                        introFontName:@"Forum"
                             fontName:@"Forum"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Francois One"
                        introFontName:@"Francois One"
                             fontName:@"Francois One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Freckle Face"
                        introFontName:@"Freckle Face"
                             fontName:@"Freckle Face"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fredericka the Great"
                        introFontName:@"Fredericka the Great"
                             fontName:@"Fredericka the Great"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fredoka One"
                        introFontName:@"Fredoka One"
                             fontName:@"Fredoka One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Freehand"
                        introFontName:@"Freehand"
                             fontName:@"Freehand"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fresca"
                        introFontName:@"Fresca"
                             fontName:@"Fresca"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Frijole"
                        introFontName:@"Frijole"
                             fontName:@"Frijole"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fruktur"
                        introFontName:@"Fruktur"
                             fontName:@"Fruktur"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Fugaz One"
                        introFontName:@"Fugaz One"
                             fontName:@"Fugaz One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gabriela"
                        introFontName:@"Gabriela"
                             fontName:@"Gabriela"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gafata"
                        introFontName:@"Gafata"
                             fontName:@"Gafata"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Galdeano"
                        introFontName:@"Galdeano"
                             fontName:@"Galdeano"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Galindo"
                        introFontName:@"Galindo"
                             fontName:@"Galindo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Geo"
                        introFontName:@"Geo"
                             fontName:@"Geo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gentium Basic"
                        introFontName:@"Gentium Basic"
                             fontName:@"Gentium Basic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gentium Book Basic"
                        introFontName:@"Gentium Book Basic"
                             fontName:@"Gentium Book Basic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Geostar"
                        introFontName:@"Geostar"
                             fontName:@"Geostar"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Geostar Fill"
                        introFontName:@"Geostar Fill"
                             fontName:@"Geostar Fill"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Germania One"
                        introFontName:@"Germania One"
                             fontName:@"Germania One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"GFS Didot"
                        introFontName:@"GFS Didot"
                             fontName:@"GFS Didot"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"GFS Neohellenic"
                        introFontName:@"GFS Neohellenic"
                             fontName:@"GFS Neohellenic"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gidugu"
                        introFontName:@"Gidugu"
                             fontName:@"Gidugu"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gilda Display"
                        introFontName:@"Gilda Display"
                             fontName:@"Gilda Display"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Give You Glory"
                        introFontName:@"Give You Glory"
                             fontName:@"Give You Glory"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Glass Antiqua"
                        introFontName:@"Glass Antiqua"
                             fontName:@"Glass Antiqua"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Glegoo"
                        introFontName:@"Glegoo"
                             fontName:@"Glegoo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gloria Hallelujah"
                        introFontName:@"Gloria Hallelujah"
                             fontName:@"Gloria Hallelujah"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Goblin One"
                        introFontName:@"Goblin One"
                             fontName:@"Goblin One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gochi Hand"
                        introFontName:@"Gochi Hand"
                             fontName:@"Gochi Hand"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gorditas"
                        introFontName:@"Gorditas"
                             fontName:@"Gorditas"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Goudy Bookletter 1911"
                        introFontName:@"Goudy Bookletter 1911"
                             fontName:@"Goudy Bookletter 1911"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Graduate"
                        introFontName:@"Graduate"
                             fontName:@"Graduate"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Grand Hotel"
                        introFontName:@"Grand Hotel"
                             fontName:@"Grand Hotel"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gravitas One"
                        introFontName:@"Gravitas One"
                             fontName:@"Gravitas One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Great Vibes"
                        introFontName:@"Great Vibes"
                             fontName:@"Great Vibes"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Griffy"
                        introFontName:@"Griffy"
                             fontName:@"Griffy"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gruppo"
                        introFontName:@"Gruppo"
                             fontName:@"Gruppo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gudea"
                        introFontName:@"Gudea"
                             fontName:@"Gudea"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Gurajada"
                        introFontName:@"Gurajada"
                             fontName:@"Gurajada"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Habibi"
                        introFontName:@"Habibi"
                             fontName:@"Habibi"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Halant"
                        introFontName:@"Halant"
                             fontName:@"Halant"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"HammersmithOne"
                        introFontName:@"HammersmithOne"
                             fontName:@"HammersmithOne"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hanalei"
                        introFontName:@"Hanalei"
                             fontName:@"Hanalei"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hanalei Fill"
                        introFontName:@"Hanalei Fill"
                             fontName:@"Hanalei Fill"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Handlee"
                        introFontName:@"Handlee"
                             fontName:@"Handlee"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Khmer Sangam MN"
                        introFontName:@"Khmer Sangam MN"
                             fontName:@"Khmer Sangam MN"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hanuman"
                        introFontName:@"Hanuman"
                             fontName:@"Hanuman"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Happy Monkey"
                        introFontName:@"Happy Monkey"
                             fontName:@"Happy Monkey"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"HeadlandOne"
                        introFontName:@"HeadlandOne"
                             fontName:@"HeadlandOne"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Henny Penny"
                        introFontName:@"Henny Penny"
                             fontName:@"Henny Penny"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hermeneus One"
                        introFontName:@"Hermeneus One"
                             fontName:@"Hermeneus One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Herr Von Muellerhoff"
                        introFontName:@"Herr Von Muellerhoff"
                             fontName:@"Herr Von Muellerhoff"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hind"
                        introFontName:@"Hind-Regular"
                             fontName:@"Hind"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hind Colombo"
                        introFontName:@"HindColombo-Regular"
                             fontName:@"Hind Colombo"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hind Guntur"
                        introFontName:@"HindGuntur-Regular"
                             fontName:@"Hind Guntur"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hind Jalandhar"
                        introFontName:@"HindJalandhar-Regular"
                             fontName:@"Hind Jalandhar"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hind Kochi"
                        introFontName:@"HindKochi-Regular"
                             fontName:@"Hind Kochi"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hind Madurai"
                        introFontName:@"HindMadurai-Regular"
                             fontName:@"Hind Madurai"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hind Mysuru"
                        introFontName:@"HindMysuru-Regular"
                             fontName:@"Hind Mysuru"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hind Siliguri"
                        introFontName:@"HindSiliguri-Regular"
                             fontName:@"Hind Siliguri"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Hind Vadodara"
                        introFontName:@"Hind Vadodara-Regular"
                             fontName:@"Hind Vadodara"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Holtwood One SC"
                        introFontName:@"Holtwood One SC"
                             fontName:@"Holtwood One SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Homenaje"
                        introFontName:@"Homenaje"
                             fontName:@"Homenaje"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Iceberg"
                        introFontName:@"Iceberg"
                             fontName:@"Iceberg"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Iceland"
                        introFontName:@"Iceland"
                             fontName:@"Iceland"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL Double Pica"
                        introFontName:@"IM FELL Double Pica"
                             fontName:@"IM FELL Double Pica"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL Double Pica SC"
                        introFontName:@"IM FELL Double Pica SC"
                             fontName:@"IM FELL Double Pica SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL DW Pica SC"
                        introFontName:@"IM FELL DW Pica SC"
                             fontName:@"IM FELL DW Pica SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL Great Primer"
                        introFontName:@"IM FELL Great Primer"
                             fontName:@"IM FELL Great Primer"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL English"
                        introFontName:@"IM FELL English"
                             fontName:@"IM FELL English"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL English SC"
                        introFontName:@"IM FELL English SC"
                             fontName:@"IM FELL English SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL French Canon"
                        introFontName:@"IM FELL French Canon"
                             fontName:@"IM FELL French Canon"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL French Canon SC"
                        introFontName:@"IM FELL French Canon SC"
                             fontName:@"IM FELL French Canon SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL DW Pica"
                        introFontName:@"IM FELL DW Pica"
                             fontName:@"IM FELL DW Pica"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"IM FELL Great Primer SC"
                        introFontName:@"IM FELL Great Primer SC"
                             fontName:@"IM FELL Great Primer SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Imprima"
                        introFontName:@"Imprima"
                             fontName:@"Imprima"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Inconsolata"
                        introFontName:@"Inconsolata"
                             fontName:@"Inconsolata"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Inder"
                        introFontName:@"Inder"
                             fontName:@"Inder"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Indie Flower"
                        introFontName:@"Indie Flower"
                             fontName:@"Indie Flower"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Inika"
                        introFontName:@"Inika"
                             fontName:@"Inika"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Inknut Antiqua"
                        introFontName:@"Inknut Antiqua"
                             fontName:@"Inknut Antiqua"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Istok Web"
                        introFontName:@"Istok Web"
                             fontName:@"Istok Web"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Italiana"
                        introFontName:@"Italiana"
                             fontName:@"Italiana"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Italianno"
                        introFontName:@"Italianno"
                             fontName:@"Italianno"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Itim"
                        introFontName:@"Itim"
                             fontName:@"Itim"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Jacques Francois"
                        introFontName:@"Jacques Francois"
                             fontName:@"Jacques Francois"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Jacques Francois Shadow"
                        introFontName:@"Jacques Francois Shadow"
                             fontName:@"Jacques Francois Shadow"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Jaldi"
                        introFontName:@"Jaldi"
                             fontName:@"Jaldi"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Jim Nightshade"
                        introFontName:@"Jim Nightshade"
                             fontName:@"Jim Nightshade"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Jockey One"
                        introFontName:@"Jockey One"
                             fontName:@"Jockey One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Jolly Lodger"
                        introFontName:@"Jolly Lodger"
                             fontName:@"Jolly Lodger"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Josefin Sans"
                        introFontName:@"Josefin Sans"
                             fontName:@"Josefin Sans"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Josefin Sans Std"
                        introFontName:@"Josefin Sans Std"
                             fontName:@"Josefin Sans Std"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Josefin Slab"
                        introFontName:@"JosefinSlab-Bold"
                             fontName:@"Josefin Slab"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Joti One"
                        introFontName:@"Joti One"
                             fontName:@"Joti One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Judson"
                        introFontName:@"Judson"
                             fontName:@"Judson"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Julee"
                        introFontName:@"Julee"
                             fontName:@"Julee"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Julius Sans One"
                        introFontName:@"Julius Sans One"
                             fontName:@"Julius Sans One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Junge"
                        introFontName:@"Junge"
                             fontName:@"Junge"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Jura"
                        introFontName:@"Jura"
                             fontName:@"Jura"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Just Me Again Down Here"
                        introFontName:@"Just Me Again Down Here"
                             fontName:@"Just Me Again Down Here"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kadwa"
                        introFontName:@"Kadwa"
                             fontName:@"Kadwa"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kalam"
                        introFontName:@"Kalam"
                             fontName:@"Kalam"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kameron"
                        introFontName:@"Kameron"
                             fontName:@"Kameron"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kanit"
                        introFontName:@"Kanit-Regular"
                             fontName:@"Kanit"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kantumruy"
                        introFontName:@"Kantumruy"
                             fontName:@"Kantumruy"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Karla"
                        introFontName:@"Karla"
                             fontName:@"Karla"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Karla Tamil Inclined"
                        introFontName:@"Karla Tamil Inclined"
                             fontName:@"Karla Tamil Inclined"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Karla Tamil Upright"
                        introFontName:@"Karla Tamil Upright"
                             fontName:@"Karla Tamil Upright"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Karma"
                        introFontName:@"Karma-Regular"
                             fontName:@"Karma"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kaushan Script"
                        introFontName:@"Kaushan Script"
                             fontName:@"Kaushan Script"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kavoon"
                        introFontName:@"Kavoon"
                             fontName:@"Kavoon"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kdam Thmor"
                        introFontName:@"Kdam Thmor"
                             fontName:@"Kdam Thmor"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Keania One"
                        introFontName:@"Keania One"
                             fontName:@"Keania One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kelly Slab"
                        introFontName:@"Kelly Slab"
                             fontName:@"Kelly Slab"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kenia"
                        introFontName:@"Kenia"
                             fontName:@"Kenia"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Khand"
                        introFontName:@"Khand"
                             fontName:@"Khand"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Khmer"
                        introFontName:@"Khmer"
                             fontName:@"Khmer"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Khula"
                        introFontName:@"Khula-Regular"
                             fontName:@"Khula"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kite One"
                        introFontName:@"Kite One"
                             fontName:@"Kite One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Knewave"
                        introFontName:@"Knewave"
                             fontName:@"Knewave"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Koulen"
                        introFontName:@"Koulen"
                             fontName:@"Koulen"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kotta One"
                        introFontName:@"Kotta One"
                             fontName:@"Kotta One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kreon"
                        introFontName:@"Kreon-Regular"
                             fontName:@"Kreon"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kristi"
                        introFontName:@"Kristi"
                             fontName:@"Kristi"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Krona One"
                        introFontName:@"Krona One"
                             fontName:@"Krona One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Kurale"
                        introFontName:@"Kurale"
                             fontName:@"Kurale"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"La Belle Aurore"
                        introFontName:@"La Belle Aurore"
                             fontName:@"La Belle Aurore"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Laila"
                        introFontName:@"Laila-Regular"
                             fontName:@"Laila"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lakki Reddy"
                        introFontName:@"Lakki Reddy"
                             fontName:@"Lakki Reddy"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lancelot"
                        introFontName:@"Lancelot"
                             fontName:@"Lancelot"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lateef"
                        introFontName:@"Lateef"
                             fontName:@"Lateef"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lato"
                        introFontName:@"Lato-Regular"
                             fontName:@"Lato"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"League Script"
                        introFontName:@"League Script"
                             fontName:@"League Script"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Leckerli One"
                        introFontName:@"Leckerli One"
                             fontName:@"Leckerli One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Ledger"
                        introFontName:@"Ledger"
                             fontName:@"Ledger"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lekton"
                        introFontName:@"Lekton-Bold"
                             fontName:@"Lekton"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lemon"
                        introFontName:@"Lemon"
                             fontName:@"Lemon"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lemon One"
                        introFontName:@"Lemon One"
                             fontName:@"Lemon One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Libre Baskerville"
                        introFontName:@"Libre Baskerville"
                             fontName:@"Libre Baskerville"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Libre Caslon Text"
                        introFontName:@"Libre Caslon Text"
                             fontName:@"Libre Caslon Text"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Life Savers"
                        introFontName:@"LifeSavers-Bold"
                             fontName:@"Life Savers"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lilita One"
                        introFontName:@"Lilita One"
                             fontName:@"Lilita One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lily Script One"
                        introFontName:@"Lily Script One"
                             fontName:@"Lily Script One"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Limelight"
                        introFontName:@"Limelight"
                             fontName:@"Limelight"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Linden Hill"
                        introFontName:@"Linden Hill"
                             fontName:@"Linden Hill"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lohit Bengali"
                        introFontName:@"Lohit Bengali"
                             fontName:@"Lohit Bengali"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lohit Devanagari"
                        introFontName:@"Lohit Devanagari"
                             fontName:@"Lohit Devanagari"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lohit Tamil"
                        introFontName:@"Lohit Tamil"
                             fontName:@"Lohit Tamil"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Londrina Outline"
                        introFontName:@"Londrina Outline"
                             fontName:@"Londrina Outline"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Londrina Shadow"
                        introFontName:@"Londrina Shadow"
                             fontName:@"Londrina Shadow"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Londrina Sketch"
                        introFontName:@"Londrina Sketch"
                             fontName:@"Londrina Sketch"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Londrina Solid"
                        introFontName:@"Londrina Solid"
                             fontName:@"Londrina Solid"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Loved by the King"
                        introFontName:@"Loved by the King"
                             fontName:@"Loved by the King"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lovers Quarrel"
                        introFontName:@"Lovers Quarrel"
                             fontName:@"Lovers Quarrel"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Love Ya Like A Sister"
                        introFontName:@"Love Ya Like A Sister"
                             fontName:@"Love Ya Like A Sister"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lusitana"
                        introFontName:@"Lusitana"
                             fontName:@"Lusitana"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromName:@"Lustria"
                        introFontName:@"Lustria"
                             fontName:@"Lustria"
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
                             fontName:@"STBaoli-SC-Regular"
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
