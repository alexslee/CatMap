//
//  FlickrImageDetails.h
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
//object will retain details to be displayed in the detailed view for each image
@interface FlickrImageDetails : NSObject

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *views;
@property (strong, nonatomic) NSString *owner;
@property (strong, nonatomic) NSString *location;
@property (nonatomic) CLLocationCoordinate2D coordinates;

- (instancetype)initWithURL:(NSString *)url andViews:(NSString *)views andOwner:(NSString *)owner andLocation:(NSString *)location andCoordinates:(CLLocationCoordinate2D)coordinates;

@end
