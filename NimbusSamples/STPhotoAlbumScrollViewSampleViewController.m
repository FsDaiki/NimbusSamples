//
//  STPhotoAlbumScrollViewSampleViewController.m
//  NimbusSamples
//
//  Created by MIYAMOTO, Hideaki on 2013/05/18.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
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
    [self.view addSubview:_photoAlbumScrollView];
}



@end
