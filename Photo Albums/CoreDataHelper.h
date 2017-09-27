//
//  CoreDataHelper.h
//  Photo Albums
//
//  Created by Murari Varma on 27/09/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album+CoreDataClass.h"
#import "AppDelegate.h"

@interface CoreDataHelper : NSObject

+(NSManagedObjectContext *)managedObjectContext;

@end
