//
//  DetailViewController.m
//  RaidPlanner
//
//  Created by ETC ComputerLand on 8/13/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "DetailViewController.h"
#import "Adventurer.h"
#import "Raid.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation DetailViewController

- (IBAction)onAddRaid:(id)sender
{
    Raid *raid = [self raid];
    [self.adventurer addRaidsObject:raid];
    [self.adventurer.managedObjectContext save:nil];
}

-(Raid *)raid
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Raid"];
    request.predicate = [NSPredicate predicateWithFormat:@"date = %@", self.datePicker.date];
    NSArray *results = [self.adventurer.managedObjectContext executeFetchRequest:request error:nil];
    NSLog(@"%@", results);
    if (results.count) {
        return results[0];
    } else {
        Raid *raid = [NSEntityDescription insertNewObjectForEntityForName:@"Raid" inManagedObjectContext:self.adventurer.managedObjectContext];
        raid.date = self.datePicker.date;
        return raid;
    }
}


@end
