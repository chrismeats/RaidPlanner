//
//  Raid.h
//  RaidPlanner
//
//  Created by ETC ComputerLand on 8/13/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Raid : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSSet *adventurers;
@end

@interface Raid (CoreDataGeneratedAccessors)

- (void)addAdventurersObject:(NSManagedObject *)value;
- (void)removeAdventurersObject:(NSManagedObject *)value;
- (void)addAdventurers:(NSSet *)values;
- (void)removeAdventurers:(NSSet *)values;

@end
