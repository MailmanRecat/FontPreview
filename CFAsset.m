//
//  CFAsset.m
//  FontPreview
//
//  Created by caine on 2/11/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#define numberOfEN 774
#define numberOfCH 8
#define numberOfJA 4

#import "CFAsset.h"

CFAsset
CFAssetMake( char *name, char *introName, char *fontName, int type, char *postScriptName )
{
    CFAsset asset;
    asset.name = name;
    asset.introName = introName;
    asset.fontName  = fontName;
    asset.type = type;
    asset.postScriptName = postScriptName;
    return asset;
}

@interface CFonts(){
    CFAsset _fonts_EN[numberOfEN];
    CFAsset _fonts_CH[numberOfCH];
    CFAsset _fonts_JA[numberOfJA];
}

@end

@implementation CFonts

- (instancetype)init{
    self = [super init];
    if( self ){
//        [self initFontsEN];
        [self initFontsCH];
        [self initFontsJA];
        
//        NSMutableString *re = [[NSMutableString alloc] init];
//        for( int i = 0; i < numberOfEN; i++ ){
//            CFAsset a = _fonts_EN[i];
//            FontAsset *o = [self fontAssetFronCFAsset:a];
//            [re appendFormat:@"insert into fonts ( name, introName, fontName, type, postScriptName ) values ( \"%@\", \"%@\", \"%@\", %ld, \"%@\" ); \n", o.name, o.introFontName, o.fontName, o.type, o.PostScriptName ];
//        }
//        
//        [re writeToFile:@"/users/caine/downloads/fnstring.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
//        
//        NSLog(@"over");
        
    }
    return self;
}


- (FontAsset *)fontAssetFronCFAsset:(CFAsset)c{
    return [FontAsset assetFromName:[NSString stringWithUTF8String:c.name]
                      introFontName:[NSString stringWithUTF8String:c.introName]
                           fontName:[NSString stringWithUTF8String:c.fontName]
                     postScriptName:[NSString stringWithFormat:@"%s", c.postScriptName == NULL ? "unknow" : c.postScriptName]
                               type:c.type];
}

- (NSUInteger)numberOfFonts{
    if( [[FontsManager shareManager].lang isEqualToString:LANG_ENGLISH] ){
        return numberOfEN;
        
    }else if( [[FontsManager shareManager].lang isEqualToString:LANG_CHINESE] ){
        return numberOfCH;
        
    }else if( [[FontsManager shareManager].lang isEqualToString:LANG_JAPANESE] ){
        return numberOfJA;
        
    }
    
    return 0;
}

- (CFAsset)CFAssetAtIndex:(NSUInteger)index{
    if( [[FontsManager shareManager].lang isEqualToString:LANG_ENGLISH] ){
        return _fonts_EN[index];
        
    }else if( [[FontsManager shareManager].lang isEqualToString:LANG_CHINESE] ){
        return _fonts_CH[index];
        
    }else if( [[FontsManager shareManager].lang isEqualToString:LANG_JAPANESE] ){
        return _fonts_JA[index];
        
    }
    
    return CFAssetMake("", "", "", 0, "");
}

+ (instancetype)shareFonts{
    static CFonts *fonts;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        fonts = [[CFonts alloc] init];
    });
    
    return fonts;
}

- (NSArray *)searchFonts:(NSString *)key{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSUInteger      edge;
    
    if( [[FontsManager shareManager].lang isEqualToString:LANG_ENGLISH] ){
        edge = numberOfEN;
        
    }else if( [[FontsManager shareManager].lang isEqualToString:LANG_CHINESE] ){
        edge = numberOfCH;
        
    }else if( [[FontsManager shareManager].lang isEqualToString:LANG_JAPANESE] ){
        edge = numberOfJA;
    }
    
    for( int i = 0; i < edge; i++ ){
        NSString *name  = [[NSString stringWithUTF8String:[self CFAssetAtIndex:i].name] lowercaseString];
        NSRange   range = [name rangeOfString:key];
        if( range.location != NSNotFound ){
            [result addObject:@[ name, [NSNumber numberWithInt:i], [NSValue valueWithRange:range] ]];
        }
    }
    
    return (NSArray *)result;
}

- (void)initFontsCH{
    _fonts_CH[0] = CFAssetMake("苹方简体", "PingFang SC", "PingFang SC", 0, nil);
    _fonts_CH[1] = CFAssetMake("报隶", "Baoli SC", "Baoli SC", 0, "STBaoli-SC-Regular");
    _fonts_CH[2] = CFAssetMake("GB18030 Bitmap", "GB18030 Bitmap", "GB18030 Bitmap", 0, "GB18030Bitmap");
    _fonts_CH[3] = CFAssetMake("隶变", "Libian SC", "Libian SC", 0, "STLibian-SC-Regular");
    _fonts_CH[4] = CFAssetMake("娃娃体", "Wawati SC", "Wawati SC", 0, "DFWaWaSC-W5");
    _fonts_CH[5] = CFAssetMake("魏碑简体", "Weibei SC", "Weibei SC", 0, "Weibei-SC-Bold");
    _fonts_CH[6] = CFAssetMake("行楷简体", "Xingkai SC", "Xingkai SC", 0, "STXingkai-SC-Light");
    _fonts_CH[7] = CFAssetMake("雅痞简体", "Yuppy SC", "Yuppy SC", 0, "YuppySC-Regular");
}

- (void)initFontsJA{
    _fonts_JA[0] = CFAssetMake("Klee", "Klee", "Klee", 0, nil);
    _fonts_JA[1] = CFAssetMake("YuMincho +36p Kana", "YuMincho +36p Kana", "YuMincho +36p Kana", 0, nil);
    _fonts_JA[2] = CFAssetMake("Tsukushi A Round Gothic", "Tsukushi A Round Gothic", "Tsukushi A Round Gothic", 0, nil);
    _fonts_JA[3] = CFAssetMake("Tsukushi B Round Gothic", "Tsukushi B Round Gothic", "Tsukushi B Round Gothic", 0, nil);
}

