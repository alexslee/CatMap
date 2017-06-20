//
//  FlickrImage.h
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FlickrImageDetails.h"
@interface FlickrImage : NSObject
//need the server, farm, id, and secret attributes of each photo to be able to construct the URL for download

@property (strong, nonatomic)FlickrImageDetails *imageDetails;

@property (strong, nonatomic) NSString *farm;

@property (strong, nonatomic) NSString *imageID;

@property (strong, nonatomic) NSString *secret;

@property (strong, nonatomic) NSString *server;

@property (strong, nonatomic) NSString *constructedURL;

@property (strong, nonatomic) NSString *imageName;

@property (strong, nonatomic) UIImage *image;

- (instancetype)initWithFarm:(NSString *)farm andID:(NSString *)imageID andSecret:(NSString *)secret andServer:(NSString *)server andName:(NSString *)name;

@end
