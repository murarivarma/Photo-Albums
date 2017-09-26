//
//  Album+CoreDataProperties.h
//  Photo Albums
//
//  Created by Murari Varma on 26/09/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Album+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Album (CoreDataProperties)

+ (NSFetchRequest<Album *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *date;

@end

NS_ASSUME_NONNULL_END
