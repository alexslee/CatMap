//
//  ShowAllViewController.m
//  CatMap
//
//  Created by Alex Lee on 2017-06-20.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "ShowAllViewController.h"

@interface ShowAllViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ShowAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureMapLocation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateMapWithAnnotations {
    [self.mapView addAnnotations:self.allImages];
}

- (void)configureMapLocation {
    
    [self updateMapWithAnnotations];
}

- (IBAction)backToMainView:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
