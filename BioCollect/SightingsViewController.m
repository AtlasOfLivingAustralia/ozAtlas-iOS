//
//  SightingsViewController.m
//  Oz Atlas
//
//  Created by Varghese, Temi (PI, Black Mountain) on 11/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "SightingsViewController.h"
#import "Record.h"
@interface SightingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *individualsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *individualsStepper;
@property (strong, nonatomic) Record *record;
@property (weak, nonatomic) IBOutlet UITextView *noteTextField;
@property (weak, nonatomic) IBOutlet UISearchBar *searchSpecies;
@end

@implementation SightingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *) nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        [self initialise];
    }
    return self;
}

- (void) initialise {
    Record *rec = [[Record alloc] init];
    self.record = rec;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)saveRecord:(id)sender {
    self.record.numberOfInidividuals =(int)self.individualsStepper.value;
    self.record.notes = self.noteTextField.text;
    NSLog(@"%@", self.record.notes);
}
@end
