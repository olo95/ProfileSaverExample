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
@end

@implementation PhotoViewController

- (PhotoView*)mainView {
    return (PhotoView*)self.view;
}

- (void)loadView {
    [super loadView];
    self.view = [[PhotoView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
