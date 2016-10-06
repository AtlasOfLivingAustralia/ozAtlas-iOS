//
//  RecordsTableViewController.h
//  BioCollect
//
//  Created by Sathish Babu Sathyamoorthy on 10/03/2016.
//  Copyright © 2016 Sathya Moorthy, Sathish (Atlas of Living Australia). All rights reserved.
//


#import <UIKit/UIKit.h>
#import "GAAppDelegate.h"
#import "BioProjectService.h"
#import "UIImageView+WebCache.h"

@interface RecordsTableViewController :  UITableViewController <UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UITableView *recordsTableView;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSMutableArray *records;
@property (nonatomic, strong) GAProject *project;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

//Pagination info.
@property (nonatomic, assign) NSInteger totalRecords;
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, assign) BOOL loadingFinished;
@property (nonatomic, strong) NSString * query;
@property (nonatomic, assign) BOOL myRecords;

//Search flag
@property (nonatomic, assign) BOOL isSearching;

@property (nonatomic, strong) GAAppDelegate *appDelegate;
@property (nonatomic, strong) BioProjectService *bioProjectService;

@end