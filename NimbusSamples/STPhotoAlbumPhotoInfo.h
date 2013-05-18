//
//  STPhotoAlbumPhotoInfo.h
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/18.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STPhotoAlbumPhotoInfo : NSObject

@property (strong, nonatomic) UIImage *thumbnailImage;
@property (strong, nonatomic) NSURL *originalImageURL;
@property (nonatomic) CGSize originalImageSize;

@end
