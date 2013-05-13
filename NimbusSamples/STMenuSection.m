//
//  STMenuSection.m
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/13.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STMenuSection.h"

@implementation STMenuSection

- (id)init
{
    self = [super init];
    if (self) {
        _rows = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

@end
