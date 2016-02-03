//
//  Craig.m
//  CRTestingProject
//
//  Created by caine on 1/13/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "UIColor+Theme.h"
#import "Craig.h"

@implementation Craig

+ (UIVisualEffectView *)tableViewSelectedBackgroundEffectView:(UIBlurEffectStyle)style{
    UIVisualEffectView *visual = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:[UIBlurEffect effectWithStyle:style]]];
    
    return ({
        UIView *background = [[UIView alloc] init];
        [background setTranslatesAutoresizingMaskIntoConstraints:NO];
        [background setBackgroundColor:[UIColor whiteColor]];
        [visual.contentView addSubview:background];
        [background.topAnchor constraintEqualToAnchor:visual.contentView.topAnchor].active = YES;
        [background.rightAnchor constraintEqualToAnchor:visual.contentView.rightAnchor].active = YES;
        [background.leftAnchor constraintEqualToAnchor:visual.contentView.leftAnchor].active = YES;
        [background.bottomAnchor constraintEqualToAnchor:visual.contentView.bottomAnchor].active = YES;

        visual;
    });
}

+ (UIView *)tableHeaderContentViewWithTitle:(NSString *)title{
    UIView *content = [[UIView alloc] init];
    
    if( title != nil ){
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 256, 44)];
        l.font = [UIFont systemFontOfSize:16.5 weight:UIFontWeightRegular];
        l.textColor = [UIColor colorWithHex:CLThemeGray alpha:1];
        l.text = title;
        [content addSubview:l];
    }
    
    return content;
}

+ (NSUInteger)positionOfFontWeight:(NSString *)weight{
    NSDictionary *line = @{
                            @"ultralight"           : @0,
                            @"ultralightitalic"     : @5,
                            @"thin"                 : @10,
                            @"thinitalic"           : @15,
                            @"light"                : @20,
                            @"lightitalic"          : @25,
                            @"regular"              : @30,
                            @"italic"               : @35,
                            @"regularitalic"        : @40,
                            @"medium"               : @45,
                            @"mediumitalic"         : @50,
                            @"semibold"             : @55,
                            @"semibolditalic"       : @60,
                            @"bold"                 : @65,
                            @"bolditalic"           : @70,
                            @"condensedbold"        : @71,
                            @"heavy"                : @75,
                            @"heavyitalic"          : @80,
                            @"black"                : @85,
                            @"blackitalic"          : @90,
                            @"condensedblack"       : @95
                            };
    
    NSRange range = [weight rangeOfString:@"-"];
    if( range.location == NSNotFound )
        return 32;
    else{
        NSNumber *position = [line objectForKey:[[weight substringFromIndex:range.location + range.length] lowercaseString]];
        
        return [position integerValue];
    }
    
//    NSNumber *position = [line objectForKey:[weight lowercaseString]];
//    if( position )
//        return [position integerValue];
//    
//    return 32;
}

@end
