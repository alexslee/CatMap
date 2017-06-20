//
//  FlickrManager.m
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "FlickrManager.h"

@implementation FlickrManager

- (void)downloadDetailsForImage:(FlickrImage *)image withCompletion:(void (^)(FlickrImageDetails*))completion {
    NSString *rawURL = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&format=json&photo_id=%@&nojsoncallback=1&api_key=8ec3cec8e3a44f229e001aa4105329fb&tags=cat",image.imageID];
    
    NSURL *url = [NSURL URLWithString:rawURL];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"error: %@", jsonError.localizedDescription);
            return;
        }
        NSDictionary *photo = [info objectForKey:@"photo"];
        NSDictionary *urls = [photo objectForKey:@"urls"];
        NSArray<NSDictionary *> *oneURL = [urls objectForKey:@"url"];
        
        NSDictionary *owner = [photo objectForKey:@"owner"];
        
        NSString *username = [owner objectForKey:@"username"];
        
        NSString *views = [photo objectForKey:@"views"];
        FlickrImageDetails *imageInfo = [[FlickrImageDetails alloc] initWithURL:[oneURL[0] objectForKey:@"_content"] andViews:views andOwner:username];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            completion(imageInfo);
        }];
        
    }];
    
    [task resume];
}

- (void)downloadImageWithCompletionHandler:(void (^)(UIImage *))completion fromURL:(NSString *)url;
{
    NSURL *fromHere = [NSURL URLWithString:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    self.downloadTask = [session downloadTaskWithURL:fromHere completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            completion(image);
        }];
        
    }];
    
    [self.downloadTask resume];
}

- (void)collectImagesWithCompletionHandler:(void (^)(NSMutableArray *))completion {
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=8ec3cec8e3a44f229e001aa4105329fb&tags=cat"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSLog(@"here");
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"jsonError: %@",jsonError.localizedDescription);
            return;
        }
        
        NSDictionary *photos = [dict objectForKey:@"photos"];
        NSDictionary *actualPhotos = [photos objectForKey:@"photo"];
        NSMutableArray *constructedImages = [[NSMutableArray alloc] init];
        for (NSDictionary *photo in actualPhotos) {
            FlickrImage *tempImage = [[FlickrImage alloc] initWithFarm:[photo objectForKey:@"farm"] andID:[photo objectForKey:@"id"] andSecret:[photo objectForKey:@"secret"] andServer:[photo objectForKey:@"server"] andName:[photo objectForKey:@"title"]];
            [constructedImages addObject:tempImage];
//            NSLog(@"title: %@",[photo objectForKey:@"title"]);
            
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^(void) {
            completion(constructedImages);
        }];
        
    }];
    
    [task resume];
}

@end
