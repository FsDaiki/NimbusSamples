//
//  STPhotoAlbumScrollViewSampleViewController.m
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/18.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STPhotoAlbumScrollViewSampleViewController.h"

@implementation STPhotoAlbumScrollViewSampleViewController {
    __weak NIPhotoAlbumScrollView *_photoAlbumScrollView;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Photo Album";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NIPhotoAlbumScrollView *photoAlbumScrollView = [[NIPhotoAlbumScrollView alloc] initWithFrame:self.view.bounds];
    _photoAlbumScrollView = photoAlbumScrollView;
    _photoAlbumScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _photoAlbumScrollView.dataSource = self;
    [self.view addSubview:_photoAlbumScrollView];
    [_photoAlbumScrollView reloadData];
}

#pragma mark - NIPhotoAlbumScrollViewDataSource

- (NSInteger)numberOfPagesInPagingScrollView:(NIPagingScrollView *)photoAlbumScrollView
{
    return 3;
}

- (UIView<NIPagingScrollViewPage> *)pagingScrollView:(NIPagingScrollView *)photoAlbumScrollView pageViewForIndex:(NSInteger)pageIndex
{
    return [_photoAlbumScrollView pagingScrollView:photoAlbumScrollView pageViewForIndex:pageIndex];
}

- (UIImage *)photoAlbumScrollView:(NIPhotoAlbumScrollView *)photoAlbumScrollView
                     photoAtIndex:(NSInteger)photoIndex
                        photoSize:(NIPhotoScrollViewPhotoSize *)photoSize
                        isLoading:(BOOL *)isLoading
          originalPhotoDimensions:(CGSize *)originalPhotoDimensions
{
    UIImage *image = [UIImage imageNamed:@"castle01.jpg"];
    *isLoading = NO;
    *originalPhotoDimensions = CGSizeMake(800, 600);
    *photoSize = NIPhotoScrollViewPhotoSizeThumbnail;
    
    return image;
}

@end
