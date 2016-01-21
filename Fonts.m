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

@implementation Fonts

+ (NSArray *)Fonts{
    
//    NSLog(@"%@", [UIFont familyNames]);
    NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Times New Roman"]);
    
    return @[
             
             [FontAsset assetFromAuth:@"SF-UI-Display"
                                 Name:@"San Francisco Display"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"SFUIDisplay-Regular" size:17]
                             fontName:@"SF UI Display"
                               prefix:@"SFUIDisplay-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"SF-UI-Text"
                                 Name:@"San Francisco Text"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"SFUIDisplay-Regular" size:17]
                             fontName:@"SF UI Text"
                               prefix:@"SFUIText-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"SF-Compact-Display"
                                 Name:@"San Francisco Compact Display"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"SFCompactDisplay-Medium" size:17]
                             fontName:@"SF Compact Display"
                               prefix:@"SFCompactDisplay-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"SF-Compact-Text"
                                 Name:@"San Francisco Compact Text"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"SF Compact Text" size:17]
                             fontName:@"SF Compact Text"
                               prefix:@"SFCompactText-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Roboto"
                                 Name:@"Roboto"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"Roboto-Regular" size:17]
                             fontName:@"Roboto"
                               prefix:@"Roboto-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Menlo"
                                 Name:@"Menlo"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"Menlo-Regular" size:17]
                             fontName:@"Menlo"
                               prefix:@"Menlo-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Heiti SC"
                                 Name:@"Heiti SC"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"Heiti SC" size:17]
                             fontName:@"Heiti SC"
                               prefix:@"Heiti SC"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Helvetica Neue"
                                 Name:@"Helvetica Neue"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"Helvetica Neue" size:17]
                             fontName:@"Helvetica Neue"
                               prefix:@"HelveticaNeue-"
                                 type:TYPE_UNKNOW],
             
             [FontAsset assetFromAuth:@"Times New Roman"
                                 Name:@"Times New Roman"
                                intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                 font:[UIFont fontWithName:@"Times New Roman" size:17]
                             fontName:@"Times New Roman"
                               prefix:@"TimesNewRomanPS-"
                                 type:TYPE_UNKNOW],
             
             ];
}

@end
