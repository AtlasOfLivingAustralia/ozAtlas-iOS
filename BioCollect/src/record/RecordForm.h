//
//  RecordForm.h
//  Oz Atlas
//
//  Created by Sathish Babu Sathyamoorthy on 19/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//
#import <Foundation/Foundation.h>
#import "FXForms.h"


@interface RecordForm : NSObject <FXForm>

@property (nonatomic, copy) NSString *speciesDisplayName;
@property (nonatomic, copy) NSString *scientificName;
@property (nonatomic, copy) NSString *commonName;
@property (nonatomic, copy) NSString *guid;
@property (nonatomic, strong) NSDate *surveyDate;
@property (nonatomic, strong) NSDate *surveyTime;
@property (nonatomic, assign) BOOL confident;
@property (nonatomic, assign) NSUInteger howManySpecies;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic, assign) NSString *recordedBy;
@property (nonatomic, strong) UIImage *speciesPhoto;
@property (nonatomic, copy) NSArray *identificationTags;
@property (nonatomic, copy) NSString *locationNotes;
@end
