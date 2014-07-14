//
//  VCKiPlayerEntity.h
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCKiPlayerEntity : NSObject

@property (atomic) NSString *fullName;
@property (atomic) NSString *team;
@property (atomic) NSString *span;
@property (atomic) NSString *playerPicture;
@property (atomic) NSUInteger numberOfTests;
@property (atomic) NSUInteger totalTestRuns;
@property (atomic) NSString *totalTestWickets;
@property (atomic) NSUInteger numberOfODIs;
@property (atomic) NSUInteger totalODIRuns;
@property (atomic) NSString *totalODIWickets;
@property (atomic) NSUInteger numberOfT20s;
@property (atomic) NSUInteger totalT20Runs;
@property (atomic) NSString *totalT20Wickets;
@property (atomic) NSString *tip1;
@property (atomic) NSString* testHighScore;
@property (atomic) NSString* odiHighScore;
@property (atomic) NSString* t20HighScore;
@property (atomic) NSUInteger testCenturiesCount;
@property (atomic) NSUInteger odiCenturiesCount;
@property (atomic) NSUInteger t20CenturiesCount;

-(id) initWithDictionaryObject: (NSDictionary *) dictionaryObject;

@end
