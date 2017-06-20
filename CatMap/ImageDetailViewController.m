//
//  ImageDetailViewController.m
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <SFSafariViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@property (weak, nonatomic) IBOutlet UILabel *ownerLabel;

@property (strong, nonatomic) FlickrImage *image;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
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
    self.imageView.image = self.image.image;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.layer.masksToBounds = YES;
    self.testLabel.text = self.image.imageDetails.views;
    self.titleLabel.text = self.image.imageName;
    self.ownerLabel.text = self.image.imageDetails.owner;
    self.locationLabel.text = self.image.imageDetails.location;
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
