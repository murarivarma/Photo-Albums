//
//  AlbumTableViewController.h
//  Photo Albums
//
//  Created by Murari Varma on 26/09/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *albums;
- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
