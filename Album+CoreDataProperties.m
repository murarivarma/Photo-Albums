//
//  Album+CoreDataProperties.m
//  Photo Albums
//
//  Created by Murari Varma on 26/09/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Album+CoreDataProperties.h"

@implementation Album (CoreDataProperties)

+ (NSFetchRequest<Album *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Album"];
}

@dynamic name;
@dynamic date;

@end
