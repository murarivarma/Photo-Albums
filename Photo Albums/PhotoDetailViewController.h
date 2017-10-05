//
//  PhotoDetailViewController.h
//  Photo Albums
//
//  Created by Murari Varma on 05/10/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface PhotoDetailViewController : UIViewController

@property (nonatomic, strong) Photo *photo;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)addFilterButtonPressed:(UIButton *)sender;
- (IBAction)deleteButtonPressed:(UIButton *)sender;


@end
