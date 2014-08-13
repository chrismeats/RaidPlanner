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

    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"species" cacheName:@"raidPlanner"];

    self.fetchedResultsController.delegate = self;
    [self.fetchedResultsController performFetch:nil];
}

- (IBAction)addNewAdventurerNamed:(UITextField *)sender
{
    NSArray *species = [NSArray arrayWithObjects:@"Human", @"Orc", @"Elf", @"Hobbit", nil];
    Adventurer *adventurer = [NSEntityDescription insertNewObjectForEntityForName:@"Adventurer" inManagedObjectContext:self.managedObjectContext];
    adventurer.name = sender.text;
    adventurer.species = [species objectAtIndex:arc4random()%species.count];
    [self.managedObjectContext save:nil];
    sender.text = nil;
    [sender resignFirstResponder];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.fetchedResultsController.sections objectAtIndex:section]name];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.fetchedResultsController.sections objectAtIndex:section] numberOfObjects];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Adventurer *adventurer = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = adventurer.name;
    cell.detailTextLabel.text = [[NSNumber numberWithInt:adventurer.raids.count]description];
    return cell;
}
-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *dvc = segue.destinationViewController;

    dvc.adventurer = [self.fetchedResultsController objectAtIndexPath:self.tableView.indexPathForSelectedRow];
}

@end
