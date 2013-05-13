//
//  STPagingScrollViewLabelPage.m
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/13.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STPagingScrollViewLabelPage.h"

@implementation STPagingScrollViewLabelPage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect labelFrame;
        labelFrame.origin.x = 8;
        labelFrame.origin.y = 8;
        labelFrame.size.width = self.bounds.size.width - 8*2;
        labelFrame.size.height = self.bounds.size.height - 8*2;
        _label = [[NIAttributedLabel alloc] initWithFrame:labelFrame];
        _label.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _label.numberOfLines = 0;
        _label.lineBreakMode = NSLineBreakByWordWrapping;
        _label.autoDetectLinks = YES;
        [self addSubview:_label];
    }
    return self;
}

@end
