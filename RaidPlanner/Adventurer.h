//
//  Adventurer.h
//  RaidPlanner
//
//  Created by ETC ComputerLand on 8/13/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Raid;

@interface Adventurer : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * species;
@property (nonatomic, retain) NSSet *raids;
@end

@interface Adventurer (CoreDataGeneratedAccessors)

- (void)addRaidsObject:(Raid *)value;
- (void)removeRaidsObject:(Raid *)value;
- (void)addRaids:(NSSet *)values;
- (void)removeRaids:(NSSet *)values;

@end
