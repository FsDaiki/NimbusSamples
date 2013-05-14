//
//  STAttributedLabelSampleViewController.m
//  NimbusSamples
//
//  Created by MIYAMOTO, Hideaki on 2013/05/14.
//  Copyright (c) 2013年 Stack3. All rights reserved.
//

#import "STAttributedLabelSampleViewController.h"

@implementation STAttributedLabelSampleViewController {
    IBOutlet __weak NIAttributedLabel *_label1;
    IBOutlet __weak NIAttributedLabel *_label2;
    IBOutlet __weak NIAttributedLabel *_label3;
}

- (id)init
{
    self = [super initWithNibName:@"STAttributedLabelSampleViewController" bundle:nil];
    if (self) {
        self.title = @"NIAttributedLabel";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //
    // label1
    //
    _label1.numberOfLines = 0;
    _label1.lineBreakMode = NSLineBreakByWordWrapping;
    _label1.delegate = self;
    
    NSRange label1LinkRange;
    NSMutableString *label1Text = [NSMutableString stringWithString:@"Link to "];
    label1LinkRange.location = label1Text.length;
    [label1Text appendString:@"Apple Website"];
    label1LinkRange.length = label1Text.length - label1LinkRange.location;
    [label1Text appendString:@"."];

    _label1.text = label1Text;
    [_label1 addLink:[NSURL URLWithString:@"http://www.apple.com/"] range:label1LinkRange];
    //
    // label2
    //
    _label2.delegate = self;
    _label2.autoDetectLinks = YES;
    _label2.linksHaveUnderlines = YES;
    _label2.linkColor = [UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0];
    _label2.highlightedLinkBackgroundColor = [UIColor colorWithRed:0/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    _label2.text = @"Link to http://www.apple.com/";
    //
    // label3
    //
    _label3.delegate = self;
    _label3.autoDetectLinks = YES;
    _label3.dataDetectorTypes = NSTextCheckingTypeLink|NSTextCheckingTypePhoneNumber;
    _label3.text = @"Link to 12-3456-7890";
}

#pragma mark - NIAttributedLabel

- (void)attributedLabel:(NIAttributedLabel *)attributedLabel didSelectTextCheckingResult:(NSTextCheckingResult *)result atPoint:(CGPoint)point
{
    if (result.resultType == NSTextCheckingTypeLink) {
        if (result.URL) {
            NSLog(@"%@", result.URL.absoluteString);
            [[UIApplication sharedApplication] openURL:result.URL];
        } else {
            NSString *phoneNumber = [attributedLabel.text substringWithRange:result.range];
            NSURL *url = [NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNumber]];
            NSString *message = [NSString stringWithFormat:@"Phonenumber URL:'%@'\n You can pass the URL to UIApplication#openURL to open the Phone app.", url.absoluteString];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                                message:message
                                                               delegate:nil
                                                      cancelButtonTitle:@"Cancel"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
    }
}

- (BOOL)attributedLabel:(NIAttributedLabel *)attributedLabel shouldPresentActionSheet:(UIActionSheet *)actionSheet withTextCheckingResult:(NSTextCheckingResult *)result atPoint:(CGPoint)point
{
    if (attributedLabel == _label1) {
        return YES;
    }
    
    return YES;
}

@end
