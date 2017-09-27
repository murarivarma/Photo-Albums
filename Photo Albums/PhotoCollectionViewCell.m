//
//  PhotoCollectionViewCell.m
//  Photo Albums
//
//  Created by Murari Varma on 27/09/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#define IMAGE_VIEW_BORDER_LENGTH 5

@implementation PhotoCollectionViewCell

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if(self) [self setup];
    
    return self;
}

-(void)setup {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, IMAGE_VIEW_BORDER_LENGTH, IMAGE_VIEW_BORDER_LENGTH)];
    [self.contentView addSubview:self.imageView];
}

@end
