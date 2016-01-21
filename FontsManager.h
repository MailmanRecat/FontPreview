//
//  FontsManager.h
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FontAsset.h"

@interface FontsManager : NSObject

@property( nonatomic, strong ) NSArray<FontAsset *> *fonts;
@property( nonatomic, strong ) NSArray *langs;

+ (instancetype)shareManager;

@end
