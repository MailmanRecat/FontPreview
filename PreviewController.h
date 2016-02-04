//
//  PreviewController.h
//  FontPreview
//
//  Created by caine on 1/20/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FontAsset.h"

@interface PreviewController : UIViewController

@property( nonatomic, strong ) FontAsset  *fontAsset;
@property( nonatomic, assign ) NSUInteger  previewType;
@property( nonatomic, strong ) NSString   *lang;

@end
