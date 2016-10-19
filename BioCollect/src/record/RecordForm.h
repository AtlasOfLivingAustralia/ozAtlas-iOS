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

@property (nonatomic, copy) NSString *speciesName;
@property (nonatomic, strong) NSDate *surveyDate;
@property (nonatomic, assign) BOOL confident;
@property (nonatomic, assign) NSUInteger howManySpecies;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic, copy) NSString *recordedBy;
@property (nonatomic, strong) UIImage *speciesPhoto;
@property (nonatomic, copy) NSArray *identificationTags;

@end
