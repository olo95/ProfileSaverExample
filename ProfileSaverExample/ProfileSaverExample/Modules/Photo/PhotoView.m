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

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setUI];
        [self addSubviews];
        [self setLayout];
    }
    return self;
}

- (void)setUI {
    _saveButton = [[MDCButton alloc] init];
    _saveButton.backgroundColor = [[[ColorThemeObjC alloc] initWithColorTheme:ColorThemeSecondary].colorValue colorWithAlphaComponent:0.5];
    _saveButton.layer.cornerRadius = 8;
    [_saveButton setTitle:@"SAVE IMAGE" forState:UIControlStateNormal];
    _photoImageView = [[UIImageView alloc] init];
    _optionsView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)addSubviews {
    [self addSubview:_photoImageView];
    [_photoImageView addSubview:_optionsView];
    [_optionsView addSubview:_saveButton];
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
