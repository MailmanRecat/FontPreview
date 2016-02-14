//
//  cacheFont.h
//  FontPreview
//
//  Created by caine on 2/12/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FontsManager.h"

@interface cacheFont : NSObject

+ (instancetype)standarCache;

- (FontAsset *)assetFromIndex:(NSUInteger)index;

@end
