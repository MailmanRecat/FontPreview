//
//  cacheFont.m
//  FontPreview
//
//  Created by caine on 2/12/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <sqlite3.h>
#import "cacheFont.h"

static sqlite3      *_fsqlite3;
static sqlite3_stmt *_fsqlite3_statement;


@interface cacheFont()

@property( nonatomic, strong ) NSCache *fontsCacheEN;
@property( nonatomic, strong ) NSCache *fontsCacheCH;
@property( nonatomic, strong ) NSCache *fontsCacheJA;

@property( nonatomic, copy   ) NSString *fontsPath;
@property( nonatomic, assign ) BOOL      sqliteOpened;

@end

@implementation cacheFont

- (FontAsset *)assetFromIndex:(NSUInteger)index{
    if( [[FontsManager shareManager].lang isEqualToString:LANG_ENGLISH] ){
        return [self ENAssetFromIndex:index];
    
    }else if( [[FontsManager shareManager].lang isEqualToString:LANG_CHINESE] ){
        return [self CHAssetFromIndex:index];
    
    }else{
        return [self JAAssetFromIndex:index];
        
    }
}

- (FontAsset *)ENAssetFromIndex:(NSUInteger)index{
    FontAsset *asset = [self.fontsCacheEN objectForKey:[NSNumber numberWithInteger:index]];
    if( asset == nil ){
        NSString *querySQL = [NSString stringWithFormat:@"select * from fontsEN where id = %ld ", index];
        const char *query_stmt = [querySQL UTF8String];
        
        if( sqlite3_prepare_v2(_fsqlite3, query_stmt, -1, &_fsqlite3_statement, NULL) == SQLITE_OK ){
            if( sqlite3_step(_fsqlite3_statement) == SQLITE_ROW ){
                NSUInteger index  = (const int)sqlite3_column_int(_fsqlite3_statement, 0);
                NSString   *name  = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_fsqlite3_statement, 1)];
                NSString   *intro = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_fsqlite3_statement, 2)];
                NSString   *fname = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_fsqlite3_statement, 3)];
                NSUInteger type   = (const int)sqlite3_column_int(_fsqlite3_statement, 4);
                NSString   *pscrn = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_fsqlite3_statement, 5)];
                
                asset = [FontAsset assetFromName:name
                                   introFontName:intro
                                        fontName:fname
                                  postScriptName:pscrn
                                            type:type];
                
                NSLog(@"%@", asset);
                
                [self.fontsCacheEN setObject:asset forKey:[NSNumber numberWithInteger:index]];
                
                sqlite3_reset(_fsqlite3_statement);
            }else{
                sqlite3_reset(_fsqlite3_statement);
            }
        }
    }
    
    return asset;
}

- (FontAsset *)CHAssetFromIndex:(NSUInteger)index{
    return nil;
}

- (FontAsset *)JAAssetFromIndex:(NSUInteger)index{
    return nil;
}

- (void)openSqlite{
    const int open_result = sqlite3_open([self.fontsPath UTF8String], &_fsqlite3);
    if( open_result == SQLITE_OK ){
        self.sqliteOpened = YES;
    }
}

- (void)closeSqlite{
    sqlite3_close(_fsqlite3);
    self.sqliteOpened = NO;
}

- (instancetype)init{
    self = [super init];
    if( self ){
        self.fontsCacheEN = [[NSCache alloc] init];
        self.fontsCacheCH = [[NSCache alloc] init];
        self.fontsCacheJA = [[NSCache alloc] init];
        
        self.fontsPath    = [[NSBundle mainBundle] pathForResource:@"fonts" ofType:@"sqlite"];
        
        [self openSqlite];
    }
    return self;
}

+ (instancetype)standarCache{
    static cacheFont *cache;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[cacheFont alloc] init];
    });
    return cache;
}

@end
