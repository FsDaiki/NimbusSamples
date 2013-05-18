//
//  STPhotoAlbumScrollViewSampleViewController.m
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/18.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STPhotoAlbumScrollViewSampleViewController.h"
#import "STPhotoAlbumPhotoInfo.h"
#import "AFNetworking.h"

@implementation STPhotoAlbumScrollViewSampleViewController {
    __weak NIPhotoAlbumScrollView *_photoAlbumScrollView;
    __strong NSMutableArray *_photos;
    __strong NSOperationQueue *_operationQueue;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Photo Album";
        
        _photos = [NSMutableArray arrayWithCapacity:3];
        
        STPhotoAlbumPhotoInfo *photoInfo;
        photoInfo = [[STPhotoAlbumPhotoInfo alloc] init];
        photoInfo.thumbnailImage = [UIImage imageNamed:@"castle01.jpg"];
        photoInfo.originalImageURL = [NSURL URLWithString:@"http://cdn-ak.f.st-hatena.com/images/fotolife/e/eimei23/20130518/20130518091536.jpg?1368836295"];
        photoInfo.originalImageSize = CGSizeMake(800, 600);
        [_photos addObject:photoInfo];

        photoInfo = [[STPhotoAlbumPhotoInfo alloc] init];
        photoInfo.thumbnailImage = [UIImage imageNamed:@"castle02.jpg"];
        photoInfo.originalImageURL = [NSURL URLWithString:@"http://cdn-ak.f.st-hatena.com/images/fotolife/e/eimei23/20130518/20130518091632.jpg?1368836311"];
        photoInfo.originalImageSize = CGSizeMake(800, 600);
        [_photos addObject:photoInfo];

        photoInfo = [[STPhotoAlbumPhotoInfo alloc] init];
        photoInfo.thumbnailImage = [UIImage imageNamed:@"castle03.jpg"];
        photoInfo.originalImageURL = [NSURL URLWithString:@"http://cdn-ak.f.st-hatena.com/images/fotolife/e/eimei23/20130518/20130518091607.jpg?1368836276"];
        photoInfo.originalImageSize = CGSizeMake(800, 600);
        [_photos addObject:photoInfo];
        
        _operationQueue = [[NSOperationQueue alloc] init];
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
    _photoAlbumScrollView.delegate = self;
    [self.view addSubview:_photoAlbumScrollView];
    [_photoAlbumScrollView reloadData];
}

#pragma mark - NIPhotoAlbumScrollViewDataSource

- (NSInteger)numberOfPagesInPagingScrollView:(NIPagingScrollView *)photoAlbumScrollView
{
    return _photos.count;
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
    STPhotoAlbumPhotoInfo *photoInfo = [_photos objectAtIndex:photoIndex];
    
    *originalPhotoDimensions = photoInfo.originalImageSize;
    UIImage *image = nil;
    if (photoInfo.originalImageState != STPhotoAlbumPhotoInfoOriginalImageStateLoaded) {
        *isLoading = YES;
        *photoSize = NIPhotoScrollViewPhotoSizeThumbnail;
        image = photoInfo.thumbnailImage;
        
        if (photoInfo.originalImageState == STPhotoAlbumPhotoInfoOriginalImageStateNone) {
            photoInfo.originalImageState = STPhotoAlbumPhotoInfoOriginalImageStateLoading;

            NSURLRequest *request = [NSURLRequest requestWithURL:photoInfo.originalImageURL];
            AFImageRequestOperation *operation = [AFImageRequestOperation imageRequestOperationWithRequest:request success:^(UIImage *image) {
                photoInfo.originalImage = image;
                photoInfo.originalImageState = STPhotoAlbumPhotoInfoOriginalImageStateLoaded;
                [_photoAlbumScrollView didLoadPhoto:image atIndex:photoIndex photoSize:NIPhotoScrollViewPhotoSizeOriginal];
            }];
            [_operationQueue addOperation:operation];
        }
    } else {
        *isLoading = NO;
        *photoSize = NIPhotoScrollViewPhotoSizeOriginal;
        image = photoInfo.originalImage;
    }
    
    return image;
}

#pragma mark - NIPhotoAlbumScrollViewDelegate

- (void)pagingScrollViewDidChangePages:(NIPagingScrollView *)photoAlbumScrollView
{
    NSLog(@"centerPageIndex:%d", _photoAlbumScrollView.centerPageIndex);
}

@end
