//
//  FontsManager.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "FontsManager.h"

static NSString *const THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG = @"the quick brown fox jumps over the lazy dog";
static NSString *const TYPE_UNKNOW = @"Unknow";

@implementation FontsManager

- (instancetype)init{
    self = [super init];
    if( self ){
        
//        NSLog(@"%@", [UIFont familyNames]);
//        NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Roboto"]);
        
        self.fonts = @[
                       [FontAsset assetFromAuth:@"SF-UI-Display"
                                           Name:@"San Francisco Display"
                                          intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                           font:[UIFont fontWithName:@"SFUIDisplay-Regular" size:17]
                                       fontName:@"SF UI Display"
                                           type:TYPE_UNKNOW],
                       
                       [FontAsset assetFromAuth:@"SF-UI-Text"
                                           Name:@"San Francisco Text"
                                          intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                           font:[UIFont fontWithName:@"SFUIDisplay-Regular" size:17]
                                       fontName:@"SF UI Text"
                                           type:TYPE_UNKNOW],
                       
                       [FontAsset assetFromAuth:@"SF-Compact-Display"
                                           Name:@"San Francisco Compact Display"
                                          intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                           font:[UIFont fontWithName:@"SFCompactDisplay-Medium" size:17]
                                       fontName:@"SF Compact Display"
                                           type:TYPE_UNKNOW],
                       
                       [FontAsset assetFromAuth:@"SF-Compact-Text"
                                           Name:@"San Francisco Compact Text"
                                          intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                           font:[UIFont fontWithName:@"SF Compact Text" size:17]
                                       fontName:@"SF Compact Text"
                                           type:TYPE_UNKNOW],
                       
                       [FontAsset assetFromAuth:@"Roboto"
                                           Name:@"Roboto"
                                          intro:THE_QUICK_BROWN_FOX_JUMPS_OVER_THE_LAZY_DOG
                                           font:[UIFont fontWithName:@"Roboto-Regular" size:17]
                                       fontName:@"Roboto"
                                           type:TYPE_UNKNOW],
                       ];
    }
    return self;
}

+ (instancetype)shareManager{
    static FontsManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[FontsManager alloc] init];
    });
    return manager;
}

@end
