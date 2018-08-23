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
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *dismissIndicatorView;
@end

@implementation PhotoView

- (void)setSaveButton:(MDCButton *)saveButton {
    _saveButton = saveButton;
    _saveButton.backgroundColor = [[[ColorThemeObjC alloc] initWithColorTheme:ColorThemeSecondary].colorValue colorWithAlphaComponent:0.75];
    _saveButton.layer.cornerRadius = 8;
    [_saveButton setTitle:@"SAVE IMAGE" forState:UIControlStateNormal];
}

- (void)setPhotoImageView:(UIImageView *)photoImageView {
    _photoImageView = photoImageView;
    _photoImageView.userInteractionEnabled = YES;
    _photoImageView.layer.cornerRadius = 8;
    _photoImageView.clipsToBounds = YES;
}

- (void)setOptionsView:(UIView *)optionsView {
    _optionsView = optionsView;
}

- (void)setDismissView:(UIView *)dismissView {
    _dismissView = dismissView;
    _dismissView.backgroundColor = UIColor.clearColor;
}

- (void)setDismissIndicatorView:(UIView *)dismissIndicatorView {
    _dismissIndicatorView = dismissIndicatorView;
    _dismissIndicatorView.backgroundColor = [[[ColorThemeObjC alloc] initWithColorTheme:ColorThemeOnPrimary].colorValue colorWithAlphaComponent:0.75];
    _dismissIndicatorView.layer.cornerRadius = 2;
    _dismissIndicatorView.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    _dismissIndicatorView.layer.shadowRadius = 2.0;
    _dismissIndicatorView.layer.shadowOpacity = 0.1;
}

- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
    _contentView.backgroundColor = [[[ColorThemeObjC alloc] initWithColorTheme:ColorThemeOnSecondary].colorValue colorWithAlphaComponent:0.95];
    _contentView.layer.cornerRadius = 8;
    _contentView.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    _contentView.layer.shadowRadius = 2.0;
    _contentView.layer.shadowOpacity = 0.5;
}

- (void)setBackButton:(MDCButton *)backButton {
    _backButton = backButton;
    _backButton.backgroundColor = [[[ColorThemeObjC alloc] initWithColorTheme:ColorThemeOnSecondary].colorValue colorWithAlphaComponent:0.75];
    _backButton.layer.cornerRadius = 8;
    [_backButton setTitle:@"BACK" forState:UIControlStateNormal];
}

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
    self.saveButton = [[MDCButton alloc] init];
    self.photoImageView = [[UIImageView alloc] init];
    self.optionsView = [[UIView alloc] initWithFrame:CGRectZero];
    self.dismissView = [[UIView alloc] initWithFrame:CGRectZero];
    self.dismissIndicatorView = [[UIView alloc] initWithFrame:CGRectZero];
    self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
    self.backButton = [[MDCButton alloc] init];
}

- (void)addSubviews {
    [self addSubview:_contentView];
    [_contentView addSubview:_photoImageView];
    [_photoImageView addSubview:_dismissView];
    [_dismissView addSubview:_dismissIndicatorView];
    [_photoImageView addSubview:_optionsView];
    [_optionsView addSubview:_saveButton];
    [_optionsView addSubview:_backButton];
}

- (void)setLayout {
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        self->_topContentViewConstraint = make.top.equalTo(self.mas_safeAreaLayoutGuideTop);
        make.left.equalTo(@8);
        make.right.equalTo(@-8);
        self->_bottomContentViewConstraint = make.bottom.equalTo(self);
    }];
    
    [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self->_contentView);
        make.bottom.equalTo(self->_contentView.mas_safeAreaLayoutGuideBottom);
    }];
    
    [_dismissView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self->_photoImageView);
        make.height.equalTo(@64);
    }];

    [_dismissIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@8);
        make.top.equalTo(@8);
        make.left.equalTo(self->_dismissView.mas_left).offset(16);
        make.right.equalTo(self->_dismissView.mas_right).offset(-16);
    }];
    
    [_optionsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-8);
        make.bottom.equalTo(@-16);
    }];

    [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self->_optionsView);
        make.bottom.equalTo(self->_backButton.mas_top).offset(-8);
    }];
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self->_optionsView);
    }];
}

@end
