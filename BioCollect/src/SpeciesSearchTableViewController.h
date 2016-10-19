//
//  SpeciesSearchTableViewController.h
//  Oz Atlas
//
//  Created by Varghese, Temi (PI, Black Mountain) on 17/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SpeciesSearchTableViewController : UITableViewController
{
    NSMutableArray *displayItems;
    NSDictionary *selectedSpecies;
}

@property (strong, nonatomic) IBOutlet UITableView *speciesTableView;
@property (strong, nonatomic) NSMutableArray *displayItems;
@property (strong, nonatomic) NSDictionary *selectedSpecies;
@end
