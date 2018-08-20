//
//  PhotoView.h
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 20/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "MaterialButtons.h"

@interface PhotoView : UIView
@property (strong, nonatomic) UIView *optionsView;
@property (strong, nonatomic) MDCButton *saveButton;
@end
