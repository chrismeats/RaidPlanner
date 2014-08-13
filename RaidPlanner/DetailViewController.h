//
//  DetailViewController.h
//  RaidPlanner
//
//  Created by ETC ComputerLand on 8/13/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