- (void)initFontsEN{
    _fonts_EN[0]  = CFAssetMake("San Francisco Display", "SFUIDisplay-Regular", "SF UI Display", 0, nil);
    _fonts_EN[1]  = CFAssetMake("San Francisco Text", "SFUIDisplay-Regular", "SF UI Text", 0, nil);
    _fonts_EN[2]  = CFAssetMake("San Francisco Compact Display", "SFCompactDisplay-Medium", "SF Compact Display", 0, nil);
    _fonts_EN[3]  = CFAssetMake("San Francisco Compact Text", "SF Compact Text", "SF Compact Text", 0, nil);
    _fonts_EN[4]  = CFAssetMake("Roboto", "Roboto-Regular", "Roboto", 0, nil);
    _fonts_EN[5]  = CFAssetMake("Roboto Slab", "RobotoSlab-Regular", "Roboto Slab", 0, nil);
    _fonts_EN[6]  = CFAssetMake("Roboto Mono", "RobotoMono-Regular", "Roboto Mono", 0, nil);
    _fonts_EN[7]  = CFAssetMake("Roboto Condensed", "RobotoCondensed-Regular", "Roboto Condensed", 0, nil);
    _fonts_EN[8]  = CFAssetMake("Menlo", "Menlo-Regular", "Menlo", 0, nil);
    _fonts_EN[9]  = CFAssetMake("Helvetica", "Helvetica", "Helvetica", 0, nil);
    _fonts_EN[10] = CFAssetMake("Helvetica Neue", "Helvetica Neue", "Helvetica Neue", 0, nil);
    _fonts_EN[11] = CFAssetMake("Times New Roman", "Times New Roman", "Times New Roman", 0, nil);
    _fonts_EN[12] = CFAssetMake("Georgia", "Georgia", "Georgia", 0, nil);
    _fonts_EN[13] = CFAssetMake("Ubuntu", "Ubuntu", "Ubuntu", 0, nil);
    _fonts_EN[14] = CFAssetMake("Ubuntu Condensed", "Ubuntu Condensed", "Ubuntu Condensed", 0, nil);
    _fonts_EN[15] = CFAssetMake("Ubuntu mono", "Ubuntu mono", "Ubuntu mono", 0, nil);
    _fonts_EN[16] = CFAssetMake("Futura", "Futura", "Futura", 0, nil);
    _fonts_EN[17] = CFAssetMake("Optima", "Optima", "Optima", 0, nil);
    _fonts_EN[18] = CFAssetMake("Verdana", "Verdana", "Verdana", 0, nil);
    _fonts_EN[19] = CFAssetMake("Didot", "Didot", "Didot", 0, nil);
    _fonts_EN[20] = CFAssetMake("Iowan Old Style", "Iowan Old Style", "Iowan Old Style", 0, nil);
    _fonts_EN[21] = CFAssetMake("Marker Felt", "Marker Felt", "Marker Felt", 0, nil);
    _fonts_EN[22] = CFAssetMake("Gill Sans", "Gill Sans", "Gill Sans", 0, nil);
    _fonts_EN[23] = CFAssetMake("Avenir", "Avenir", "Avenir", 0, nil);
    _fonts_EN[24] = CFAssetMake("Avenir Next Condensed", "Avenir Next Condensed", "Avenir Next Condensed", 0, nil);
    _fonts_EN[25] = CFAssetMake("Copperplate", "Copperplate", "Copperplate", 0, nil);
    _fonts_EN[26] = CFAssetMake("American TypeWriter", "American TypeWriter", "American TypeWriter", 0, nil);
    _fonts_EN[27] = CFAssetMake("Arial", "Arial", "Arial", 0, nil);
    _fonts_EN[28] = CFAssetMake("Arial Hebrew", "Arial Hebrew", "Arial Hebrew", 0, nil);
    _fonts_EN[29] = CFAssetMake("Aclonica", "Aclonica", "Aclonica", 0, nil);
    _fonts_EN[30] = CFAssetMake("Arimo", "Arimo", "Arimo", 0, nil);
    _fonts_EN[31] = CFAssetMake("Calligraffitti", "Calligraffitti", "Calligraffitti", 0, nil);
    _fonts_EN[32] = CFAssetMake("Cherry Cream Soda", "Cherry Cream Soda", "Cherry Cream Soda", 0, nil);
    _fonts_EN[33] = CFAssetMake("Chewy", "Chewy", "Chewy", 0, nil);
    _fonts_EN[34] = CFAssetMake("Coming Soon", "Coming Soon", "Coming Soon", 0, nil);
    _fonts_EN[35] = CFAssetMake("Schoolbell", "Schoolbell", "Schoolbell", 0, nil);
    _fonts_EN[36] = CFAssetMake("UnifrakturMaguntia", "UnifrakturMaguntia", "UnifrakturMaguntia", 0, nil);
    _fonts_EN[37] = CFAssetMake("Montserrat", "Montserrat", "Montserrat", 0, nil);
    _fonts_EN[38] = CFAssetMake("Lora", "Lora", "Lora", 0, nil);
    _fonts_EN[39] = CFAssetMake("PT Sans", "PT Sans", "PT Sans", 0, nil);
    _fonts_EN[40] = CFAssetMake("PT Sans Caption", "PT Sans Caption", "PT Sans Caption", 0, nil);
    _fonts_EN[41] = CFAssetMake("PT Sans Narrow", "PT Sans Narrow", "PT Sans Narrow", 0, nil);
    _fonts_EN[42] = CFAssetMake("Lobster", "Lobster", "Lobster", 0, nil);
    _fonts_EN[43] = CFAssetMake("Lobster Two", "Lobster Two", "Lobster Two", 0, nil);
    _fonts_EN[44] = CFAssetMake("Muli", "Muli", "Muli", 0, nil);
    _fonts_EN[45] = CFAssetMake("Orbitron", "Orbitron", "Orbitron", 0, nil);
    _fonts_EN[46] = CFAssetMake("Academy Engraved LET", "Academy Engraved LET", "Academy Engraved LET", 0, nil);
    _fonts_EN[47] = CFAssetMake("Hoefler Text", "Hoefler Text", "Hoefler Text", 0, nil);
    _fonts_EN[48] = CFAssetMake("Kohinoor Telugu", "Kohinoor Telugu", "Kohinoor Telugu", 0, nil);
    _fonts_EN[49] = CFAssetMake("Kohinoor Bangla", "KohinoorBangla-Regular", "Kohinoor Bangla", 0, nil);
    _fonts_EN[50] = CFAssetMake("Kohinoor Devanagari", "KohinoorDevanagari-Regular", "Kohinoor Devanagari", 0, nil);
    _fonts_EN[51] = CFAssetMake("Thonburi", "Thonburi", "Thonburi", 0, nil);
    _fonts_EN[52] = CFAssetMake("Cochin", "Cochin", "Cochin", 0, nil);
    _fonts_EN[53] = CFAssetMake("Courier", "Courier", "Courier", 0, nil);
    _fonts_EN[54] = CFAssetMake("Courier New", "Courier New", "Courier New", 0, nil);
    _fonts_EN[55] = CFAssetMake("Apple SD Gothic Neo", "Apple SD Gothic Neo", "Apple SD Gothic Neo", 0, nil);
    _fonts_EN[56] = CFAssetMake("Tamil Sangam MN", "Tamil Sangam MN", "Tamil Sangam MN", 0, nil);
    _fonts_EN[57] = CFAssetMake("Gurmukhi MN", "Gurmukhi MN", "Gurmukhi MN", 0, nil);
    _fonts_EN[58] = CFAssetMake("Kailasa", "Kailasa", "Kailasa", 0, nil);
    _fonts_EN[59] = CFAssetMake("Damascus", "Damascus", "Damascus", 0, nil);
    _fonts_EN[60] = CFAssetMake("Noteworthy", "Noteworthy", "Noteworthy", 0, nil);
    _fonts_EN[61] = CFAssetMake("Geeza Pro", "Geeza Pro", "Geeza Pro", 0, nil);
    _fonts_EN[62] = CFAssetMake("Mishafi", "Mishafi", "Mishafi", 0, nil);
    _fonts_EN[63] = CFAssetMake("Farah", "Farah", "Farah", 0, nil);
    _fonts_EN[64] = CFAssetMake("Palatino", "Palatino", "Palatino", 0, nil);
    _fonts_EN[65] = CFAssetMake("Al Nile", "Al Nile", "Al Nile", 0, nil);
    _fonts_EN[66] = CFAssetMake("Bradley Hand", "Bradley Hand", "Bradley Hand", 0, nil);
    _fonts_EN[67] = CFAssetMake("Trebuchet MS", "Trebuchet MS", "Trebuchet MS", 0, nil);
    _fonts_EN[68] = CFAssetMake("Hiragino Sans", "Hiragino Sans", "Hiragino Sans", 0, nil);
    _fonts_EN[69] = CFAssetMake("Hiragino Mincho ProN", "Hiragino Mincho ProN", "Hiragino Mincho ProN", 0, nil);
    _fonts_EN[70] = CFAssetMake("Devanagari Sangam MN", "Devanagari Sangam MN", "Devanagari Sangam MN", 0, nil);
    _fonts_EN[71] = CFAssetMake("Oriya Sangam MN", "OriyaSangamMN-Bold", "Oriya Sangam MN", 0, nil);
    _fonts_EN[72] = CFAssetMake("Zapf Dingbats", "Zapf Dingbats", "Zapf Dingbats", 0, nil);
    _fonts_EN[73] = CFAssetMake("Bodoni 72", "Bodoni 72", "Bodoni 72", 0, nil);
    _fonts_EN[74] = CFAssetMake("Bodoni 72 Smallcaps", "Bodoni 72 Smallcaps", "Bodoni 72 Smallcaps", 0, nil);
    _fonts_EN[75] = CFAssetMake("Bodoni 72 Oldstyle", "Bodoni 72 Oldstyle", "Bodoni 72 Oldstyle", 0, nil);
    _fonts_EN[76] = CFAssetMake("Baskerville", "Baskerville", "Baskerville", 0, nil);
    _fonts_EN[77] = CFAssetMake("Khmer Sangam MN", "Khmer Sangam MN", "Khmer Sangam MN", 0, nil);
    _fonts_EN[78] = CFAssetMake("Symbol", "Symbol", "Symbol", 0, nil);
    _fonts_EN[79] = CFAssetMake("Papyrus", "Papyrus", "Papyrus", 0, nil);
    _fonts_EN[80] = CFAssetMake("Euphemia UCAS", "Euphemia UCAS", "Euphemia UCAS", 0, nil);
    _fonts_EN[81] = CFAssetMake("Telugu Sangam MN", "Telugu Sangam MN", "Telugu Sangam MN", 0, nil);
    _fonts_EN[82] = CFAssetMake("Bangla Sangam MN", "Bangla Sangam MN", "Bangla Sangam MN", 0, nil);
    _fonts_EN[83] = CFAssetMake("Exo", "Exo-Regular", "Exo", 0, nil);
    _fonts_EN[84] = CFAssetMake("Exo 2", "Exo 2-Regular", "Exo 2", 0, nil);
    _fonts_EN[85] = CFAssetMake("ABeeZee", "ABeeZee", "ABeeZee", 0, nil);
    _fonts_EN[86] = CFAssetMake("Abel", "Abel", "Abel", 0, nil);
    _fonts_EN[87] = CFAssetMake("Abhaya Libre", "Abhaya Libre", "Abhaya Libre", 0, nil);
    _fonts_EN[88] = CFAssetMake("JejuGothic", "JejuGothic", "JejuGothic", 0, nil);
    _fonts_EN[89] = CFAssetMake("Elsie", "Elsie", "Elsie", 0, nil);
    _fonts_EN[90] = CFAssetMake("Podkova", "Podkova", "Podkova", 0, nil);
    _fonts_EN[91] = CFAssetMake("Abril Fatface", "Abril Fatface", "Abril Fatface", 0, nil);
    _fonts_EN[92] = CFAssetMake("Abyssinica SIL", "Abyssinica SIL", "Abyssinica SIL", 0, nil);
    _fonts_EN[93] = CFAssetMake("Acme", "Acme", "Acme", 0, nil);
    _fonts_EN[94] = CFAssetMake("Actor", "Actor", "Actor", 0, nil);
    _fonts_EN[95] = CFAssetMake("Advent Pro", "Advent Pro-Regular", "Advent Pro", 0, nil);
    _fonts_EN[96] = CFAssetMake("Aguafina Script", "Aguafina Script", "Aguafina Script", 0, nil);
    _fonts_EN[97] = CFAssetMake("Adamina", "Adamina", "Adamina", 0, nil);
    _fonts_EN[98] = CFAssetMake("Akronim", "Akronim", "Akronim", 0, nil);
    _fonts_EN[99] = CFAssetMake("Aladin", "Aladin", "Aladin", 0, nil);
    _fonts_EN[100] = CFAssetMake("Aldrich", "Aldrich", "Aldrich", 0, nil);
    _fonts_EN[101] = CFAssetMake("Alef", "Alef", "Alef", 0, nil);
    _fonts_EN[102] = CFAssetMake("Alegreya", "Alegreya", "Alegreya", 0, nil);
    _fonts_EN[103] = CFAssetMake("Alegreya SC", "Alegreya SC", "Alegreya SC", 0, nil);
    _fonts_EN[104] = CFAssetMake("Alegreya Sans SC", "Alegreya Sans SC-Regular", "Alegreya Sans SC", 0, nil);
    _fonts_EN[105] = CFAssetMake("Alex Brush", "Alex Brush", "Alex Brush", 0, nil);
    _fonts_EN[106] = CFAssetMake("Alfa Slab One", "Alfa Slab One", "Alfa Slab One", 0, nil);
    _fonts_EN[107] = CFAssetMake("Alice", "Alice", "Alice", 0, nil);
    _fonts_EN[108] = CFAssetMake("Alike", "Alike", "Alike", 0, nil);
    _fonts_EN[109] = CFAssetMake("Alike Angular", "Alike Angular", "Alike Angular", 0, nil);
    _fonts_EN[110] = CFAssetMake("Allan", "Allan", "Allan", 0, nil);
    _fonts_EN[111] = CFAssetMake("Allerta", "Allerta", "Allerta", 0, nil);
    _fonts_EN[112] = CFAssetMake("Allerta Stencil", "Allerta Stencil", "Allerta Stencil", 0, nil);
    _fonts_EN[113] = CFAssetMake("Allura", "Allura", "Allura", 0, nil);
    _fonts_EN[114] = CFAssetMake("Almendra", "Almendra", "Almendra", 0, nil);
    _fonts_EN[115] = CFAssetMake("Almendra SC", "Almendra SC", "Almendra SC", 0, nil);
    _fonts_EN[116] = CFAssetMake("Almendra Display", "Almendra Display", "Almendra Display", 0, nil);
    _fonts_EN[117] = CFAssetMake("Amatic SC", "Amatic SC", "Amatic SC", 0, nil);
    _fonts_EN[118] = CFAssetMake("Amaranth", "Amaranth", "Amaranth", 0, nil);
    _fonts_EN[119] = CFAssetMake("Amarante", "Amarante", "Amarante", 0, nil);
    _fonts_EN[120] = CFAssetMake("Amethysta", "Amethysta", "Amethysta", 0, nil);
    _fonts_EN[121] = CFAssetMake("Angkor", "Angkor", "Angkor", 0, nil);
    _fonts_EN[122] = CFAssetMake("Andika", "Andika", "Andika", 0, nil);
    _fonts_EN[123] = CFAssetMake("Andada", "Andada", "Andada", 0, nil);
    _fonts_EN[124] = CFAssetMake("Andada SC", "Andada SC", "Andada SC", 0, nil);
    _fonts_EN[125] = CFAssetMake("Anaheim", "Anaheim", "Anaheim", 0, nil);
    _fonts_EN[126] = CFAssetMake("Amita", "Amita", "Amita", 0, nil);
    _fonts_EN[127] = CFAssetMake("Amiri", "Amiri", "Amiri", 0, nil);
    _fonts_EN[128] = CFAssetMake("Arbutus", "Arbutus", "Arbutus", 0, nil);
    _fonts_EN[129] = CFAssetMake("Arbutus Slab", "Arbutus Slab", "Arbutus Slab", 0, nil);
    _fonts_EN[130] = CFAssetMake("Arapey", "Arapey", "Arapey", 0, nil);
    _fonts_EN[131] = CFAssetMake("Anton", "Anton", "Anton", 0, nil);
    _fonts_EN[132] = CFAssetMake("Antonio", "Antonio-Regular", "Antonio", 0, nil);
    _fonts_EN[133] = CFAssetMake("Antic", "Antic", "Antic", 0, nil);
    _fonts_EN[134] = CFAssetMake("Antic Slab", "Antic Slab", "Antic Slab", 0, nil);
    _fonts_EN[135] = CFAssetMake("Antic Didone", "Antic Didone", "Antic Didone", 0, nil);
    _fonts_EN[136] = CFAssetMake("Anonymous Pro", "Anonymous Pro", "Anonymous Pro", 0, nil);
    _fonts_EN[137] = CFAssetMake("Annie Use Your Telescope", "Annie Use Your Telescope", "Annie Use Your Telescope", 0, nil);
    _fonts_EN[138] = CFAssetMake("Archivo Narrow", "Archivo Narrow", "Archivo Narrow", 0, nil);
    _fonts_EN[139] = CFAssetMake("Archivo Black", "Archivo Black", "Archivo Black", 0, nil);
    _fonts_EN[140] = CFAssetMake("Architects Daughter", "Architects Daughter", "Architects Daughter", 0, nil);
    _fonts_EN[141] = CFAssetMake("Artifika", "Artifika", "Artifika", 0, nil);
    _fonts_EN[142] = CFAssetMake("Armata", "Armata", "Armata", 0, nil);
    _fonts_EN[143] = CFAssetMake("Arizonia", "Arizonia", "Arizonia", 0, nil);
    _fonts_EN[144] = CFAssetMake("Asset", "Asset", "Asset", 0, nil);
    _fonts_EN[145] = CFAssetMake("Asar", "Asar", "Asar", 0, nil);
    _fonts_EN[146] = CFAssetMake("Asap", "Asap", "Asap", 0, nil);
    _fonts_EN[147] = CFAssetMake("Arya", "Arya", "Arya", 0, nil);
    _fonts_EN[148] = CFAssetMake("Arvo", "Arvo", "Arvo", 0, nil);
    _fonts_EN[149] = CFAssetMake("Aubrey", "Aubrey", "Aubrey", 0, nil);
    _fonts_EN[150] = CFAssetMake("Atomic Age", "Atomic Age", "Atomic Age", 0, nil);
    _fonts_EN[151] = CFAssetMake("Asul", "Asul", "Asul", 0, nil);
    _fonts_EN[152] = CFAssetMake("Astloch", "Astloch-Bold", "Astloch", 0, nil);
    _fonts_EN[153] = CFAssetMake("Average", "Average", "Average", 0, nil);
    _fonts_EN[154] = CFAssetMake("Average Sans", "Average Sans", "Average Sans", 0, nil);
    _fonts_EN[155] = CFAssetMake("Autour One", "Autour One", "Autour One", 0, nil);
    _fonts_EN[156] = CFAssetMake("Audiowide", "Audiowide", "Audiowide", 0, nil);
    _fonts_EN[157] = CFAssetMake("Averia Libre", "Averia Libre", "Averia Libre", 0, nil);
    _fonts_EN[158] = CFAssetMake("Averia Serif Libre", "Averia Serif Libre", "Averia Serif Libre", 0, nil);
    _fonts_EN[159] = CFAssetMake("Averia Sans Libre", "Averia Sans Libre", "Averia Sans Libre", 0, nil);
    _fonts_EN[160] = CFAssetMake("Averia Gruesa Libre", "Averia Gruesa Libre", "Averia Gruesa Libre", 0, nil);
    _fonts_EN[161] = CFAssetMake("Baloo", "Baloo", "Baloo", 0, nil);
    _fonts_EN[162] = CFAssetMake("Basic", "Basic", "Basic", 0, nil);
    _fonts_EN[163] = CFAssetMake("Bangers", "Bangers", "Bangers", 0, nil);
    _fonts_EN[164] = CFAssetMake("Balthazar", "Balthazar", "Balthazar", 0, nil);
    _fonts_EN[165] = CFAssetMake("Baumans", "Baumans", "Baumans", 0, nil);
    _fonts_EN[166] = CFAssetMake("Bentham", "Bentham", "Bentham", 0, nil);
    _fonts_EN[167] = CFAssetMake("BenchNine", "BenchNine-Regular", "BenchNine", 0, nil);
    _fonts_EN[168] = CFAssetMake("Belleza", "Belleza", "Belleza", 0, nil);
    _fonts_EN[169] = CFAssetMake("Belgrano", "Belgrano", "Belgrano", 0, nil);
    _fonts_EN[170] = CFAssetMake("Berkshire Swash", "Berkshire Swash", "Berkshire Swash", 0, nil);
    _fonts_EN[171] = CFAssetMake("Bevan", "Bevan", "Bevan", 0, nil);
    _fonts_EN[172] = CFAssetMake("Bhavuka", "Bhavuka", "Bhavuka", 0, nil);
    _fonts_EN[173] = CFAssetMake("Bilbo", "Bilbo", "Bilbo", 0, nil);
    _fonts_EN[174] = CFAssetMake("Bigshot One", "Bigshot One", "Bigshot One", 0, nil);
    _fonts_EN[175] = CFAssetMake("Bigelow Rules", "Bigelow Rules", "Bigelow Rules", 0, nil);
    _fonts_EN[176] = CFAssetMake("Black Ops One", "Black Ops One", "Black Ops One", 0, nil);
    _fonts_EN[177] = CFAssetMake("Bitter", "Bitter", "Bitter", 0, nil);
    _fonts_EN[178] = CFAssetMake("Biryani", "Biryani", "Biryani", 0, nil);
    _fonts_EN[179] = CFAssetMake("Bilbo Swash Caps", "Bilbo Swash Caps", "Bilbo Swash Caps", 0, nil);
    _fonts_EN[180] = CFAssetMake("Bonbon", "Bonbon", "Bonbon", 0, nil);
    _fonts_EN[181] = CFAssetMake("Boogaloo", "Boogaloo", "Boogaloo", 0, nil);
    _fonts_EN[182] = CFAssetMake("Bowlby One", "Bowlby One", "Bowlby One", 0, nil);
    _fonts_EN[183] = CFAssetMake("Bowlby One SC", "Bowlby One SC", "Bowlby One SC", 0, nil);
    _fonts_EN[184] = CFAssetMake("Brawler", "Brawler", "Brawler", 0, nil);
    _fonts_EN[185] = CFAssetMake("Bree Serif", "Bree Serif", "Bree Serif", 0, nil);
    _fonts_EN[186] = CFAssetMake("Bruno Ace", "Bruno Ace", "Bruno Ace", 0, nil);
    _fonts_EN[187] = CFAssetMake("Bruno Ace SC", "Bruno Ace SC", "Bruno Ace SC", 0, nil);
    _fonts_EN[188] = CFAssetMake("Bubblegum Sans", "Bubblegum Sans", "Bubblegum Sans", 0, nil);
    _fonts_EN[189] = CFAssetMake("Bubbler One", "Bubbler One", "Bubbler One", 0, nil);
    _fonts_EN[190] = CFAssetMake("Buda", "Buda", "Buda", 0, nil);
    _fonts_EN[191] = CFAssetMake("Buenard", "Buenard", "Buenard", 0, nil);
    _fonts_EN[192] = CFAssetMake("Butcherman", "Butcherman", "Butcherman", 0, nil);
    _fonts_EN[193] = CFAssetMake("Cabin", "Cabin", "Cabin", 0, nil);
    _fonts_EN[194] = CFAssetMake("Cabin Condensed", "Cabin Condensed", "Cabin Condensed", 0, nil);
    _fonts_EN[195] = CFAssetMake("Cabin Sketch", "Cabin Sketch", "Cabin Sketch", 0, nil);
    _fonts_EN[196] = CFAssetMake("Caesar Dressing", "Caesar Dressing", "Caesar Dressing", 0, nil);
    _fonts_EN[197] = CFAssetMake("Cagliostro", "Cagliostro", "Cagliostro", 0, nil);
    _fonts_EN[198] = CFAssetMake("Cambay", "Cambay", "Cambay", 0, nil);
    _fonts_EN[199] = CFAssetMake("Cambo", "Cambo", "Cambo", 0, nil);
    _fonts_EN[200] = CFAssetMake("Candal", "Candal", "Candal", 0, nil);
    _fonts_EN[201] = CFAssetMake("Cantarell", "Cantarell", "Cantarell", 0, nil);
    _fonts_EN[202] = CFAssetMake("Cantata One", "Cantata One", "Cantata One", 0, nil);
    _fonts_EN[203] = CFAssetMake("CantoraOne", "CantoraOne", "CantoraOne", 0, nil);
    _fonts_EN[204] = CFAssetMake("Capriola", "Capriola", "Capriola", 0, nil);
    _fonts_EN[205] = CFAssetMake("Cardo", "Cardo", "Cardo", 0, nil);
    _fonts_EN[206] = CFAssetMake("Carme", "Carme", "Carme", 0, nil);
    _fonts_EN[207] = CFAssetMake("Carrois Gothic", "Carrois Gothic", "Carrois Gothic", 0, nil);
    _fonts_EN[208] = CFAssetMake("Carter One", "Carter One", "Carter One", 0, nil);
    _fonts_EN[209] = CFAssetMake("Catamaran", "Catamaran-Regular", "Catamaran", 0, nil);
    _fonts_EN[210] = CFAssetMake("Caudex", "Caudex", "Caudex", 0, nil);
    _fonts_EN[211] = CFAssetMake("Caveat", "Caveat-Bold", "Caveat", 0, nil);
    _fonts_EN[212] = CFAssetMake("Caveat Brush", "Caveat Brush", "Caveat Brush", 0, nil);
    _fonts_EN[213] = CFAssetMake("Cedarville Cursive", "Cedarville Cursive", "Cedarville Cursive", 0, nil);
    _fonts_EN[214] = CFAssetMake("Ceviche One", "Ceviche One", "Ceviche One", 0, nil);
    _fonts_EN[215] = CFAssetMake("Changa One", "Changa One", "Changa One", 0, nil);
    _fonts_EN[216] = CFAssetMake("Chango", "Chango", "Chango", 0, nil);
    _fonts_EN[217] = CFAssetMake("Chau Philomene One", "Chau Philomene One", "Chau Philomene One", 0, nil);
    _fonts_EN[218] = CFAssetMake("Chela One", "Chela One", "Chela One", 0, nil);
    _fonts_EN[219] = CFAssetMake("Chelsea Market", "Chelsea Market", "Chelsea Market", 0, nil);
    _fonts_EN[220] = CFAssetMake("Cherry Swash", "Cherry Swash", "Cherry Swash", 0, nil);
    _fonts_EN[221] = CFAssetMake("Chicle", "Chicle", "Chicle", 0, nil);
    _fonts_EN[222] = CFAssetMake("Chivo", "Chivo", "Chivo", 0, nil);
    _fonts_EN[223] = CFAssetMake("Chonburi", "Chonburi", "Chonburi", 0, nil);
    _fonts_EN[224] = CFAssetMake("Cinzel", "Cinzel", "Cinzel", 0, nil);
    _fonts_EN[225] = CFAssetMake("Cinzel Decorative", "Cinzel Decorative", "Cinzel Decorative", 0, nil);
    _fonts_EN[226] = CFAssetMake("Clara", "Clara", "Clara", 0, nil);
    _fonts_EN[227] = CFAssetMake("Clicker Script", "Clicker Script", "Clicker Script", 0, nil);
    _fonts_EN[228] = CFAssetMake("Coda", "Coda", "Coda", 0, nil);
    _fonts_EN[229] = CFAssetMake("Coda Caption", "Coda Caption", "Coda Caption", 0, nil);
    _fonts_EN[230] = CFAssetMake("Codystar", "Codystar", "Codystar", 0, nil);
    _fonts_EN[231] = CFAssetMake("Combo", "Combo", "Combo", 0, nil);
    _fonts_EN[232] = CFAssetMake("Comfortaa", "Comfortaa", "Comfortaa", 0, nil);
    _fonts_EN[233] = CFAssetMake("Concert One", "Concert One", "Concert One", 0, nil);
    _fonts_EN[234] = CFAssetMake("Condiment", "Condiment", "Condiment", 0, nil);
    _fonts_EN[235] = CFAssetMake("Contrail One", "Contrail One", "Contrail One", 0, nil);
    _fonts_EN[236] = CFAssetMake("Convergence", "Convergence", "Convergence", 0, nil);
    _fonts_EN[237] = CFAssetMake("Cookie", "Cookie", "Cookie", 0, nil);
    _fonts_EN[238] = CFAssetMake("Copse", "Copse", "Copse", 0, nil);
    _fonts_EN[239] = CFAssetMake("Corben", "Corben", "Corben", 0, nil);
    _fonts_EN[240] = CFAssetMake("Courgette", "Courgette", "Courgette", 0, nil);
    _fonts_EN[241] = CFAssetMake("Coustard", "Coustard", "Coustard", 0, nil);
    _fonts_EN[242] = CFAssetMake("Covered By Your Grace", "Covered By Your Grace", "Covered By Your Grace", 0, nil);
    _fonts_EN[243] = CFAssetMake("Creepster", "Creepster", "Creepster", 0, nil);
    _fonts_EN[244] = CFAssetMake("Crete Round", "Crete Round", "Crete Round", 0, nil);
    _fonts_EN[245] = CFAssetMake("Crimson Text", "Crimson Text", "Crimson Text", 0, nil);
    _fonts_EN[246] = CFAssetMake("Croissant One", "Croissant One", "Croissant One", 0, nil);
    _fonts_EN[247] = CFAssetMake("Cuprum", "Cuprum", "Cuprum", 0, nil);
    _fonts_EN[248] = CFAssetMake("Cutive", "Cutive", "Cutive", 0, nil);
    _fonts_EN[249] = CFAssetMake("Cutive Mono", "Cutive Mono", "Cutive Mono", 0, nil);
    _fonts_EN[250] = CFAssetMake("Damion", "Damion", "Damion", 0, nil);
    _fonts_EN[251] = CFAssetMake("Dancing Script", "Dancing Script", "Dancing Script", 0, nil);
    _fonts_EN[252] = CFAssetMake("Dawning of a New Day", "Dawning of a New Day", "Dawning of a New Day", 0, nil);
    _fonts_EN[253] = CFAssetMake("Days One", "Days One", "Days One", 0, nil);
    _fonts_EN[254] = CFAssetMake("Dekko", "Dekko", "Dekko", 0, nil);
    _fonts_EN[255] = CFAssetMake("Delius", "Delius", "Delius", 0, nil);
    _fonts_EN[256] = CFAssetMake("Delius Swash Caps", "Delius Swash Caps", "Delius Swash Caps", 0, nil);
    _fonts_EN[257] = CFAssetMake("Delius Unicase", "Delius Unicase", "Delius Unicase", 0, nil);
    _fonts_EN[258] = CFAssetMake("Della Respira", "Della Respira", "Della Respira", 0, nil);
    _fonts_EN[259] = CFAssetMake("Denk One", "Denk One", "Denk One", 0, nil);
    _fonts_EN[260] = CFAssetMake("Devonshire", "Devonshire", "Devonshire", 0, nil);
    _fonts_EN[261] = CFAssetMake("Dhurjati", "Dhurjati", "Dhurjati", 0, nil);
    _fonts_EN[262] = CFAssetMake("Dhyana", "Dhyana", "Dhyana", 0, nil);
    _fonts_EN[263] = CFAssetMake("Didact Gothic", "Didact Gothic", "Didact Gothic", 0, nil);
    _fonts_EN[264] = CFAssetMake("Digital Numbers", "Digital Numbers", "Digital Numbers", 0, nil);
    _fonts_EN[265] = CFAssetMake("Dinah", "Dinah", "Dinah", 0, nil);
    _fonts_EN[266] = CFAssetMake("Diplomata", "Diplomata", "Diplomata", 0, nil);
    _fonts_EN[267] = CFAssetMake("Diplomata SC", "Diplomata SC", "Diplomata SC", 0, nil);
    _fonts_EN[268] = CFAssetMake("Domine", "Domine", "Domine", 0, nil);
    _fonts_EN[269] = CFAssetMake("Donegal One", "Donegal One", "Donegal One", 0, nil);
    _fonts_EN[270] = CFAssetMake("Doppio One", "Doppio One", "Doppio One", 0, nil);
    _fonts_EN[271] = CFAssetMake("Dorsa", "Dorsa", "Dorsa", 0, nil);
    _fonts_EN[272] = CFAssetMake("Dosis", "Dosis-Regular", "Dosis", 0, nil);
    _fonts_EN[273] = CFAssetMake("Dr Sugiyama", "Dr Sugiyama", "Dr Sugiyama", 0, nil);
    _fonts_EN[274] = CFAssetMake("Duru Sans", "Duru Sans", "Duru Sans", 0, nil);
    _fonts_EN[275] = CFAssetMake("Dynalight", "Dynalight", "Dynalight", 0, nil);
    _fonts_EN[276] = CFAssetMake("Eagle Lake", "Eagle Lake", "Eagle Lake", 0, nil);
    _fonts_EN[277] = CFAssetMake("Eater", "Eater", "Eater", 0, nil);
    _fonts_EN[278] = CFAssetMake("Eater Caps", "Eater Caps", "Eater Caps", 0, nil);
    _fonts_EN[279] = CFAssetMake("EB Garamond", "EB Garamond", "EB Garamond", 0, nil);
    _fonts_EN[280] = CFAssetMake("Economica", "Economica", "Economica", 0, nil);
    _fonts_EN[281] = CFAssetMake("Eczar", "Eczar", "Eczar", 0, nil);
    _fonts_EN[282] = CFAssetMake("Ek Mukta", "EkMukta-Regula", "Ek Mukta", 0, nil);
    _fonts_EN[283] = CFAssetMake("Electrolize", "Electrolize", "Electrolize", 0, nil);
    _fonts_EN[284] = CFAssetMake("Elsie Swash Caps", "Elsie Swash Caps", "Elsie Swash Caps", 0, nil);
    _fonts_EN[285] = CFAssetMake("Emblema One", "Emblema One", "Emblema One", 0, nil);
    _fonts_EN[286] = CFAssetMake("Emilys Candy", "Emilys Candy", "Emilys Candy", 0, nil);
    _fonts_EN[287] = CFAssetMake("Encode Sans", "EncodeSans-Regula", "Encode Sans", 0, nil);
    _fonts_EN[288] = CFAssetMake("Encode Sans Compressed", "EncodeSansCompressed-Regula", "Encode Sans Compressed", 0, nil);
    _fonts_EN[289] = CFAssetMake("Encode Sans Condensed", "EncodeSansCondensed-Regula", "Encode Sans Condensed", 0, nil);
    _fonts_EN[290] = CFAssetMake("Encode Sans Narrow", "EncodeSansNarrow-Regula", "Encode Sans Narrow", 0, nil);
    _fonts_EN[291] = CFAssetMake("Encode Sans Wide", "EncodeSansWide-Regula", "Encode Sans Wide", 0, nil);
    _fonts_EN[292] = CFAssetMake("Engagement", "Engagement", "Engagement", 0, nil);
    _fonts_EN[293] = CFAssetMake("Englebert", "Englebert", "Englebert", 0, nil);
    _fonts_EN[294] = CFAssetMake("Enriqueta", "Enriqueta", "Enriqueta", 0, nil);
    _fonts_EN[295] = CFAssetMake("Erica One", "Erica One", "Erica One", 0, nil);
    _fonts_EN[296] = CFAssetMake("Esteban", "Esteban", "Esteban", 0, nil);
    _fonts_EN[297] = CFAssetMake("Euphoria Script", "Euphoria Script", "Euphoria Script", 0, nil);
    _fonts_EN[298] = CFAssetMake("Ewert", "Ewert", "Ewert", 0, nil);
    _fonts_EN[299] = CFAssetMake("Expletus Sans", "Expletus Sans", "Expletus Sans", 0, nil);
    _fonts_EN[300] = CFAssetMake("Fanwood Text", "Fanwood Text", "Fanwood Text", 0, nil);
    _fonts_EN[301] = CFAssetMake("Fascinate", "Fascinate", "Fascinate", 0, nil);
    _fonts_EN[302] = CFAssetMake("Fascinate Inline", "Fascinate Inline", "Fascinate Inline", 0, nil);
    _fonts_EN[303] = CFAssetMake("Faster One", "Faster One", "Faster One", 0, nil);
    _fonts_EN[304] = CFAssetMake("Fauna One", "Fauna One", "Fauna One", 0, nil);
    _fonts_EN[305] = CFAssetMake("Federo", "Federo", "Federo", 0, nil);
    _fonts_EN[306] = CFAssetMake("Federant", "Federant", "Federant", 0, nil);
    _fonts_EN[307] = CFAssetMake("Felipa", "Felipa", "Felipa", 0, nil);
    _fonts_EN[308] = CFAssetMake("Fenix", "Fenix", "Fenix", 0, nil);
    _fonts_EN[309] = CFAssetMake("Finger Paint", "Finger Paint", "Finger Paint", 0, nil);
    _fonts_EN[310] = CFAssetMake("Fira Mono", "Fira Mono", "Fira Mono", 0, nil);
    _fonts_EN[311] = CFAssetMake("Fira Sans", "FiraSans-Regular", "Fira Sans", 0, nil);
    _fonts_EN[312] = CFAssetMake("Fjalla One", "Fjalla One", "Fjalla One", 0, nil);
    _fonts_EN[313] = CFAssetMake("Fjord", "Fjord", "Fjord", 0, nil);
    _fonts_EN[314] = CFAssetMake("Flamenco", "Flamenco-Regular", "Flamenco", 0, nil);
    _fonts_EN[315] = CFAssetMake("Flavors", "Flavors", "Flavors", 0, nil);
    _fonts_EN[316] = CFAssetMake("Fondamento", "Fondamento", "Fondamento", 0, nil);
    _fonts_EN[317] = CFAssetMake("Forum", "Forum", "Forum", 0, nil);
    _fonts_EN[318] = CFAssetMake("Francois One", "Francois One", "Francois One", 0, nil);
    _fonts_EN[319] = CFAssetMake("Freckle Face", "Freckle Face", "Freckle Face", 0, nil);
    _fonts_EN[320] = CFAssetMake("Fredericka the Great", "Fredericka the Great", "Fredericka the Great", 0, nil);
    _fonts_EN[321] = CFAssetMake("Fredoka One", "Fredoka One", "Fredoka One", 0, nil);
    _fonts_EN[322] = CFAssetMake("Fresca", "Fresca", "Fresca", 0, nil);
    _fonts_EN[323] = CFAssetMake("Frijole", "Frijole", "Frijole", 0, nil);
    _fonts_EN[324] = CFAssetMake("Fruktur", "Fruktur", "Fruktur", 0, nil);
    _fonts_EN[325] = CFAssetMake("Fugaz One", "Fugaz One", "Fugaz One", 0, nil);
    _fonts_EN[326] = CFAssetMake("Gabriela", "Gabriela", "Gabriela", 0, nil);
    _fonts_EN[327] = CFAssetMake("Gafata", "Gafata", "Gafata", 0, nil);
    _fonts_EN[328] = CFAssetMake("Galdeano", "Galdeano", "Galdeano", 0, nil);
    _fonts_EN[329] = CFAssetMake("Galindo", "Galindo", "Galindo", 0, nil);
    _fonts_EN[330] = CFAssetMake("Geo", "Geo", "Geo", 0, nil);
    _fonts_EN[331] = CFAssetMake("Gentium Basic", "Gentium Basic", "Gentium Basic", 0, nil);
    _fonts_EN[332] = CFAssetMake("Gentium Book Basic", "Gentium Book Basic", "Gentium Book Basic", 0, nil);
    _fonts_EN[333] = CFAssetMake("Geostar", "Geostar", "Geostar", 0, nil);
    _fonts_EN[334] = CFAssetMake("Geostar Fill", "Geostar Fill", "Geostar Fill", 0, nil);
    _fonts_EN[335] = CFAssetMake("Germania One", "Germania One", "Germania One", 0, nil);
    _fonts_EN[336] = CFAssetMake("GFS Didot", "GFS Didot", "GFS Didot", 0, nil);
    _fonts_EN[337] = CFAssetMake("GFS Neohellenic", "GFS Neohellenic", "GFS Neohellenic", 0, nil);
    _fonts_EN[338] = CFAssetMake("Gidugu", "Gidugu", "Gidugu", 0, nil);
    _fonts_EN[339] = CFAssetMake("Gilda Display", "Gilda Display", "Gilda Display", 0, nil);
    _fonts_EN[340] = CFAssetMake("Give You Glory", "Give You Glory", "Give You Glory", 0, nil);
    _fonts_EN[341] = CFAssetMake("Glass Antiqua", "Glass Antiqua", "Glass Antiqua", 0, nil);
    _fonts_EN[342] = CFAssetMake("Glegoo", "Glegoo", "Glegoo", 0, nil);
    _fonts_EN[343] = CFAssetMake("Gloria Hallelujah", "Gloria Hallelujah", "Gloria Hallelujah", 0, nil);
    _fonts_EN[344] = CFAssetMake("Goblin One", "Goblin One", "Goblin One", 0, nil);
    _fonts_EN[345] = CFAssetMake("Gochi Hand", "Gochi Hand", "Gochi Hand", 0, nil);
    _fonts_EN[346] = CFAssetMake("Gorditas", "Gorditas", "Gorditas", 0, nil);
    _fonts_EN[347] = CFAssetMake("Goudy Bookletter 1911", "Goudy Bookletter 1911", "Goudy Bookletter 1911", 0, nil);
    _fonts_EN[348] = CFAssetMake("Graduate", "Graduate", "Graduate", 0, nil);
    _fonts_EN[349] = CFAssetMake("Grand Hotel", "Grand Hotel", "Grand Hotel", 0, nil);
    _fonts_EN[350] = CFAssetMake("Gravitas One", "Gravitas One", "Gravitas One", 0, nil);
    _fonts_EN[351] = CFAssetMake("Great Vibes", "Great Vibes", "Great Vibes", 0, nil);
    _fonts_EN[352] = CFAssetMake("Griffy", "Griffy", "Griffy", 0, nil);
    _fonts_EN[353] = CFAssetMake("Gruppo", "Gruppo", "Gruppo", 0, nil);
    _fonts_EN[354] = CFAssetMake("Gudea", "Gudea", "Gudea", 0, nil);
    _fonts_EN[355] = CFAssetMake("Gurajada", "Gurajada", "Gurajada", 0, nil);
    _fonts_EN[356] = CFAssetMake("Habibi", "Habibi", "Habibi", 0, nil);
    _fonts_EN[357] = CFAssetMake("Halant", "Halant", "Halant", 0, nil);
    _fonts_EN[358] = CFAssetMake("HammersmithOne", "HammersmithOne", "HammersmithOne", 0, nil);
    _fonts_EN[359] = CFAssetMake("Hanalei", "Hanalei", "Hanalei", 0, nil);
    _fonts_EN[360] = CFAssetMake("Hanalei Fill", "Hanalei Fill", "Hanalei Fill", 0, nil);
    _fonts_EN[361] = CFAssetMake("Handlee", "Handlee", "Handlee", 0, nil);
    _fonts_EN[362] = CFAssetMake("Khmer Sangam MN", "Khmer Sangam MN", "Khmer Sangam MN", 0, nil);
    _fonts_EN[363] = CFAssetMake("Happy Monkey", "Happy Monkey", "Happy Monkey", 0, nil);
    _fonts_EN[364] = CFAssetMake("HeadlandOne", "HeadlandOne", "HeadlandOne", 0, nil);
    _fonts_EN[365] = CFAssetMake("Henny Penny", "Henny Penny", "Henny Penny", 0, nil);
    _fonts_EN[366] = CFAssetMake("Hermeneus One", "Hermeneus One", "Hermeneus One", 0, nil);
    _fonts_EN[367] = CFAssetMake("Herr Von Muellerhoff", "Herr Von Muellerhoff", "Herr Von Muellerhoff", 0, nil);
    _fonts_EN[368] = CFAssetMake("Hind", "Hind-Regular", "Hind", 0, nil);
    _fonts_EN[369] = CFAssetMake("Hind Colombo", "HindColombo-Regular", "Hind Colombo", 0, nil);
    _fonts_EN[370] = CFAssetMake("Hind Guntur", "HindGuntur-Regular", "Hind Guntur", 0, nil);
    _fonts_EN[371] = CFAssetMake("Hind Jalandhar", "HindJalandhar-Regular", "Hind Jalandhar", 0, nil);
    _fonts_EN[372] = CFAssetMake("Hind Kochi", "HindKochi-Regular", "Hind Kochi", 0, nil);
    _fonts_EN[373] = CFAssetMake("Hind Madurai", "HindMadurai-Regular", "Hind Madurai", 0, nil);
    _fonts_EN[374] = CFAssetMake("Hind Mysuru", "HindMysuru-Regular", "Hind Mysuru", 0, nil);
    _fonts_EN[375] = CFAssetMake("Hind Siliguri", "HindSiliguri-Regular", "Hind Siliguri", 0, nil);
    _fonts_EN[376] = CFAssetMake("Hind Vadodara", "Hind Vadodara-Regular", "Hind Vadodara", 0, nil);
    _fonts_EN[377] = CFAssetMake("Holtwood One SC", "Holtwood One SC", "Holtwood One SC", 0, nil);
    _fonts_EN[378] = CFAssetMake("Homenaje", "Homenaje", "Homenaje", 0, nil);
    _fonts_EN[379] = CFAssetMake("Iceberg", "Iceberg", "Iceberg", 0, nil);
    _fonts_EN[380] = CFAssetMake("Iceland", "Iceland", "Iceland", 0, nil);
    _fonts_EN[381] = CFAssetMake("IM FELL Double Pica", "IM FELL Double Pica", "IM FELL Double Pica", 0, nil);
    _fonts_EN[382] = CFAssetMake("IM FELL Double Pica SC", "IM FELL Double Pica SC", "IM FELL Double Pica SC", 0, nil);
    _fonts_EN[383] = CFAssetMake("IM FELL DW Pica SC", "IM FELL DW Pica SC", "IM FELL DW Pica SC", 0, nil);
    _fonts_EN[384] = CFAssetMake("IM FELL Great Primer", "IM FELL Great Primer", "IM FELL Great Primer", 0, nil);
    _fonts_EN[385] = CFAssetMake("IM FELL English", "IM FELL English", "IM FELL English", 0, nil);
    _fonts_EN[386] = CFAssetMake("IM FELL English SC", "IM FELL English SC", "IM FELL English SC", 0, nil);
    _fonts_EN[387] = CFAssetMake("IM FELL French Canon", "IM FELL French Canon", "IM FELL French Canon", 0, nil);
    _fonts_EN[388] = CFAssetMake("IM FELL French Canon SC", "IM FELL French Canon SC", "IM FELL French Canon SC", 0, nil);
    _fonts_EN[389] = CFAssetMake("IM FELL DW Pica", "IM FELL DW Pica", "IM FELL DW Pica", 0, nil);
    _fonts_EN[390] = CFAssetMake("IM FELL Great Primer SC", "IM FELL Great Primer SC", "IM FELL Great Primer SC", 0, nil);
    _fonts_EN[391] = CFAssetMake("Imprima", "Imprima", "Imprima", 0, nil);
    _fonts_EN[392] = CFAssetMake("Inconsolata", "Inconsolata", "Inconsolata", 0, nil);
    _fonts_EN[393] = CFAssetMake("Inder", "Inder", "Inder", 0, nil);
    _fonts_EN[394] = CFAssetMake("Indie Flower", "Indie Flower", "Indie Flower", 0, nil);
    _fonts_EN[395] = CFAssetMake("Inika", "Inika", "Inika", 0, nil);
    _fonts_EN[396] = CFAssetMake("Inknut Antiqua", "Inknut Antiqua", "Inknut Antiqua", 0, nil);
    _fonts_EN[397] = CFAssetMake("Istok Web", "Istok Web", "Istok Web", 0, nil);
    _fonts_EN[398] = CFAssetMake("Italiana", "Italiana", "Italiana", 0, nil);
    _fonts_EN[399] = CFAssetMake("Italianno", "Italianno", "Italianno", 0, nil);
    _fonts_EN[400] = CFAssetMake("Itim", "Itim", "Itim", 0, nil);
    _fonts_EN[401] = CFAssetMake("Jacques Francois", "Jacques Francois", "Jacques Francois", 0, nil);
    _fonts_EN[402] = CFAssetMake("Jacques Francois Shadow", "Jacques Francois Shadow", "Jacques Francois Shadow", 0, nil);
    _fonts_EN[403] = CFAssetMake("Jaldi", "Jaldi", "Jaldi", 0, nil);
    _fonts_EN[404] = CFAssetMake("Jim Nightshade", "Jim Nightshade", "Jim Nightshade", 0, nil);
    _fonts_EN[405] = CFAssetMake("Jockey One", "Jockey One", "Jockey One", 0, nil);
    _fonts_EN[406] = CFAssetMake("Jolly Lodger", "Jolly Lodger", "Jolly Lodger", 0, nil);
    _fonts_EN[407] = CFAssetMake("Josefin Sans", "Josefin Sans", "Josefin Sans", 0, nil);
    _fonts_EN[408] = CFAssetMake("Josefin Sans Std", "Josefin Sans Std", "Josefin Sans Std", 0, nil);
    _fonts_EN[409] = CFAssetMake("Josefin Slab", "JosefinSlab-Bold", "Josefin Slab", 0, nil);
    _fonts_EN[410] = CFAssetMake("Joti One", "Joti One", "Joti One", 0, nil);
    _fonts_EN[411] = CFAssetMake("Judson", "Judson", "Judson", 0, nil);
    _fonts_EN[412] = CFAssetMake("Julee", "Julee", "Julee", 0, nil);
    _fonts_EN[413] = CFAssetMake("Julius Sans One", "Julius Sans One", "Julius Sans One", 0, nil);
    _fonts_EN[414] = CFAssetMake("Junge", "Junge", "Junge", 0, nil);
    _fonts_EN[415] = CFAssetMake("Jura", "Jura", "Jura", 0, nil);
    _fonts_EN[416] = CFAssetMake("Just Me Again Down Here", "Just Me Again Down Here", "Just Me Again Down Here", 0, nil);
    _fonts_EN[417] = CFAssetMake("Kadwa", "Kadwa", "Kadwa", 0, nil);
    _fonts_EN[418] = CFAssetMake("Kalam", "Kalam", "Kalam", 0, nil);
    _fonts_EN[419] = CFAssetMake("Kameron", "Kameron", "Kameron", 0, nil);
    _fonts_EN[420] = CFAssetMake("Kanit", "Kanit-Regular", "Kanit", 0, nil);
    _fonts_EN[421] = CFAssetMake("Kantumruy", "Kantumruy", "Kantumruy", 0, nil);
    _fonts_EN[422] = CFAssetMake("Karla", "Karla", "Karla", 0, nil);
    _fonts_EN[423] = CFAssetMake("Karma", "Karma-Regular", "Karma", 0, nil);
    _fonts_EN[424] = CFAssetMake("Kaushan Script", "Kaushan Script", "Kaushan Script", 0, nil);
    _fonts_EN[425] = CFAssetMake("Kavoon", "Kavoon", "Kavoon", 0, nil);
    _fonts_EN[426] = CFAssetMake("Keania One", "Keania One", "Keania One", 0, nil);
    _fonts_EN[427] = CFAssetMake("Kelly Slab", "Kelly Slab", "Kelly Slab", 0, nil);
    _fonts_EN[428] = CFAssetMake("Kenia", "Kenia", "Kenia", 0, nil);
    _fonts_EN[429] = CFAssetMake("Khand", "Khand", "Khand", 0, nil);
    _fonts_EN[430] = CFAssetMake("Khula", "Khula-Regular", "Khula", 0, nil);
    _fonts_EN[431] = CFAssetMake("Kite One", "Kite One", "Kite One", 0, nil);
    _fonts_EN[432] = CFAssetMake("Knewave", "Knewave", "Knewave", 0, nil);
    _fonts_EN[433] = CFAssetMake("Kotta One", "Kotta One", "Kotta One", 0, nil);
    _fonts_EN[434] = CFAssetMake("Kreon", "Kreon-Regular", "Kreon", 0, nil);
    _fonts_EN[435] = CFAssetMake("Kristi", "Kristi", "Kristi", 0, nil);
    _fonts_EN[436] = CFAssetMake("Krona One", "Krona One", "Krona One", 0, nil);
    _fonts_EN[437] = CFAssetMake("Kurale", "Kurale", "Kurale", 0, nil);
    _fonts_EN[438] = CFAssetMake("La Belle Aurore", "La Belle Aurore", "La Belle Aurore", 0, nil);
    _fonts_EN[439] = CFAssetMake("Laila", "Laila-Regular", "Laila", 0, nil);
    _fonts_EN[440] = CFAssetMake("Lakki Reddy", "Lakki Reddy", "Lakki Reddy", 0, nil);
    _fonts_EN[441] = CFAssetMake("Lancelot", "Lancelot", "Lancelot", 0, nil);
    _fonts_EN[442] = CFAssetMake("Lateef", "Lateef", "Lateef", 0, nil);
    _fonts_EN[443] = CFAssetMake("Lato", "Lato-Regular", "Lato", 0, nil);
    _fonts_EN[444] = CFAssetMake("League Script", "League Script", "League Script", 0, nil);
    _fonts_EN[445] = CFAssetMake("Leckerli One", "Leckerli One", "Leckerli One", 0, nil);
    _fonts_EN[446] = CFAssetMake("Ledger", "Ledger", "Ledger", 0, nil);
    _fonts_EN[447] = CFAssetMake("Lekton", "Lekton-Bold", "Lekton", 0, nil);
    _fonts_EN[448] = CFAssetMake("Lemon", "Lemon", "Lemon", 0, nil);
    _fonts_EN[449] = CFAssetMake("Lemon One", "Lemon One", "Lemon One", 0, nil);
    _fonts_EN[450] = CFAssetMake("Libre Baskerville", "Libre Baskerville", "Libre Baskerville", 0, nil);
    _fonts_EN[451] = CFAssetMake("Libre Caslon Text", "Libre Caslon Text", "Libre Caslon Text", 0, nil);
    _fonts_EN[452] = CFAssetMake("Life Savers", "LifeSavers-Bold", "Life Savers", 0, nil);
    _fonts_EN[453] = CFAssetMake("Lilita One", "Lilita One", "Lilita One", 0, nil);
    _fonts_EN[454] = CFAssetMake("Lily Script One", "Lily Script One", "Lily Script One", 0, nil);
    _fonts_EN[455] = CFAssetMake("Limelight", "Limelight", "Limelight", 0, nil);
    _fonts_EN[456] = CFAssetMake("Linden Hill", "Linden Hill", "Linden Hill", 0, nil);
    _fonts_EN[457] = CFAssetMake("Londrina Outline", "Londrina Outline", "Londrina Outline", 0, nil);
    _fonts_EN[458] = CFAssetMake("Londrina Shadow", "Londrina Shadow", "Londrina Shadow", 0, nil);
    _fonts_EN[459] = CFAssetMake("Londrina Sketch", "Londrina Sketch", "Londrina Sketch", 0, nil);
    _fonts_EN[460] = CFAssetMake("Londrina Solid", "Londrina Solid", "Londrina Solid", 0, nil);
    _fonts_EN[461] = CFAssetMake("Loved by the King", "Loved by the King", "Loved by the King", 0, nil);
    _fonts_EN[462] = CFAssetMake("Lovers Quarrel", "Lovers Quarrel", "Lovers Quarrel", 0, nil);
    _fonts_EN[463] = CFAssetMake("Love Ya Like A Sister", "Love Ya Like A Sister", "Love Ya Like A Sister", 0, nil);
    _fonts_EN[464] = CFAssetMake("Lusitana", "Lusitana", "Lusitana", 0, nil);
    _fonts_EN[465] = CFAssetMake("Macondo", "Macondo", "Macondo", 0, nil);
    _fonts_EN[466] = CFAssetMake("Macondo Swash Caps", "Macondo Swash Caps", "Macondo Swash Caps", 0, nil);
    _fonts_EN[467] = CFAssetMake("Magra", "Magra", "Magra", 0, nil);
    _fonts_EN[468] = CFAssetMake("Mako", "Mako", "Mako", 0, nil);
    _fonts_EN[469] = CFAssetMake("Mallanna", "Mallanna", "Mallanna", 0, nil);
    _fonts_EN[470] = CFAssetMake("Mandali", "Mandali", "Mandali", 0, nil);
    _fonts_EN[471] = CFAssetMake("Marcellus", "Marcellus", "Marcellus", 0, nil);
    _fonts_EN[472] = CFAssetMake("Marcellus SC", "Marcellus SC", "Marcellus SC", 0, nil);
    _fonts_EN[473] = CFAssetMake("Marck Script", "Marck Script", "Marck Script", 0, nil);
    _fonts_EN[474] = CFAssetMake("Margarine", "Margarine", "Margarine", 0, nil);
    _fonts_EN[475] = CFAssetMake("Marko One", "Marko One", "Marko One", 0, nil);
    _fonts_EN[476] = CFAssetMake("Marmelad", "Marmelad", "Marmelad", 0, nil);
    _fonts_EN[477] = CFAssetMake("Martel", "Martel", "Martel", 0, nil);
    _fonts_EN[478] = CFAssetMake("Martel Sans", "MartelSans-Regular", "Martel Sans", 0, nil);
    _fonts_EN[479] = CFAssetMake("Marvel", "Marvel-Bold", "Marvel", 0, nil);
    _fonts_EN[480] = CFAssetMake("Mate", "Mate", "Mate", 0, nil);
    _fonts_EN[481] = CFAssetMake("Mate SC", "Mate SC", "Mate SC", 0, nil);
    _fonts_EN[482] = CFAssetMake("Maven Pro", "Maven Pro", "Maven Pro", 0, nil);
    _fonts_EN[483] = CFAssetMake("McLaren", "McLaren", "McLaren", 0, nil);
    _fonts_EN[484] = CFAssetMake("Meddon", "Meddon", "Meddon", 0, nil);
    _fonts_EN[485] = CFAssetMake("MedievalSharp", "MedievalSharp", "MedievalSharp", 0, nil);
    _fonts_EN[486] = CFAssetMake("Medula One", "Medula One", "Medula One", 0, nil);
    _fonts_EN[487] = CFAssetMake("Megrim", "Megrim", "Megrim", 0, nil);
    _fonts_EN[488] = CFAssetMake("Meie Script", "Meie Script", "Meie Script", 0, nil);
    _fonts_EN[489] = CFAssetMake("Merge One", "Merge One", "Merge One", 0, nil);
    _fonts_EN[490] = CFAssetMake("Merienda", "Merienda", "Merienda", 0, nil);
    _fonts_EN[491] = CFAssetMake("Merienda One", "Merienda One", "Merienda One", 0, nil);
    _fonts_EN[492] = CFAssetMake("Merriweather", "Merriweather", "Merriweather", 0, nil);
    _fonts_EN[493] = CFAssetMake("Merriweather Sans", "Merriweather Sans", "Merriweather Sans", 0, nil);
    _fonts_EN[494] = CFAssetMake("Mervale Script", "Mervale Script", "Mervale Script", 0, nil);
    _fonts_EN[495] = CFAssetMake("Metal Mania", "Metal Mania", "Metal Mania", 0, nil);
    _fonts_EN[496] = CFAssetMake("Metamorphous", "Metamorphous", "Metamorphous", 0, nil);
    _fonts_EN[497] = CFAssetMake("Metrophobic", "Metrophobic", "Metrophobic", 0, nil);
    _fonts_EN[498] = CFAssetMake("Miama", "Miama", "Miama", 0, nil);
    _fonts_EN[499] = CFAssetMake("Michroma", "Michroma", "Michroma", 0, nil);
    _fonts_EN[500] = CFAssetMake("Milonga", "Milonga", "Milonga", 0, nil);
    _fonts_EN[501] = CFAssetMake("Miltonian", "Miltonian", "Miltonian", 0, nil);
    _fonts_EN[502] = CFAssetMake("Miltonian Tattoo", "Miltonian Tattoo", "Miltonian Tattoo", 0, nil);
    _fonts_EN[503] = CFAssetMake("Miniver", "Miniver", "Miniver", 0, nil);
    _fonts_EN[504] = CFAssetMake("Miss Fajardose", "Miss Fajardose", "Miss Fajardose", 0, nil);
    _fonts_EN[505] = CFAssetMake("Modak", "Modak", "Modak", 0, nil);
    _fonts_EN[506] = CFAssetMake("Modern Antiqua", "Modern Antiqua", "Modern Antiqua", 0, nil);
    _fonts_EN[507] = CFAssetMake("Molengo", "Molengo", "Molengo", 0, nil);
    _fonts_EN[508] = CFAssetMake("Molle", "Molle", "Molle", 0, nil);
    _fonts_EN[509] = CFAssetMake("Monda", "Monda", "Monda", 0, nil);
    _fonts_EN[510] = CFAssetMake("Monofett", "Monofett", "Monofett", 0, nil);
    _fonts_EN[511] = CFAssetMake("Monoton", "Monoton", "Monoton", 0, nil);
    _fonts_EN[512] = CFAssetMake("Monsieur La Doulaise", "Monsieur La Doulaise", "Monsieur La Doulaise", 0, nil);
    _fonts_EN[513] = CFAssetMake("Montaga", "Montaga", "Montaga", 0, nil);
    _fonts_EN[514] = CFAssetMake("Montserrat Alternates", "Montserrat Alternates", "Montserrat Alternates", 0, nil);
    _fonts_EN[515] = CFAssetMake("Montserrat Subrayada", "Montserrat Subrayada", "Montserrat Subrayada", 0, nil);
    _fonts_EN[516] = CFAssetMake("Mouse Memoirs", "Mouse Memoirs", "Mouse Memoirs", 0, nil);
    _fonts_EN[517] = CFAssetMake("Mr Dafoe", "Mr Dafoe", "Mr Dafoe", 0, nil);
    _fonts_EN[518] = CFAssetMake("Mr De Haviland", "Mr De Haviland", "Mr De Haviland", 0, nil);
    _fonts_EN[519] = CFAssetMake("Mrs Sheppards", "Mrs Sheppards", "Mrs Sheppards", 0, nil);
    _fonts_EN[520] = CFAssetMake("Mystery Quest", "Mystery Quest", "Mystery Quest", 0, nil);
    _fonts_EN[521] = CFAssetMake("NATS", "NATS", "NATS", 0, nil);
    _fonts_EN[522] = CFAssetMake("Neucha", "Neucha", "Neucha", 0, nil);
    _fonts_EN[523] = CFAssetMake("Neuton", "Neuton", "Neuton", 0, nil);
    _fonts_EN[524] = CFAssetMake("New Rocker", "New Rocker", "New Rocker", 0, nil);
    _fonts_EN[525] = CFAssetMake("News Cycle", "News Cycle", "News Cycle", 0, nil);
    _fonts_EN[526] = CFAssetMake("Niconne", "Niconne", "Niconne", 0, nil);
    _fonts_EN[527] = CFAssetMake("Nixie One", "Nixie One", "Nixie One", 0, nil);
    _fonts_EN[528] = CFAssetMake("Nobile", "Nobile", "Nobile", 0, nil);
    _fonts_EN[529] = CFAssetMake("Norican", "Norican", "Norican", 0, nil);
    _fonts_EN[530] = CFAssetMake("Nosifer", "Nosifer", "Nosifer", 0, nil);
    _fonts_EN[531] = CFAssetMake("Nosifer Caps", "Nosifer Caps", "Nosifer Caps", 0, nil);
    _fonts_EN[532] = CFAssetMake("Nothing You Could Do", "Nothing You Could Do", "Nothing You Could Do", 0, nil);
    _fonts_EN[533] = CFAssetMake("Noticia Text", "Noticia Text", "Noticia Text", 0, nil);
    _fonts_EN[534] = CFAssetMake("Noto Sans", "Noto Sans", "Noto Sans", 0, nil);
    _fonts_EN[535] = CFAssetMake("Noto Serif", "Noto Serif", "Noto Serif", 0, nil);
    _fonts_EN[536] = CFAssetMake("Nova Cut", "Nova Cut", "Nova Cut", 0, nil);
    _fonts_EN[537] = CFAssetMake("Nova Flat", "Nova Flat", "Nova Flat", 0, nil);
    _fonts_EN[538] = CFAssetMake("NovaMono", "NovaMono", "NovaMono", 0, nil);
    _fonts_EN[539] = CFAssetMake("Nova Oval", "Nova Oval", "Nova Oval", 0, nil);
    _fonts_EN[540] = CFAssetMake("Nova Round", "Nova Round", "Nova Round", 0, nil);
    _fonts_EN[541] = CFAssetMake("Nova Script", "Nova Script", "Nova Script", 0, nil);
    _fonts_EN[542] = CFAssetMake("Nova Slim", "Nova Slim", "Nova Slim", 0, nil);
    _fonts_EN[543] = CFAssetMake("Nova Square", "Nova Square", "Nova Square", 0, nil);
    _fonts_EN[544] = CFAssetMake("NTR", "NTR", "NTR", 0, nil);
    _fonts_EN[545] = CFAssetMake("Numans", "Numans", "Numans", 0, nil);
    _fonts_EN[546] = CFAssetMake("Nunito", "Nunito", "Nunito", 0, nil);
    _fonts_EN[547] = CFAssetMake("OdorMeanChey", "OdorMeanChey", "OdorMeanChey", 0, nil);
    _fonts_EN[548] = CFAssetMake("Offside", "Offside", "Offside", 0, nil);
    _fonts_EN[549] = CFAssetMake("OFL Sorts Mill Goudy TT", "OFL Sorts Mill Goudy TT", "OFL Sorts Mill Goudy TT", 0, nil);
    _fonts_EN[550] = CFAssetMake("Oldenburg", "Oldenburg", "Oldenburg", 0, nil);
    _fonts_EN[551] = CFAssetMake("Old Standard TT", "Old Standard TT", "Old Standard TT", 0, nil);
    _fonts_EN[552] = CFAssetMake("Oleo Script", "Oleo Script", "Oleo Script", 0, nil);
    _fonts_EN[553] = CFAssetMake("Oleo Script Swash Caps", "Oleo Script Swash Caps", "Oleo Script Swash Caps", 0, nil);
    _fonts_EN[554] = CFAssetMake("Oranienbaum", "Oranienbaum", "Oranienbaum", 0, nil);
    _fonts_EN[555] = CFAssetMake("Oregano", "Oregano", "Oregano", 0, nil);
    _fonts_EN[556] = CFAssetMake("Orienta", "Orienta", "Orienta", 0, nil);
    _fonts_EN[557] = CFAssetMake("Original Surfer", "Original Surfer", "Original Surfer", 0, nil);
    _fonts_EN[558] = CFAssetMake("Oswald", "Oswald", "Oswald", 0, nil);
    _fonts_EN[559] = CFAssetMake("Overlock", "Overlock", "Overlock", 0, nil);
    _fonts_EN[560] = CFAssetMake("Overlock SC", "Overlock SC", "Overlock SC", 0, nil);
    _fonts_EN[561] = CFAssetMake("Over the Rainbow", "Over the Rainbow", "Over the Rainbow", 0, nil);
    _fonts_EN[562] = CFAssetMake("Ovo", "Ovo", "Ovo", 0, nil);
    _fonts_EN[563] = CFAssetMake("Oxygen", "Oxygen", "Oxygen", 0, nil);
    _fonts_EN[564] = CFAssetMake("Oxygen Mono", "Oxygen Mono", "Oxygen Mono", 0, nil);
    _fonts_EN[565] = CFAssetMake("Pacifico", "Pacifico", "Pacifico", 0, nil);
    _fonts_EN[566] = CFAssetMake("Padauk", "Padauk", "Padauk", 0, nil);
    _fonts_EN[567] = CFAssetMake("Palanquin", "Palanquin", "Palanquin", 0, nil);
    _fonts_EN[568] = CFAssetMake("Palanquin Dark", "Palanquin Dark", "Palanquin Dark", 0, nil);
    _fonts_EN[569] = CFAssetMake("Paprika", "Paprika", "Paprika", 0, nil);
    _fonts_EN[570] = CFAssetMake("Parisienne", "Parisienne", "Parisienne", 0, nil);
    _fonts_EN[571] = CFAssetMake("Passero One", "Passero One", "Passero One", 0, nil);
    _fonts_EN[572] = CFAssetMake("Pathway Gothic One", "Pathway Gothic One", "Pathway Gothic One", 0, nil);
    _fonts_EN[573] = CFAssetMake("Patrick Hand", "Patrick Hand", "Patrick Hand", 0, nil);
    _fonts_EN[574] = CFAssetMake("Patrick Hand SC", "Patrick Hand SC", "Patrick Hand SC", 0, nil);
    _fonts_EN[575] = CFAssetMake("Patua One", "Patua One", "Patua One", 0, nil);
    _fonts_EN[576] = CFAssetMake("Paytone One", "Paytone One", "Paytone One", 0, nil);
    _fonts_EN[577] = CFAssetMake("Pecita", "Pecita", "Pecita", 0, nil);
    _fonts_EN[578] = CFAssetMake("Peddana", "Peddana", "Peddana", 0, nil);
    _fonts_EN[579] = CFAssetMake("Peralta", "Peralta", "Peralta", 0, nil);
    _fonts_EN[580] = CFAssetMake("Petit Formal Script", "Petit Formal Script", "Petit Formal Script", 0, nil);
    _fonts_EN[581] = CFAssetMake("Petrona", "Petrona", "Petrona", 0, nil);
    _fonts_EN[582] = CFAssetMake("Philosopher", "Philosopher", "Philosopher", 0, nil);
    _fonts_EN[583] = CFAssetMake("Piedra", "Piedra", "Piedra", 0, nil);
    _fonts_EN[584] = CFAssetMake("Pinyon Script", "Pinyon Script", "Pinyon Script", 0, nil);
    _fonts_EN[585] = CFAssetMake("Pirata One", "Pirata One", "Pirata One", 0, nil);
    _fonts_EN[586] = CFAssetMake("Plaster", "Plaster", "Plaster", 0, nil);
    _fonts_EN[587] = CFAssetMake("Play", "Play", "Play", 0, nil);
    _fonts_EN[588] = CFAssetMake("Playball", "Playball", "Playball", 0, nil);
    _fonts_EN[589] = CFAssetMake("Playfair Display", "Playfair Display", "Playfair Display", 0, nil);
    _fonts_EN[590] = CFAssetMake("Playfair Display SC", "Playfair Display SC", "Playfair Display SC", 0, nil);
    _fonts_EN[591] = CFAssetMake("PoetsenOne", "PoetsenOne", "PoetsenOne", 0, nil);
    _fonts_EN[592] = CFAssetMake("Poiret One", "Poiret One", "Poiret One", 0, nil);
    _fonts_EN[593] = CFAssetMake("Poller One", "Poller One", "Poller One", 0, nil);
    _fonts_EN[594] = CFAssetMake("Poly", "Poly", "Poly", 0, nil);
    _fonts_EN[595] = CFAssetMake("Pontano Sans", "Pontano Sans", "Pontano Sans", 0, nil);
    _fonts_EN[596] = CFAssetMake("Poppins", "Poppins", "Poppins", 0, nil);
    _fonts_EN[597] = CFAssetMake("Porter Sans Block", "Porter Sans Block", "Porter Sans Block", 0, nil);
    _fonts_EN[598] = CFAssetMake("Port Lligat Sans", "Port Lligat Sans", "Port Lligat Sans", 0, nil);
    _fonts_EN[599] = CFAssetMake("Port Lligat Slab", "Port Lligat Slab", "Port Lligat Slab", 0, nil);
    _fonts_EN[600] = CFAssetMake("Pragati Narrow", "Pragati Narrow", "Pragati Narrow", 0, nil);
    _fonts_EN[601] = CFAssetMake("Prata", "Prata", "Prata", 0, nil);
    _fonts_EN[602] = CFAssetMake("Press Start 2P", "Press Start 2P", "Press Start 2P", 0, nil);
    _fonts_EN[603] = CFAssetMake("Princess Sofia", "Princess Sofia", "Princess Sofia", 0, nil);
    _fonts_EN[604] = CFAssetMake("Prociono", "Prociono", "Prociono", 0, nil);
    _fonts_EN[605] = CFAssetMake("Prosto One", "Prosto One", "Prosto One", 0, nil);
    _fonts_EN[606] = CFAssetMake("PT Serif", "PT Serif", "PT Serif", 0, nil);
    _fonts_EN[607] = CFAssetMake("PT Serif Caption", "PT Serif Caption", "PT Serif Caption", 0, nil);
    _fonts_EN[608] = CFAssetMake("PT Mono", "PT Mono", "PT Mono", 0, nil);
    _fonts_EN[609] = CFAssetMake("Quando", "Quando", "Quando", 0, nil);
    _fonts_EN[610] = CFAssetMake("Quantico", "Quantico", "Quantico", 0, nil);
    _fonts_EN[611] = CFAssetMake("Quattrocento", "Quattrocento", "Quattrocento", 0, nil);
    _fonts_EN[612] = CFAssetMake("Quattrocento Sans", "Quattrocento Sans", "Quattrocento Sans", 0, nil);
    _fonts_EN[613] = CFAssetMake("Questrial", "Questrial", "Questrial", 0, nil);
    _fonts_EN[614] = CFAssetMake("Quicksand", "Quicksand", "Quicksand", 0, nil);
    _fonts_EN[615] = CFAssetMake("Quintessential", "Quintessential", "Quintessential", 0, nil);
    _fonts_EN[616] = CFAssetMake("Qwigley", "Qwigley", "Qwigley", 0, nil);
    _fonts_EN[617] = CFAssetMake("Racing Sans One", "Racing Sans One", "Racing Sans One", 0, nil);
    _fonts_EN[618] = CFAssetMake("Radley", "Radley", "Radley", 0, nil);
    _fonts_EN[619] = CFAssetMake("Rajdhani", "Rajdhani", "Rajdhani", 0, nil);
    _fonts_EN[620] = CFAssetMake("Raleway", "Raleway", "Raleway", 0, nil);
    _fonts_EN[621] = CFAssetMake("Ramabhadra", "Ramabhadra", "Ramabhadra", 0, nil);
    _fonts_EN[622] = CFAssetMake("Ramaraja", "Ramaraja", "Ramaraja", 0, nil);
    _fonts_EN[623] = CFAssetMake("Rambla", "Rambla", "Rambla", 0, nil);
    _fonts_EN[624] = CFAssetMake("Rammetto One", "Rammetto One", "Rammetto One", 0, nil);
    _fonts_EN[625] = CFAssetMake("Ranchers", "Ranchers", "Ranchers", 0, nil);
    _fonts_EN[626] = CFAssetMake("Ranga", "Ranga", "Ranga", 0, nil);
    _fonts_EN[627] = CFAssetMake("Rationale", "Rationale", "Rationale", 0, nil);
    _fonts_EN[628] = CFAssetMake("Ravi Prakash", "Ravi Prakash", "Ravi Prakash", 0, nil);
    _fonts_EN[629] = CFAssetMake("Redacted Script", "Redacted Script", "Redacted Script", 0, nil);
    _fonts_EN[630] = CFAssetMake("Reenie Beanie", "Reenie Beanie", "Reenie Beanie", 0, nil);
    _fonts_EN[631] = CFAssetMake("Revalia", "Revalia", "Revalia", 0, nil);
    _fonts_EN[632] = CFAssetMake("Rhodium Libre", "Rhodium Libre", "Rhodium Libre", 0, nil);
    _fonts_EN[633] = CFAssetMake("Ribeye", "Ribeye", "Ribeye", 0, nil);
    _fonts_EN[634] = CFAssetMake("Ribeye Marrow", "Ribeye Marrow", "Ribeye Marrow", 0, nil);
    _fonts_EN[635] = CFAssetMake("Righteous", "Righteous", "Righteous", 0, nil);
    _fonts_EN[636] = CFAssetMake("Risque", "Risque", "Risque", 0, nil);
    _fonts_EN[637] = CFAssetMake("Rokkitt", "Rokkitt", "Rokkitt", 0, nil);
    _fonts_EN[638] = CFAssetMake("Romanesco", "Romanesco", "Romanesco", 0, nil);
    _fonts_EN[639] = CFAssetMake("Ropa Sans", "Ropa Sans", "Ropa Sans", 0, nil);
    _fonts_EN[640] = CFAssetMake("Rosario", "Rosario", "Rosario", 0, nil);
    _fonts_EN[641] = CFAssetMake("Rosarivo", "Rosarivo", "Rosarivo", 0, nil);
    _fonts_EN[642] = CFAssetMake("Rouge Script", "Rouge Script", "Rouge Script", 0, nil);
    _fonts_EN[643] = CFAssetMake("Rozha One", "Rozha One", "Rozha One", 0, nil);
    _fonts_EN[644] = CFAssetMake("Rubik", "Rubik", "Rubik", 0, nil);
    _fonts_EN[645] = CFAssetMake("Rubik Mono One", "Rubik Mono One", "Rubik Mono One", 0, nil);
    _fonts_EN[646] = CFAssetMake("Rubik One", "Rubik One", "Rubik One", 0, nil);
    _fonts_EN[647] = CFAssetMake("Ruda", "Ruda", "Ruda", 0, nil);
    _fonts_EN[648] = CFAssetMake("Rufina", "Rufina", "Rufina", 0, nil);
    _fonts_EN[649] = CFAssetMake("Ruge Boogie", "Ruge Boogie", "Ruge Boogie", 0, nil);
    _fonts_EN[650] = CFAssetMake("Ruluko", "Ruluko", "Ruluko", 0, nil);
    _fonts_EN[651] = CFAssetMake("Rum Raisin", "Rum Raisin", "Rum Raisin", 0, nil);
    _fonts_EN[652] = CFAssetMake("Ruslan Display", "Ruslan Display", "Ruslan Display", 0, nil);
    _fonts_EN[653] = CFAssetMake("Russo One", "Russo One", "Russo One", 0, nil);
    _fonts_EN[654] = CFAssetMake("Ruthie", "Ruthie", "Ruthie", 0, nil);
    _fonts_EN[655] = CFAssetMake("Rye", "Rye", "Rye", 0, nil);
    _fonts_EN[656] = CFAssetMake("Sacramento", "Sacramento", "Sacramento", 0, nil);
    _fonts_EN[657] = CFAssetMake("Sahitya", "Sahitya", "Sahitya", 0, nil);
    _fonts_EN[658] = CFAssetMake("Sail", "Sail", "Sail", 0, nil);
    _fonts_EN[659] = CFAssetMake("Salsa", "Salsa", "Salsa", 0, nil);
    _fonts_EN[660] = CFAssetMake("Sanchez", "Sanchez", "Sanchez", 0, nil);
    _fonts_EN[661] = CFAssetMake("Sancreek", "Sancreek", "Sancreek", 0, nil);
    _fonts_EN[662] = CFAssetMake("Sansation", "Sansation", "Sansation", 0, nil);
    _fonts_EN[663] = CFAssetMake("Sansita One", "Sansita One", "Sansita One", 0, nil);
    _fonts_EN[664] = CFAssetMake("Sarabun", "Sarabun", "Sarabun", 0, nil);
    _fonts_EN[665] = CFAssetMake("Sarala", "Sarala", "Sarala", 0, nil);
    _fonts_EN[666] = CFAssetMake("Sarina", "Sarina", "Sarina", 0, nil);
    _fonts_EN[667] = CFAssetMake("Sarpanch", "Sarpanch", "Sarpanch", 0, nil);
    _fonts_EN[668] = CFAssetMake("Scada", "Scada", "Scada", 0, nil);
    _fonts_EN[669] = CFAssetMake("Scheherazade", "Scheherazade", "Scheherazade", 0, nil);
    _fonts_EN[670] = CFAssetMake("Seaweed Script", "Seaweed Script", "Seaweed Script", 0, nil);
    _fonts_EN[671] = CFAssetMake("Sedan", "Sedan", "Sedan", 0, nil);
    _fonts_EN[672] = CFAssetMake("Sedan SC", "Sedan SC", "Sedan SC", 0, nil);
    _fonts_EN[673] = CFAssetMake("Sevillana", "Sevillana", "Sevillana", 0, nil);
    _fonts_EN[674] = CFAssetMake("Seymour One", "Seymour One", "Seymour One", 0, nil);
    _fonts_EN[675] = CFAssetMake("Shadows Into Light", "Shadows Into Light", "Shadows Into Light", 0, nil);
    _fonts_EN[676] = CFAssetMake("Shadows Into Light Two", "Shadows Into Light Two", "Shadows Into Light Two", 0, nil);
    _fonts_EN[677] = CFAssetMake("Shanti", "Shanti", "Shanti", 0, nil);
    _fonts_EN[678] = CFAssetMake("Share", "Share", "Share", 0, nil);
    _fonts_EN[679] = CFAssetMake("Share Tech", "Share Tech", "Share Tech", 0, nil);
    _fonts_EN[680] = CFAssetMake("Share Tech Mono", "Share Tech Mono", "Share Tech Mono", 0, nil);
    _fonts_EN[681] = CFAssetMake("Shojumaru", "Shojumaru", "Shojumaru", 0, nil);
    _fonts_EN[682] = CFAssetMake("Short Stack", "Short Stack", "Short Stack", 0, nil);
    _fonts_EN[683] = CFAssetMake("Sigmar One", "Sigmar One", "Sigmar One", 0, nil);
    _fonts_EN[684] = CFAssetMake("Signika", "Signika", "Signika", 0, nil);
    _fonts_EN[685] = CFAssetMake("Signika Negative", "Signika Negative", "Signika Negative", 0, nil);
    _fonts_EN[686] = CFAssetMake("Simonetta", "Simonetta", "Simonetta", 0, nil);
    _fonts_EN[687] = CFAssetMake("Sintony", "Sintony", "Sintony", 0, nil);
    _fonts_EN[688] = CFAssetMake("SirinStencil", "SirinStencil", "SirinStencil", 0, nil);
    _fonts_EN[689] = CFAssetMake("Sitara", "Sitara", "Sitara", 0, nil);
    _fonts_EN[690] = CFAssetMake("Six Caps", "Six Caps", "Six Caps", 0, nil);
    _fonts_EN[691] = CFAssetMake("Skranji", "Skranji", "Skranji", 0, nil);
    _fonts_EN[692] = CFAssetMake("Slabo 13px", "Slabo 13px", "Slabo 13px", 0, nil);
    _fonts_EN[693] = CFAssetMake("Slabo 27px", "Slabo 27px", "Slabo 27px", 0, nil);
    _fonts_EN[694] = CFAssetMake("Smythe", "Smythe", "Smythe", 0, nil);
    _fonts_EN[695] = CFAssetMake("Sniglet", "Sniglet", "Sniglet", 0, nil);
    _fonts_EN[696] = CFAssetMake("Snippet", "Snippet", "Snippet", 0, nil);
    _fonts_EN[697] = CFAssetMake("Snowburst One", "Snowburst One", "Snowburst One", 0, nil);
    _fonts_EN[698] = CFAssetMake("Sofadi One", "Sofadi One", "Sofadi One", 0, nil);
    _fonts_EN[699] = CFAssetMake("Sofia", "Sofia", "Sofia", 0, nil);
    _fonts_EN[700] = CFAssetMake("Sonsie One", "Sonsie One", "Sonsie One", 0, nil);
    _fonts_EN[701] = CFAssetMake("Sorts Mill Goudy", "Sorts Mill Goudy", "Sorts Mill Goudy", 0, nil);
    _fonts_EN[702] = CFAssetMake("Source Code Pro", "Source Code Pro", "Source Code Pro", 0, nil);
    _fonts_EN[703] = CFAssetMake("Source Sans Pro", "Source Sans Pro", "Source Sans Pro", 0, nil);
    _fonts_EN[704] = CFAssetMake("Source Serif Pro", "Source Serif Pro", "Source Serif Pro", 0, nil);
    _fonts_EN[705] = CFAssetMake("Spicy Rice", "Spicy Rice", "Spicy Rice", 0, nil);
    _fonts_EN[706] = CFAssetMake("Spinnaker", "Spinnaker", "Spinnaker", 0, nil);
    _fonts_EN[707] = CFAssetMake("Spirax", "Spirax", "Spirax", 0, nil);
    _fonts_EN[708] = CFAssetMake("Squada One", "Squada One", "Squada One", 0, nil);
    _fonts_EN[709] = CFAssetMake("Sree Krushnadevaraya", "Sree Krushnadevaraya", "Sree Krushnadevaraya", 0, nil);
    _fonts_EN[710] = CFAssetMake("Sriracha", "Sriracha", "Sriracha", 0, nil);
    _fonts_EN[711] = CFAssetMake("Stalemate", "Stalemate", "Stalemate", 0, nil);
    _fonts_EN[712] = CFAssetMake("Stalinist One", "Stalinist One", "Stalinist One", 0, nil);
    _fonts_EN[713] = CFAssetMake("Stalin One", "Stalin One", "Stalin One", 0, nil);
    _fonts_EN[714] = CFAssetMake("Stardos Stencil", "Stardos Stencil", "Stardos Stencil", 0, nil);
    _fonts_EN[715] = CFAssetMake("Stint Ultra Condensed", "Stint Ultra Condensed", "Stint Ultra Condensed", 0, nil);
    _fonts_EN[716] = CFAssetMake("Stint Ultra Expanded", "Stint Ultra Expanded", "Stint Ultra Expanded", 0, nil);
    _fonts_EN[717] = CFAssetMake("Stoke", "Stoke", "Stoke", 0, nil);
    _fonts_EN[718] = CFAssetMake("Strait", "Strait", "Strait", 0, nil);
    _fonts_EN[719] = CFAssetMake("Strong", "Strong", "Strong", 0, nil);
    _fonts_EN[720] = CFAssetMake("Sumana", "Sumana", "Sumana", 0, nil);
    _fonts_EN[721] = CFAssetMake("Supermercado", "Supermercado", "Supermercado", 0, nil);
    _fonts_EN[722] = CFAssetMake("Sura", "Sura", "Sura", 0, nil);
    _fonts_EN[723] = CFAssetMake("Suranna", "Suranna", "Suranna", 0, nil);
    _fonts_EN[724] = CFAssetMake("Suravaram", "Suravaram", "Suravaram", 0, nil);
    _fonts_EN[725] = CFAssetMake("Swanky and Moo Moo", "Swanky and Moo Moo", "Swanky and Moo Moo", 0, nil);
    _fonts_EN[726] = CFAssetMake("Tangerine", "Tangerine", "Tangerine", 0, nil);
    _fonts_EN[727] = CFAssetMake("Tauri", "Tauri", "Tauri", 0, nil);
    _fonts_EN[728] = CFAssetMake("Teko", "Teko", "Teko", 0, nil);
    _fonts_EN[729] = CFAssetMake("Telex", "Telex", "Telex", 0, nil);
    _fonts_EN[730] = CFAssetMake("Tenali Ramakrishna", "Tenali Ramakrishna", "Tenali Ramakrishna", 0, nil);
    _fonts_EN[731] = CFAssetMake("Tenor Sans", "Tenor Sans", "Tenor Sans", 0, nil);
    _fonts_EN[732] = CFAssetMake("Text Me One", "Text Me One", "Text Me One", 0, nil);
    _fonts_EN[733] = CFAssetMake("Thabit", "Thabit", "Thabit", 0, nil);
    _fonts_EN[734] = CFAssetMake("The Girl Next Door", "The Girl Next Door", "The Girl Next Door", 0, nil);
    _fonts_EN[735] = CFAssetMake("Tienne", "Tienne", "Tienne", 0, nil);
    _fonts_EN[736] = CFAssetMake("Tillana", "Tillana", "Tillana", 0, nil); 
    _fonts_EN[737] = CFAssetMake("Timmana", "Timmana", "Timmana", 0, nil); 
    _fonts_EN[738] = CFAssetMake("Titan One", "Titan One", "Titan One", 0, nil); 
    _fonts_EN[739] = CFAssetMake("Titillium Web", "Titillium Web", "Titillium Web", 0, nil); 
    _fonts_EN[740] = CFAssetMake("Trade Winds", "Trade Winds", "Trade Winds", 0, nil); 
    _fonts_EN[741] = CFAssetMake("Trocchi", "Trocchi", "Trocchi", 0, nil); 
    _fonts_EN[742] = CFAssetMake("Trochut", "Trochut", "Trochut", 0, nil); 
    _fonts_EN[743] = CFAssetMake("Trykker", "Trykker", "Trykker", 0, nil); 
    _fonts_EN[744] = CFAssetMake("Tuffy", "Tuffy", "Tuffy", 0, nil); 
    _fonts_EN[745] = CFAssetMake("Tulpen One", "Tulpen One", "Tulpen One", 0, nil); 
    _fonts_EN[746] = CFAssetMake("Uncial Antiqua", "Uncial Antiqua", "Uncial Antiqua", 0, nil); 
    _fonts_EN[747] = CFAssetMake("Underdog", "Underdog", "Underdog", 0, nil); 
    _fonts_EN[748] = CFAssetMake("Unica One", "Unica One", "Unica One", 0, nil); 
    _fonts_EN[749] = CFAssetMake("Unlock", "Unlock", "Unlock", 0, nil); 
    _fonts_EN[750] = CFAssetMake("Unna", "Unna", "Unna", 0, nil); 
    _fonts_EN[751] = CFAssetMake("Vampiro One", "Vampiro One", "Vampiro One", 0, nil); 
    _fonts_EN[752] = CFAssetMake("Varela", "Varela", "Varela", 0, nil); 
    _fonts_EN[753] = CFAssetMake("Varela Round", "Varela Round", "Varela Round", 0, nil); 
    _fonts_EN[754] = CFAssetMake("Varta", "Varta", "Varta", 0, nil); 
    _fonts_EN[755] = CFAssetMake("Vibur", "Vibur", "Vibur", 0, nil); 
    _fonts_EN[756] = CFAssetMake("Viga", "Viga", "Viga", 0, nil); 
    _fonts_EN[757] = CFAssetMake("Voces", "Voces", "Voces", 0, nil); 
    _fonts_EN[758] = CFAssetMake("Volkhov", "Volkhov", "Volkhov", 0, nil); 
    _fonts_EN[759] = CFAssetMake("Vollkorn", "Vollkorn", "Vollkorn", 0, nil); 
    _fonts_EN[760] = CFAssetMake("Voltaire", "Voltaire", "Voltaire", 0, nil); 
    _fonts_EN[761] = CFAssetMake("VT323", "VT323", "VT323", 0, nil); 
    _fonts_EN[762] = CFAssetMake("Waiting for the Sunrise", "Waiting for the Sunrise", "Waiting for the Sunrise", 0, nil); 
    _fonts_EN[763] = CFAssetMake("Wallpoet", "Wallpoet", "Wallpoet", 0, nil); 
    _fonts_EN[764] = CFAssetMake("Warnes", "Warnes", "Warnes", 0, nil); 
    _fonts_EN[765] = CFAssetMake("Wellfleet", "Wellfleet", "Wellfleet", 0, nil); 
    _fonts_EN[766] = CFAssetMake("Wendy One", "Wendy One", "Wendy One", 0, nil); 
    _fonts_EN[767] = CFAssetMake("Wire One", "Wire One", "Wire One", 0, nil); 
    _fonts_EN[768] = CFAssetMake("Work Sans", "Work Sans", "Work Sans", 0, nil); 
    _fonts_EN[769] = CFAssetMake("Yanone Kaffeesatz", "Yanone Kaffeesatz", "Yanone Kaffeesatz", 0, nil); 
    _fonts_EN[770] = CFAssetMake("Yantramanav", "Yantramanav", "Yantramanav", 0, nil); 
    _fonts_EN[771] = CFAssetMake("Yeseva One", "Yeseva One", "Yeseva One", 0, nil); 
    _fonts_EN[772] = CFAssetMake("Yesteryear", "Yesteryear", "Yesteryear", 0, nil); 
    _fonts_EN[773] = CFAssetMake("Zeyada", "Zeyada", "Zeyada", 0, nil); 
}

@end