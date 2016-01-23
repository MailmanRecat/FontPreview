//
//  TXTContentViewController.h
//  FontPreview
//
//  Created by caine on 1/23/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXTContentViewController : UIViewController

@property( nonatomic, strong ) NSString *filename;

- (instancetype)initWithFilename:(NSString *)filename;

@end
