//
//  FlickrImage.m
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "FlickrImage.h"

@implementation FlickrImage
@synthesize coordinate = _coordinate;


- (instancetype)initWithFarm:(NSString *)farm andID:(NSString *)imageID andSecret:(NSString *)secret andServer:(NSString *)server andName:(NSString *)name {
    
    self = [super init];
    
    if (self) {
        _imageDetails = nil;
        _farm = farm;
        _imageID = imageID;
        _secret = secret;
        _server = server;
        
        _constructedURL = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",_farm,_server,_imageID,_secret];
        
        _imageName = name;
        
        _title = _imageName;
        
        _image = nil;
    }
    
    return self;
}

@end
