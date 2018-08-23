//
//  PhotoView.h
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 20/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "MaterialButtons.h"

@interface PhotoView : UIView
@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) MDCButton *saveButton;
@property (strong, nonatomic) MDCButton *backButton;
@property (strong, nonatomic) UIView *dismissView;
@property (strong, nonatomic) MASConstraint *topContentViewConstraint;
@property (strong, nonatomic) MASConstraint *bottomContentViewConstraint;
@end
