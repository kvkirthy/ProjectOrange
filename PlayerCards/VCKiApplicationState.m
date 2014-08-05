//
//  VCKiApplicationState.m
//  PlayerCards
//
//  Created by VenCKi on 8/5/14.
//  Copyright (c) 2014 VenCKi. All rights reserved.
//

#import "VCKiApplicationState.h"

@interface VCKiApplicationState()

@end

@implementation VCKiApplicationState

static NSMutableDictionary* values;

- (id)init
{
    if (!values) {
        values = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

-(void)addValue:(id)theValue :(NSString *)theKey
{
    [values setObject:theValue forKey:theKey];
}

-(id)getValueForKey:(NSString *)theKey
{
    return [values valueForKey:theKey];
}

@end
