//
//  RecordForm.m
//  Oz Atlas
//
//  Created by Sathish Babu Sathyamoorthy on 19/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "RecordForm.h"

@implementation RecordForm

//let's make the email field's title red, just because we can

- (NSDictionary *)recordedBy
{
    return @{@"textLabel.color": [UIColor redColor]};
}

- (NSDictionary *)notes
{
    return @{@"textLabel.color": [UIColor redColor]};
}
- (NSArray *)fields
{
    return @[

             @{FXFormFieldKey: @"speciesName", FXFormFieldHeader: @"Species Information"},
             @"speciesPhoto",
             @"confident",

             @{FXFormFieldKey: @"surveyDate", FXFormFieldHeader: @"Sightings Information"},
             @{FXFormFieldKey: @"surveyTime", FXFormFieldType: FXFormFieldTypeTime,FXFormFieldPlaceholder: @"", },
             @"recordedBy",
             @{FXFormFieldKey: @"identificationTags",
               FXFormFieldOptions: @[@"Amphibians", @"Amphibians, Australian Ground Frogs", @"Birds"]},
             @{FXFormFieldKey: @"notes", FXFormFieldType: FXFormFieldTypeLongText,FXFormFieldPlaceholder: @"", },
             
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

@end
