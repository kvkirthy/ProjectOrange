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
    
    
    id span = [dictionaryObject objectForKey:@"span"];
    if(span){
        self.span = span;
    }else{
        self.span = @"";
    }

    self.numberOfTests = [[dictionaryObject objectForKey:@"numberOfTests"] unsignedIntegerValue];
    self.totalTestRuns =[[dictionaryObject objectForKey:@"totalTestRuns"] unsignedIntegerValue];
    self.totalTestWickets =[dictionaryObject objectForKey:@"totalTestWickets"];
    
    self.numberOfODIs = [[dictionaryObject objectForKey:@"numberOfODIs"] unsignedIntegerValue];
    self.totalODIRuns =[[dictionaryObject objectForKey:@"totalODIRuns"] unsignedIntegerValue];
    self.totalODIWickets =[dictionaryObject objectForKey:@"totalODIWickets"];
    
    self.numberOfT20s = [[dictionaryObject objectForKey:@"numberOfT20s"] unsignedIntegerValue];
    self.totalT20Runs =[[dictionaryObject objectForKey:@"totalT20Runs"] unsignedIntegerValue];
    self.totalT20Wickets =[dictionaryObject objectForKey:@"totalT20Wickets"];
    return self;
}

@end
