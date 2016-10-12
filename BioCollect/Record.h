//
//  Record.h
//  Oz Atlas
//
//  Created by Varghese, Temi (PI, Black Mountain) on 12/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Record : NSObject {
    int _id;
    int numberOfInidividuals;
    
    NSString *recordId;
    NSString *scientificName;
    NSString *speciesDisplayName;
    NSString *commonName;
    NSString *guid;
    NSString *lsid;
    NSString *lastUpdated;
    NSString *notes;
    
}

@property (nonatomic, assign) int _id;
@property (nonatomic, assign) int numberOfInidividuals;
@property (nonatomic, strong) NSString * recordId;
@property (nonatomic, strong) NSString * scientificName;
@property (nonatomic, strong) NSString * speciesDisplayName;
@property (nonatomic, strong) NSString * commonName;
@property (nonatomic, strong) NSString * guid;
@property (nonatomic, strong) NSString * lsid;
@property (nonatomic, strong) NSString *lastUpdated;
@property (nonatomic, strong) NSString *notes;

@end

/* Record_h */
