//
//  RTNActivityView.m
//  Ruben Niculcea
//
//  Created by Ruben Niculcea on 2/2/14.
//  Copyright (c) 2014 Ruben Niculcea. All rights reserved.
//

#import "RTNActivityView.h"

@interface  RTNActivityView ()

@property (strong, nonatomic) UIActivityIndicatorView *indicator;

@end

@implementation RTNActivityView

- (id)initAndShow
{
    self = [super init];
    if (self)
        [self show];
    
    return self;
}

- (void) show
{
    UIWindow *result = [[[UIApplication sharedApplication] windows] lastObject];

    self.frame = result.frame;
    self.backgroundColor = [UIColor colorWithWhite:.667 alpha:.5];
    
    if (self.indicator == nil)
        self.indicator = [[UIActivityIndicatorView alloc]
                          initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.indicator.color = [UIColor grayColor]; // White, no gray!
    self.indicator.frame = CGRectMake(0.0, 0.0, 80.0, 80.0);
    self.indicator.center = self.center;
    [self addSubview:self.indicator];
    
    [self.indicator startAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    
    [result addSubview:self];
}

- (void) remove
{
    [self.indicator stopAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
    [self removeFromSuperview];
}

@end
