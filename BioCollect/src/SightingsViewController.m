//
//  SightingsViewController.m
//  Oz Atlas
//
//  Created by Varghese, Temi (PI, Black Mountain) on 11/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "SightingsViewController.h"
#import "Record.h"
#import "SpeciesSearchTableViewController.h"
#import "GAAppDelegate.h"
//#import "InputsFormViewController.h"
@interface SightingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *individualsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *individualsStepper;
@property (strong, nonatomic) Record *record;
@property (weak, nonatomic) IBOutlet UITextView *noteTextField;
@property (weak, nonatomic) IBOutlet UISearchBar *searchSpecies;
@property (weak, nonatomic) IBOutlet UILabel *speciesLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *confidenceSwitch;
@property (weak, nonatomic) IBOutlet UITextView *commentsTextField;

// singleton class
@property (retain, nonatomic)  SpeciesSearchTableViewController *speciesSearchVC;
//@property (retain, nonatomic)  InputsFormViewController *xlForm;
@end

@implementation SightingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *) nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        [self initialise];
        self.speciesSearchVC = [[SpeciesSearchTableViewController alloc] initWithNibName:@"SpeciesSearchTableViewController" bundle:nil];
//        self.xlForm = [[InputsFormViewController alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveSpeciesHandler:) name:@"SPECIESSEARCH DISMISS" object:nil];
    }
    return self;
}

- (void) initialise {
    Record *rec = [[Record alloc] init];
    self.record = rec;
}

- (void)saveSpeciesHandler: (NSNotification *)notice{
    NSDictionary *selection = (NSDictionary *)[notice object];
    
    if(selection[@"name"] != [NSNull null]){
        self.record.scientificName = selection[@"name"];
    } else {
        self.record.scientificName = nil;
    }
    
    if(selection[@"commonName"] != [NSNull null]){
        self.record.commonName = selection[@"commonName"];
        if(self.record.scientificName){
            self.record.speciesDisplayName = [NSString stringWithFormat:@"%@ (%@)", self.record.scientificName, self.record.commonName];
        }
    } else {
        self.record.commonName = nil;
        self.record.speciesDisplayName = [NSString stringWithFormat:@"%@", self.record.scientificName];
    }
    
    if(selection[@"guid"] != [NSNull null]){
        self.record.guid = selection[@"guid"];
    } else {
        self.record.guid = nil;
    }
    
    self.speciesLabel.text = self.record.speciesDisplayName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)stepperValueChanged:(UIStepper *)sender {
    int value = [sender value];
    self.individualsLabel.text = [NSString stringWithFormat:@"%d", (int)value];
    [self.record setNumberOfInidividuals:value];
    self.record.guid = [NSString stringWithFormat:@"testing"];
    NSLog(@"%@", self.record.guid);
    NSLog(@"%d", self.record.numberOfInidividuals);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - action
- (IBAction)saveRecord:(id)sender {
    self.record.numberOfInidividuals =(int)self.individualsStepper.value;
    self.record.notes = self.noteTextField.text;
    self.record.confidence = [self.confidenceSwitch titleForSegmentAtIndex:[self.confidenceSwitch selectedSegmentIndex]];
    NSLog(@"%@", self.record.confidence);
}

- (IBAction)searchForASpecies:(id)sender {
//    [self presentViewController:self.speciesSearchVC animated:YES completion:nil];
//    [self presentViewController:self.xlForm animated:YES completion:nil];
}
@end
