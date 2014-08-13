//
//  DetailViewController.h
//  RaidPlanner
//
//  Created by ETC ComputerLand on 8/13/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Adventurer.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Adventurer *adventurer;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
