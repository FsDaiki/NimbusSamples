//
//  STPagingScrollViewSampleViewController.m
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/13.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STPagingScrollViewSampleViewController.h"
#import "STPagingScrollViewImagePage.h"
#import "STPagingScrollViewLabelPage.h"

@implementation STPagingScrollViewSampleViewController {
    IBOutlet __weak NIPagingScrollView *_pagingScrollView;
    IBOutlet __weak UIPageControl *_pageControl;
    __strong NSMutableArray *_pageContents;
}

- (id)init
{
    self = [super initWithNibName:@"STPagingScrollViewSampleViewController" bundle:nil];
    if (self) {
        self.title = @"NIPagingScrollView";
        _pageContents = [NSMutableArray arrayWithCapacity:3];
        
        [_pageContents addObject:@"伊賀上野城は、上野盆地のほぼ中央にある上野台地の北部にある標高184メートルほどの丘に建てられた平山城である。北には服部川と柘植川、南には久米川、西側には木津川の本流が流れ、城と城下町を取り巻く要害の地にある。\n引用: http://ja.wikipedia.org/wiki/%E4%B8%8A%E9%87%8E%E5%9F%8E"];
        [_pageContents addObject:[UIImage imageNamed:@"castle01.jpg"]];
        [_pageContents addObject:[UIImage imageNamed:@"castle02.jpg"]];
        [_pageContents addObject:[UIImage imageNamed:@"castle03.jpg"]];
        [_pageContents addObject:@"昭和42年（1967年）旧城域一帯が国の史跡に指定されている。城を含めた近隣一帯は上野公園として整備されており、松尾芭蕉を祀る俳聖殿や芭蕉翁記念館があるほか、伊賀流忍者博物館があり、伊賀上野の観光地として利用され、各種イベントなどが行われている。\n引用: http://ja.wikipedia.org/wiki/%E4%B8%8A%E9%87%8E%E5%9F%8E"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    
    _pagingScrollView.dataSource = self;
    _pagingScrollView.delegate = self;
    _pagingScrollView.pageMargin = 0;
    _pagingScrollView.translatesAutoresizingMaskIntoConstraints = YES;
    [_pagingScrollView reloadData];
    
    _pageControl.numberOfPages = _pageContents.count;
    [_pageControl addTarget:self action:@selector(pageControlDidChangeValue) forControlEvents:UIControlEventValueChanged];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [_pagingScrollView willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [_pagingScrollView willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

#pragma mark - NIPagingScrollViewDataSource

- (NSInteger)numberOfPagesInPagingScrollView:(NIPagingScrollView *)pagingScrollView
{
    return _pageContents.count;
}

- (UIView<NIPagingScrollViewPage> *)pagingScrollView:(NIPagingScrollView *)pagingScrollView pageViewForIndex:(NSInteger)pageIndex
{
    NSObject *pageContent = [_pageContents objectAtIndex:pageIndex];
    
    NSString *reusePageIdentifier = nil;
    if ([pageContent isKindOfClass:[UIImage class]]) {
        reusePageIdentifier = @"imagePage";
    } else { // pageContent is NSString
        reusePageIdentifier = @"labelPage";
    }
    
    UIView<NIPagingScrollViewPage> *page = [_pagingScrollView dequeueReusablePageWithIdentifier:reusePageIdentifier];
    
    if ([pageContent isKindOfClass:[UIImage class]]) {
        STPagingScrollViewImagePage *imagePage = nil;
        if (page == nil) {
            imagePage = [[STPagingScrollViewImagePage alloc] initWithFrame:pagingScrollView.bounds];
            page = imagePage;
        } else {
            imagePage = (STPagingScrollViewImagePage *)page;
        }
        imagePage.imageView.image = (UIImage *)pageContent;
    } else { // pageContent is NSString
        STPagingScrollViewLabelPage *labelPage = nil;
        if (page == nil) {
            labelPage = [[STPagingScrollViewLabelPage alloc] initWithFrame:pagingScrollView.bounds];
            page = labelPage;
        } else {
            labelPage = (STPagingScrollViewLabelPage *)page;
        }
        labelPage.label.text = (NSString *)pageContent;
    }
    
    return page;
}

#pragma mark - NIPagingScrollViewDelegate

- (void)pagingScrollViewDidChangePages:(NIPagingScrollView *)pagingScrollView
{
    if (_pageControl.currentPage != _pagingScrollView.centerPageIndex) {
        _pageControl.currentPage = _pagingScrollView.centerPageIndex;
    }
}

#pragma mark - UIPageControl events

- (void)pageControlDidChangeValue
{
    if (_pagingScrollView.centerPageIndex != _pageControl.currentPage) {
        _pagingScrollView.centerPageIndex = _pageControl.currentPage;
    }
}

@end
