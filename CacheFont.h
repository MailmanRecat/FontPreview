//
//  cacheFont.h
//  FontPreview
//
//  Created by caine on 2/12/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FontsManager.h"

@interface CacheFont : NSObject

+ (instancetype)standarCache;

- (NSUInteger)numberOfFonts;
- (FontAsset *)assetFromIndex:(NSUInteger)index;

- (NSArray *)searchFontsLike:(NSString *)like;

- (void)cleanCache;
- (void)openSqlite;
- (void)closeSqlite;

@end
