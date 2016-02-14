//
//  cacheFont.m
//  FontPreview
//
//  Created by caine on 2/12/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#define numberOfEN 774
#define numberOfCH 9
#define numberOfJA 4

#import <sqlite3.h>
#import "cacheFont.h"

static sqlite3      *_fsqlite3;
static sqlite3_stmt *_fsqlite3_statement;


@interface CacheFont()

@property( nonatomic, strong ) NSCache *fontsCacheEN;
@property( nonatomic, strong ) NSCache *fontsCacheCH;
@property( nonatomic, strong ) NSCache *fontsCacheJA;

@property( nonatomic, copy   ) NSString *fontsPath;
@property( nonatomic, assign ) BOOL      sqliteOpened;

@end

@implementation CacheFont

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
        asset = [self assetFromindex:index table:@"fontsEN"];
        if( asset )
            [self.fontsCacheEN setObject:asset forKey:[NSNumber numberWithInteger:index]];
    }
    
    return asset;
}

- (FontAsset *)CHAssetFromIndex:(NSUInteger)index{
    FontAsset *asset = [self.fontsCacheCH objectForKey:[NSNumber numberWithInteger:index]];
    if( asset == nil ){
        asset = [self assetFromindex:index table:@"fontsCH"];
        if( asset )
            [self.fontsCacheCH setObject:asset forKey:[NSNumber numberWithInteger:index]];
    }
    
    return asset;
}

- (FontAsset *)JAAssetFromIndex:(NSUInteger)index{
    FontAsset *asset = [self.fontsCacheJA objectForKey:[NSNumber numberWithInteger:index]];
    if( asset == nil ){
        asset = [self assetFromindex:index table:@"fontsJA"];
        if( asset )
            [self.fontsCacheJA setObject:asset forKey:[NSNumber numberWithInteger:index]];
    }
    
    return asset;
}

- (FontAsset *)assetFromindex:(NSUInteger)index table:(NSString *)table{
    if( self.sqliteOpened == NO ){
        [self openSqlite];
    }
    
    NSString *querySQL = [NSString stringWithFormat:@"select * from %@ where id = %ld ", table, index];
    const char *query_stmt = [querySQL UTF8String];
    FontAsset *asset;
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
            
            sqlite3_reset(_fsqlite3_statement);
        }else{
            sqlite3_reset(_fsqlite3_statement);
        }
    }
    
    return asset;
}

- (NSArray *)searchFontsLike:(NSString *)like{
    if( self.sqliteOpened == NO ){
        [self openSqlite];
    }
    
    NSString *table;
    if( [[FontsManager shareManager].lang isEqualToString:LANG_ENGLISH] ){
        table = @"fontsEN";
    }else if( [[FontsManager shareManager].lang isEqualToString:LANG_CHINESE] ){
        table = @"fontsCH";
    }else{
        table = @"fontsJA";
    }
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSString *querySQL = [NSString stringWithFormat:@"select * from %@ where name like \'%%%@%%\'", table, like];
    const char *query_stmt = [querySQL UTF8String];
    if( sqlite3_prepare_v2(_fsqlite3, query_stmt, -1, &_fsqlite3_statement, NULL) == SQLITE_OK ){
        FontAsset *asset;
        NSRange    range;
        while( sqlite3_step(_fsqlite3_statement) == SQLITE_ROW ){
            NSUInteger index  = (const int)sqlite3_column_int(_fsqlite3_statement, 0);
            NSString   *name  = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_fsqlite3_statement, 1)];
            NSString   *intro = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_fsqlite3_statement, 2)];
            NSString   *fname = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_fsqlite3_statement, 3)];
            NSUInteger type   = (const int)sqlite3_column_int(_fsqlite3_statement, 4);
            NSString   *pscrn = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_fsqlite3_statement, 5)];
            
            range = [[name lowercaseString] rangeOfString:like];
            if( range.location != NSNotFound ){
                asset = [FontAsset assetFromName:name
                                   introFontName:intro
                                        fontName:fname
                                  postScriptName:pscrn
                                            type:type];
                
                [result addObject:@[ asset, [NSValue valueWithRange:range], [NSNumber numberWithInteger:index] ]];
            }
        }
        
        sqlite3_reset(_fsqlite3_statement);
        return result;
    }
    
    return @[];
}

- (void)cleanCache{
    [self.fontsCacheEN removeAllObjects];
    [self.fontsCacheCH removeAllObjects];
    [self.fontsCacheJA removeAllObjects];
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
    static CacheFont *cache;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[CacheFont alloc] init];
    });
    return cache;
}

@end
