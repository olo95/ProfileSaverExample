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
@property (strong, nonatomic) NSString* imageId;
@end

@implementation PhotoViewController

- (instancetype)initWithImageUrl:(NSURL *)imageUrl :(NSString *)imageId {
    self = [super initWithNibName:NULL bundle:NULL];
    if (self) {
        self.imageId = imageId;
        self.imageUrl = imageUrl;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    self.view = [[PhotoView alloc] init];
    _mainView = (PhotoView*)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotoWithUrl: self.imageUrl];
    [self setupButtons];
    [self setupDismissIndicatorViewGesture];
}

- (void)fetchPhotoWithUrl: (NSURL*)imageUrl {
    [[NSURLSession.sharedSession dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil && data == nil) return;
        UIImage *image = [[UIImage alloc] initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!self) return;
            self->_mainView.photoImageView.alpha = 0.0;
            [[[UIViewPropertyAnimator alloc] initWithDuration:1.0 dampingRatio:1.0 animations:^{
                [self->_mainView.photoImageView setImage:image];
                self->_mainView.photoImageView.alpha = 1.0;
            }] startAnimation];
        });
    }] resume];
}

- (void)setupButtons {
    [_mainView.saveButton addTarget:self action: @selector(saveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView.backButton addTarget:self action: @selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveButtonTapped:(id)sender {
    
}

- (void)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupDismissIndicatorViewGesture {
    [_mainView.dismissView addGestureRecognizer:[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dismissIndicatorViewPanned:)]];
}

- (void)dismissIndicatorViewPanned:(UIPanGestureRecognizer*)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:_mainView];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateChanged:
            _mainView.topContentViewConstraint.offset = 0 + translation.y / 1.5;
            _mainView.bottomContentViewConstraint.offset = 0 + translation.y / 1.5;
            [_mainView layoutIfNeeded];
            break;
        case UIGestureRecognizerStateEnded: {
            NSLayoutConstraint *heightConstraint = [_mainView.topContentViewConstraint valueForKey:@"layoutConstraint"];
            if (!(heightConstraint.constant < 200.0)) {
                [self dismissViewControllerAnimated:true completion:nil];
                return;
            }
            _mainView.bottomContentViewConstraint.offset = 0;
            _mainView.topContentViewConstraint.offset = 0;
            [UIView animateWithDuration:0.5 animations:^{
                [self->_mainView layoutIfNeeded];
            }];
            break;
        }
    }
//    switch gestureRecognizer.state {
//    case .changed:
//        mainView.rootContainerTopConstraint?.layoutConstraints.first?.constant = 64 + translation.y / 1.5
//        mainView.rootContainerBottomConstraint?.layoutConstraints.first?.constant = 0 + translation.y / 1.5
//        mainView.layoutIfNeeded()
//    case .ended:
//        guard let topConstraintConstant = mainView.rootContainerTopConstraint?.layoutConstraints.first?.constant,
//        topConstraintConstant < 200.0 else {
//            self.dismiss(animated: true, completion: nil)
//            return
//        }
//        mainView.rootContainerBottomConstraint?.layoutConstraints.first?.constant = 0
//        mainView.rootContainerTopConstraint?.layoutConstraints.first?.constant = 64
//        UIView.animate(withDuration: 0.5, animations: { [weak self] in
//            self?.mainView.layoutIfNeeded()
//        })
//    default:
//        return
//    }
}

@end
