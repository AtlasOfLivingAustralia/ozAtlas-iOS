//
//  HomeWebView.h
//  BioCollect
//
//  Created by Sathish Babu Sathyamoorthy on 9/03/2016.
//  Copyright © 2016 Sathya Moorthy, Sathish (Atlas of Living Australia). All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIWebView.h>
#import "GAActivity.h"

@interface RecordWebView :  UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) GAActivity *activity;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

