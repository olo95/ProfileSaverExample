//
//  PhotoView.m
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 20/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

#import "PhotoView.h"
#import "Masonry.h"
#import "MaterialButtons.h"
#import "ProfileSaverExample-Swift.h"

@interface PhotoView ()
@property (strong, nonatomic) UIView *optionsView;
@end

@implementation PhotoView

- (MDCButton *)saveButton {
    MDCButton *button = [[MDCButton alloc] init];
    button.backgroundColor = [[ColorThemeObjC alloc] initWithColorTheme:ColorThemeSecondary].colorValue;
    [button setTitle:@"SAVE IMAGE" forState:UIControlStateNormal];
    return button;
}

- (void)addSubviews {
    [self addSubview:_photoImageView];
    [_photoImageView addSubview:_optionsView];
    [_optionsView addSubview:_saveButton];
}

- (void)setLayout {
    [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    
    [_optionsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-8);
        make.bottom.equalTo(@-8);
    }];
    
    [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
}

@end
