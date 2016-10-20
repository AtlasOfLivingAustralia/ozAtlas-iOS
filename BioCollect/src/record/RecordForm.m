    //
//  RecordForm.m
//  Oz Atlas
//
//  Created by Sathish Babu Sathyamoorthy on 19/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "RecordForm.h"
#import "GASettings.h"

@implementation RecordForm
- (NSArray *)fields
{
    return @[

             @{FXFormFieldKey: @"speciesDisplayName", FXFormFieldTitle: @"Species Name", FXFormFieldHeader: @"Species Information", FXFormFieldType: FXFormFieldTypeLabel,  FXFormFieldAction: @"showSpeciesSearchTableViewController:", FXFormFieldPlaceholder: @"No species selected"},
             @"speciesPhoto",
             @"confident",
             @{FXFormFieldKey:@"howManySpecies", FXFormFieldTitle:@"Number of individuals", FXFormFieldCell: [FXFormStepperCell class]},
             @{FXFormFieldKey: @"identificationTags",
               FXFormFieldOptions: @[@"Amphibians", @"Amphibians, Australian Ground Frogs", @"Birds"]},

             @{FXFormFieldKey: @"surveyDate", FXFormFieldHeader: @"Sightings Information"},
             @{FXFormFieldKey: @"surveyTime", FXFormFieldType: FXFormFieldTypeTime,FXFormFieldPlaceholder: @"" },
             @{FXFormFieldKey: @"recordedBy", FXFormFieldDefaultValue: [GASettings getFullName]},
             @{FXFormFieldKey: @"notes", FXFormFieldType: FXFormFieldTypeLongText,FXFormFieldPlaceholder: @"" },
             
             @{FXFormFieldKey: @"locationNotes", FXFormFieldType: FXFormFieldTypeLongText, FXFormFieldPlaceholder: @"", FXFormFieldHeader: @"Location"},
             
             ];
    
    
}

//we're happy with the layout and properties of our login form, but we
//want to add an additional button field at the end, so
//we've used the extraFields method

- (NSArray *)extraFields
{
    return @[
             
             //this field doesn't correspond to any property of the form
             //it's just an action button. the action will be called on first
             //object in the responder chain that implements the submitForm
             //method, which in this case would be the AppDelegate
             
             @{FXFormFieldTitle: @"Submit", FXFormFieldHeader: @"", FXFormFieldAction: @"submitLoginForm"},
             
             ];
}

// hide these fields. they are autopopulated when a species is selected.
- (NSArray *) excludedFields{
    return @[
             @"scientificName",
             @"commonName",
             @"guid",
             ];
}

- (NSString *)speciesDisplayNameFieldDescription {
    return self.speciesDisplayName;
}

@end
