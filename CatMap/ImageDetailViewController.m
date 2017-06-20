//
//  ImageDetailViewController.m
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <SFSafariViewControllerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@property (weak, nonatomic) IBOutlet UILabel *ownerLabel;

@property (strong, nonatomic) FlickrImage *image;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong,nonatomic) UIImage *thumbnail;

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
    self.mapView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)configureView;
{
    self.imageView.image = self.image.bigImage;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.layer.masksToBounds = YES;
    self.testLabel.text = self.image.imageDetails.views;
    self.titleLabel.text = self.image.title;
    self.ownerLabel.text = self.image.imageDetails.owner;
    self.locationLabel.text = self.image.imageDetails.location;
    
    //map view configuration
    if (self.image) {
        MKCoordinateSpan span = MKCoordinateSpanMake(0.5f, 0.5f);
        self.mapView.region = MKCoordinateRegionMake(self.image.coordinate, span);
//        NSLog(@"%@",self.image.coordinate);
        [self.mapView addAnnotation:self.image];
    }
}

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotate"];
//    if (!annotationView) {
//        annotationView = [[MKAnnotationView alloc] initWithAnnotation:self.image reuseIdentifier:@"annotate"];
//        //annotationView.image = self.image.image;
//        annotationView.enabled = YES;
//    }
//    
//    return annotationView;
//}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    //[view addSubview:imageView];
    [view.leftCalloutAccessoryView addSubview:imageView];
    imageView.image = self.image.image;
    CGRect frame = view.frame;
    imageView.frame = CGRectMake(-frame.size.width/2, -frame.size.height-7, frame.size.width, frame.size.height);
}

- (void)setupForImage:(FlickrImage *)image {
    self.image = image;
    [self configureView];
}
- (IBAction)seeOnFlickrTapped:(UIButton *)sender {
    SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:self.image.imageDetails.url]];
    safari.delegate = self;
    [self presentViewController:safari animated:YES completion:nil];
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}


@end
