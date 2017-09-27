//
//  CoreDataHelper.m
//  Photo Albums
//
//  Created by Murari Varma on 27/09/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper

+(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    
    AppDelegate *delegate =  (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([delegate respondsToSelector:@selector(persistentContainer)]) {
        context = delegate.persistentContainer.viewContext;
    }
//    AppDelegate *delegate =  (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    return context;
}

@end
