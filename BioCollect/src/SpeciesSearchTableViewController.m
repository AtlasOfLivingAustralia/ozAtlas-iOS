//
//  SpeciesSearchTableViewController.m
//  Oz Atlas
//
//  Created by Varghese, Temi (PI, Black Mountain) on 17/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "SpeciesSearchTableViewController.h"
#import "GAAppDelegate.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "SpeciesCell.h"

@interface SpeciesSearchTableViewController ()
@end

@implementation SpeciesSearchTableViewController

@synthesize speciesTableView, displayItems, selectedSpecies, searchBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    displayItems = [[NSMutableArray alloc] initWithCapacity:0];
    [self searchBar].text = @"";
    [self searchBarSearchButtonClicked:[self searchBar]];
    
    // table view settings
    speciesTableView.rowHeight = 60;
    speciesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    // temp fix
    speciesTableView.contentInset = UIEdgeInsetsMake(30, 0, 0, 0);
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
        // Configure the cell...
        cell = [[SpeciesCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        cell.autoresizesSubviews = YES;
    }
    
    NSDictionary *species = [displayItems objectAtIndex:indexPath.row];
    NSString *thumbnail;
    cell.textLabel.text = species[@"displayName"];
    cell.detailTextLabel.text = species[@"rank"];
    
    if(self.noImage == nil){
        self.noImage = [UIImage imageNamed:@"table-place-holder"];
    }
    
    thumbnail = (([species objectForKey:@"thumbnailUrl"] != nil) && (species[@"thumbnailUrl"] != [NSNull null]))? species[@"thumbnailUrl"] :@"";
    if(![thumbnail isEqualToString:@""]){
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString: thumbnail] placeholderImage:[UIImage imageNamed:@"ajax_loader.gif"] options:SDWebImageRefreshCached ];
    } else {
        cell.imageView.image = self.noImage;
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = nil;
    if(self.isSearching) {
        title = @"Loading...";
    } else if(self.loadingFinished){
        title = @"Completed searching";
    }
    
    return title;
}

- (void) searchBarSearchButtonClicked:(UISearchBar*) theSearchBar{
    [theSearchBar resignFirstResponder];
    self.loadingFinished = NO;
    self.isSearching = YES;

    GAAppDelegate *appDelegate = (GAAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableArray *result = [appDelegate.restCall autoCompleteSpecies:theSearchBar.text addSearchText:YES viewController: self];

    [displayItems removeAllObjects];
    [displayItems addObjectsFromArray:result];
    [speciesTableView reloadData];
}


/**
 * update display items after asynchronous search
 */
-(void)updateDisplayItems: (NSMutableArray *)data{
    self.loadingFinished = YES;
    self.isSearching = NO;
    [displayItems removeAllObjects];
    [displayItems addObjectsFromArray:data];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}
@end
