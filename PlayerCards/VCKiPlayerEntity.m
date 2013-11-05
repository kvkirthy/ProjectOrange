//
//  VCKiPlayerEntity.m
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiPlayerEntity.h"

@implementation VCKiPlayerEntity

-(id) initWithDictionaryObject:(NSDictionary *)dictionaryObject
{
    self  = [super init];
    
    self.fullName = [dictionaryObject objectForKey:@"fullName"];
    self.team = [dictionaryObject objectForKey:@"team"];
    self.tip1 =[dictionaryObject objectForKey:@"tip1"];
    self.playerPicture = [dictionaryObject objectForKey:@"playerPictureResName"];

    self.numberOfTests = [[dictionaryObject objectForKey:@"numberOfTests"] unsignedIntegerValue];
    self.totalTestRuns =[[dictionaryObject objectForKey:@"totalTestRuns"] unsignedIntegerValue];
    self.totalTestWickets =[[dictionaryObject objectForKey:@"totalTestWickets"] unsignedIntegerValue];
    
    self.numberOfODIs = [[dictionaryObject objectForKey:@"numberOfODIs"] unsignedIntegerValue];
    self.totalODIRuns =[[dictionaryObject objectForKey:@"totalODIRuns"] unsignedIntegerValue];
    self.totalODIWickets =[[dictionaryObject objectForKey:@"totalODIWickets"] unsignedIntegerValue];
    
    self.numberOfT20s = [[dictionaryObject objectForKey:@"numberOfT20s"] unsignedIntegerValue];
    self.totalT20Runs =[[dictionaryObject objectForKey:@"totalT20Runs"] unsignedIntegerValue];
    self.totalT20Wickets =[[dictionaryObject objectForKey:@"totalT20Wickets"] unsignedIntegerValue];
    return self;
}

@end
