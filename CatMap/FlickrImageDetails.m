//
//  FlickrImageDetails.m
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "FlickrImageDetails.h"

@implementation FlickrImageDetails

- (instancetype)initWithURL:(NSString *)url andViews:(NSString *)views andOwner:(NSString *)owner andLocation:(NSString *)location andCoordinates:(CLLocationCoordinate2D)coordinates {
    self = [super init];
    
    if (self) {
        _url = url;
        _views = views;
        _owner = owner;
        _location = location;
        _coordinates = coordinates;
    }
    
    return self;
}

@end
