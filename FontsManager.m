//
//  FontsManager.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "FontsManager.h"
#import "Fonts.h"

@implementation FontsManager

- (instancetype)init{
    self = [super init];
    if( self ){
        self.fonts = [Fonts Fonts];
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
