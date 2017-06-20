//
//  SearchViewController.m
//  CatMap
//
//  Created by Alex Lee on 2017-06-20.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchBox;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchNotificationPost {
    NSString *searchString = self.searchBox.text;
    
    NSDictionary *searchDict = @{@"searchFor" : searchString};
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    NSNotification *notification = [[NSNotification alloc] initWithName:@"newSearchParam" object:nil userInfo:searchDict];
    
    [notificationCenter postNotification:notification];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)searchButton:(UIButton *)sender {
    [self searchNotificationPost];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self searchNotificationPost];
    return YES;
}

@end
