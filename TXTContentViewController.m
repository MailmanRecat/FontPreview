//
//  TXTContentViewController.m
//  FontPreview
//
//  Created by caine on 1/23/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import "TXTContentViewController.h"

@interface TXTContentViewController ()

@end

@implementation TXTContentViewController

- (instancetype)initWithFilename:(NSString *)filename{
    self = [super init];
    if( self ){
        self.filename = filename;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.frame];
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    textView.backgroundColor  = [UIColor whiteColor];
    textView.editable         = NO;
    
    textView.text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.filename ofType:@"txt"]
                                              encoding:NSUTF8StringEncoding
                                                 error:nil];
    
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
