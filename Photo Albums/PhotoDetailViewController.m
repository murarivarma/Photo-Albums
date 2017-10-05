//
//  PhotoDetailViewController.m
//  Photo Albums
//
//  Created by Murari Varma on 05/10/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "Photo+CoreDataClass.h"

@interface PhotoDetailViewController ()

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.imageView.image = (UIImage *)self.photo.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFilterButtonPressed:(UIButton *)sender {
    
    
    
}

- (IBAction)deleteButtonPressed:(UIButton *)sender {
    
    [[self.photo managedObjectContext] deleteObject:self.photo];
    
    //NSLog(@"%@ %@", self.photo, [self.photo managedObjectContext]);
    
    NSError *error = nil;
    
    [[self.photo managedObjectContext] save:&error];  //This Code is needed only when testing in simulator, when testing in a real device, NOT NEEDED to explicitly call save - CoreData knows how to auto save in the background.
    
    if(error) {
        NSAssert(NO, @"Error deleting photo context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
