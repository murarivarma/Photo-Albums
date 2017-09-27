//
//  PictureDataTransformer.m
//  Photo Albums
//
//  Created by Murari Varma on 27/09/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

#import "PictureDataTransformer.h"
#import <UIKit/UIKit.h>

@implementation PictureDataTransformer

+(Class)transformedValueClass {
    
    return [NSData class];
    
}

+(BOOL)allowsReverseTransformation {
    return YES;
}

-(id)transformedValue:(id)value {
    return UIImagePNGRepresentation(value);
}

-(id)reverseTransformedValue:(id)value {
    UIImage *image = [UIImage imageWithData:value];
    return image;
}

@end
