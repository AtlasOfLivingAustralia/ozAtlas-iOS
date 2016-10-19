//
//  SpeciesSearchTableViewController.m
//  Oz Atlas
//
//  Created by Varghese, Temi (PI, Black Mountain) on 17/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "SpeciesSearchTableViewController.h"
#import "GAAppDelegate.h"
@interface SpeciesSearchTableViewController ()
@end

@implementation SpeciesSearchTableViewController

@synthesize speciesTableView, displayItems, selectedSpecies;

- (void)viewDidLoad {
    [super viewDidLoad];
    displayItems = [[NSMutableArray alloc] initWithCapacity:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - init

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.navigationItem.title = @"Search species";
    }
    
    return  self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [displayItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" ];
    if(!cell){
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
                 
    // Configure the cell...
    NSLog(@"%@", [displayItems objectAtIndex:indexPath.row]);
    
    cell.textLabel.text = [[displayItems objectAtIndex:indexPath.row] objectForKey:@"name"];
    if([displayItems objectAtIndex:indexPath.row][@"commonName"] != [NSNull null]){
        cell.textLabel.text = [NSString stringWithFormat:@"%@ (%@)", [[displayItems objectAtIndex:indexPath.row] objectForKey:@"name"], [[displayItems objectAtIndex:indexPath.row] objectForKey:@"commonName"]];
        if([displayItems objectAtIndex:indexPath.row][@"rankString"] != [NSNull null]){
            cell.detailTextLabel.text = [displayItems objectAtIndex:indexPath.row][@"rankString"];
        } else {
            cell.detailTextLabel.text = @"Unmatched taxon";
        }

    } else {
        cell.textLabel.text = [[displayItems objectAtIndex:indexPath.row] objectForKey:@"name"];
        if([displayItems objectAtIndex:indexPath.row][@"rankString"] != [NSNull null]){
            cell.detailTextLabel.text = [displayItems objectAtIndex:indexPath.row][@"rankString"];
        } else {
            cell.detailTextLabel.text = @"Unmatched taxon";
        }
    }
    
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Pass the selected object to the new view controller.
    self.selectedSpecies = displayItems[indexPath.row];
    
    // Push the view controller.
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"SPECIESSEARCH DISMISS" object: self.selectedSpecies];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) searchBarSearchButtonClicked:(UISearchBar*) theSearchBar{
    [theSearchBar resignFirstResponder];
    GAAppDelegate *appDelegate = (GAAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSArray *results = [appDelegate.restCall autoCompleteSpecies:theSearchBar.text addSearchText:YES];
    [displayItems removeAllObjects];
    [displayItems addObjectsFromArray:results];
    [speciesTableView reloadData];
}
@end
