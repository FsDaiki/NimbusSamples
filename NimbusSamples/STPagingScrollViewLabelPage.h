//
//  STPagingScrollViewLabelPage.h
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/13.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NimbusPagingScrollView.h"
#import "NimbusAttributedLabel.h"

@interface STPagingScrollViewLabelPage : UIView<NIPagingScrollViewPage>

@property (nonatomic, readwrite, assign) NSInteger pageIndex;
@property (strong, nonatomic, readonly) NIAttributedLabel *label;

@end
