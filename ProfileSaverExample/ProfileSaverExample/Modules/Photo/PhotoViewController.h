//
//  PhotoViewController.h
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 20/08/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
-(instancetype)initWithImageUrl: (NSURL*)imageUrl :(int)imageId;
@end
