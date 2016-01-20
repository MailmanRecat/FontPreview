//
//  FontsManager.h
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FontsManager : NSObject

@property( nonatomic, strong ) NSArray *fonts;
@property( nonatomic, strong ) NSArray *langs;

+ (instancetype)shareManager;

@end
