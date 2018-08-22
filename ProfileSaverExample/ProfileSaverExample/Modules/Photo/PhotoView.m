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

@synthesize photoImageView = _photoImageView;

- (MDCButton *)saveButton {
    _saveButton = [[MDCButton alloc] init];
    _saveButton.backgroundColor = [[ColorThemeObjC alloc] initWithColorTheme:ColorThemeSecondary].colorValue;
    [_saveButton setTitle:@"SAVE IMAGE" forState:UIControlStateNormal];
    return _saveButton;
}

- (UIImageView *)photoImageView {
    _photoImageView = [[UIImageView alloc] init];
    return _photoImageView;
}

- (UIView *)optionsView {
    _optionsView = [[UIView alloc] initWithFrame:CGRectZero];
    return _optionsView;
}

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self addSubviews];
        [self setLayout];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.photoImageView];
    [_photoImageView addSubview:self.optionsView];
    [_optionsView addSubview:self.saveButton];
}

- (void)setLayout {
    [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

    [_optionsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-8);
        make.bottom.equalTo(@-8);
    }];

    [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self->_optionsView);
    }];
}

@end
