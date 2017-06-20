//
//  FlickrManager.h
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FlickrImage.h"
#import "FlickrImageDetails.h"

//a 'download manager', the middleman between the app and Flickr
@interface FlickrManager : NSObject

@property (strong, nonatomic)NSURLSessionDownloadTask *downloadTask;

- (void)downloadDetailsForImage:(FlickrImage *)image withCompletion:(void (^)(FlickrImageDetails*))completion;

- (void)downloadImageWithCompletionHandler:(void (^)(UIImage *))completion fromURL:(NSString *)url;

- (void)collectImagesWithCompletionHandler:(void (^)(NSMutableArray *))completion;

@end
