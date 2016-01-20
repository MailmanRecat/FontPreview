//
//  FontsManager.m
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "FontsManager.h"

@implementation FontsManager

- (instancetype)init{
    self = [super init];
    if( self ){
        self.fonts = @[
                       @"San Francisco For iOS, OS X, and tvOS",
                       @"San Francisco For watchOS",
                       @"Roboto"
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
