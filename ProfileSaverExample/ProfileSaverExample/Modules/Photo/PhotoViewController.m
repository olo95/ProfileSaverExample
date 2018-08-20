//
//  PhotoViewController.m
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 20/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoView.h"

@interface PhotoViewController ()
@property (strong, nonatomic) PhotoView *mainView;
@property (strong, nonatomic) NSURL* imageUrl;
@property (nonatomic) int imageId;
@end

@implementation PhotoViewController

- (instancetype)initWithImageUrl:(NSURL *)imageUrl :(int)imageId {
    self = [super init];
    if (self) {
        self.imageId = imageId;
        self.imageUrl = imageUrl;
    }
    return self;
}

- (PhotoView*)mainView {
    return (PhotoView*)self.view;
}

- (void)loadView {
    [super loadView];
    self.view = [[PhotoView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotoWithUrl: self.imageUrl];
    [self setupButtons];
}

- (void)fetchPhotoWithUrl: (NSURL*)imageUrl {
    [[NSURLSession.sharedSession dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil && data == nil) return;
        UIImage *image = [[UIImage alloc] initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!self) return;
            self->_mainView.photoImageView.image = image;
        });
    }] resume];
}

- (void)setupButtons {
    [_mainView.saveButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(saveButtonTapped)]];
}

- (void)saveButtonTapped {
    
}

@end
