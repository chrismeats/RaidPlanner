//
//  MasterViewController.m
//  RaidPlanner
//
//  Created by ETC ComputerLand on 8/13/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "Adventurer.h"
#import "Raid.h"

@interface MasterViewController ()
@end

@implementation MasterViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Adventurer"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];

    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"raidPlanner"];
}

- (IBAction)addNewAdventurerNamed:(UITextField *)sender
{
    NSArray *species = [NSArray arrayWithObjects:@"Human", @"Orc", "Elf", @"Hobbit", nil];
    Adventurer *adventurer = [NSEntityDescription insertNewObjectForEntityForName:@"Adventurer" inManagedObjectContext:self.managedObjectContext];
    adventurer.name = sender.text;
    adventurer.species = [species objectAtIndex:arc4random()%species.count];
    [self.managedObjectContext save:nil];
    sender.text = nil;
    [sender resignFirstResponder];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fetchedResultsController.sections[section] numberOfSections];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Adventurer *adventurer = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = adventurer.name;
    return cell;
}

@end
