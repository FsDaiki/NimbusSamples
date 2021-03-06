//
//  STPagingScrollViewImagePage.h
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/13.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NimbusPagingScrollView.h"

@interface STPagingScrollViewImagePage : UIView<NIPagingScrollViewPage>

@property (nonatomic, readwrite, copy) NSString* reuseIdentifier;
@property (nonatomic, readwrite, assign) NSInteger pageIndex;
@property (strong, nonatomic, readonly) UIImageView *imageView;

@end
