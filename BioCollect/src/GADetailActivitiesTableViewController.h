//
//  GADetailFormViewController.h
//  GreenArmy
//
//  Created by Sathya Moorthy, Sathish (Atlas of Living Australia) on 9/04/2014.
//  Copyright (c) 2014 Sathya Moorthy, Sathish (Atlas of Living Australia). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAProject.h"
#import "GADetailFormVIewController.h"
#import <CoreLocation/CoreLocation.h>
#import "GACreateSiteModalViewController.h"

@interface GADetailActivitiesTableViewController : UITableViewController <UISplitViewControllerDelegate,UIActionSheetDelegate,UISearchDisplayDelegate, UISearchBarDelegate, UIAlertViewDelegate,CLLocationManagerDelegate, GACreateSiteModalDelegate,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * projects;
@property (nonatomic, strong) NSMutableArray *filteredActivityList;
@property (nonatomic, strong) GAProject * project;
@property (nonatomic, assign) int projectIndex;
@property (nonatomic, assign) BOOL isSearching;
@property (nonatomic, strong) CLLocationManager *locationMgr;
@property (nonatomic, strong) CLLocation *tempLocation;

@property (nonatomic, strong) GADetailFormVIewController  *formWebView;

-(void) setSelectedProjectIndex : (int) selectedProjectIndex;
-(void) updateActivityTableModel : (NSMutableArray *) p;
@end
