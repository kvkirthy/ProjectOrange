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
@property (atomic) NSString *playerPicture;
@property (atomic) NSUInteger numberOfTests;
@property (atomic) NSUInteger totalTestRuns;
@property (atomic) NSUInteger totalTestWickets;
@property (atomic) NSUInteger numberOfODIs;
@property (atomic) NSUInteger totalODIRuns;
@property (atomic) NSUInteger totalODIWickets;
@property (atomic) NSUInteger numberOfT20s;
@property (atomic) NSUInteger totalT20Runs;
@property (atomic) NSUInteger totalT20Wickets;
@property (atomic) NSString *tip1;

-(id) initWithDictionaryObject: (NSDictionary *) dictionaryObject;

@end
