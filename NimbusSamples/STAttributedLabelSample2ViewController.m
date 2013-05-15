//
//  STAttributedLabelSample2ViewController.m
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/15.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STAttributedLabelSample2ViewController.h"
#import "NimbusAttributedLabel.h"

@implementation STAttributedLabelSample2ViewController {
    IBOutlet __weak NIAttributedLabel *_label1;
    IBOutlet __weak NIAttributedLabel *_label2;
    IBOutlet __weak NIAttributedLabel *_label3;
}

- (id)init
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        self.title = @"Decoration";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _label1.text = @"01234567890";
    NSRange range = NSMakeRange(4, 3);
    [_label1 setTextColor:[UIColor redColor] range:range];
    [_label1 setFont:[UIFont boldSystemFontOfSize:18.0f] range:range];
    [_label1 setUnderlineStyle:kCTUnderlineStyleSingle modifier:kCTUnderlinePatternSolid range:range];
    
    _label2.text = @"01234567890";
    _label2.font = [UIFont systemFontOfSize:20.0];
    _label2.strokeWidth = 4.0f;
    _label2.strokeColor = [UIColor grayColor];
    
    _label3.text = @"01234567890";
    _label3.font = [UIFont systemFontOfSize:20.0];
    _label3.strokeWidth = -4.0f;
    _label3.strokeColor = [UIColor grayColor];
    _label3.textColor = [UIColor greenColor];
    _label3.textKern = 4.0f;
}

@end
