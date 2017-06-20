//
//  ShowAllViewController.h
//  CatMap
//
//  Created by Alex Lee on 2017-06-20.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FlickrImage.h"
@interface ShowAllViewController : UIViewController

@property (strong, nonatomic) NSMutableArray<FlickrImage *> *allImages;

@end
