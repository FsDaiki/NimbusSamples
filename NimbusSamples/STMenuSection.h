//
//  STMenuSection.h
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/13.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMenuSection : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic, readonly) NSMutableArray *rows;

@end
