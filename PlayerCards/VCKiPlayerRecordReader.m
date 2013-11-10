//
//  VCKiPlayerRecordReader.m
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiPlayerRecordReader.h"
#import "VCKiPlayerEntity.h"

@implementation VCKiPlayerRecordReader

@synthesize primarySquad = _primarySquad;
@synthesize secondSquad = _secondSquad;

const int squadBeginCount = 5;

static NSArray* availablePlayers = nil;
static NSString* _resourcePath = nil;
static NSDictionary* _playerDataCollection = nil;

-(VCKiPlayerEntity *)getNextSecondaryPlayer
{
    if (_secondSquad.count <= 0) {
        return nil;
    }
    
    VCKiPlayerEntity *returnData = [_secondSquad objectAtIndex: 0];
    [_secondSquad removeObjectAtIndex:0];
    [_secondSquad addObject:returnData];
    
    return returnData;
}

-(VCKiPlayerEntity *)getNextPrimaryPlayer
{
    if (_primarySquad.count <= 0) {
        return nil;
    }
    
    VCKiPlayerEntity *returnData = [_primarySquad objectAtIndex: 0];
    [_primarySquad removeObjectAtIndex:0];
    [_primarySquad addObject:returnData];
    
    return returnData;
}

- (id) init{
    self = [super init];
    
    _resourcePath = [[NSBundle mainBundle] pathForResource:@"playerData" ofType:@"plist"];
    _playerDataCollection  = [[NSDictionary alloc]initWithContentsOfFile:_resourcePath];
    
    if(!_primarySquad){
        _primarySquad = [[NSMutableArray alloc]init];
    }
    
    if(!_secondSquad){
        _secondSquad = [[NSMutableArray alloc]init];
    }
    
    availablePlayers =  [_playerDataCollection allKeys];
    [self createSquad];
    
    return self;
    
}

- (void) createSquad
{
    NSMutableSet* allSquadData = [[NSMutableSet alloc]init];
    while ([allSquadData count] < squadBeginCount * 2) {
        [allSquadData addObject: [NSString stringWithFormat:@"%d", arc4random_uniform([availablePlayers count])]];
    }
    
    NSArray* ps = [allSquadData allObjects];
    int i;
    
    for(i=0; i< [ps count]/2; i++){
        NSString* playerIndex = [ps objectAtIndex:i];
        VCKiPlayerEntity *player =[self getPlayerRecordWithIndex:  playerIndex];
        [_primarySquad addObject: player];
    }
    
    
    for(; i< [ps count]; i++){
        [_secondSquad addObject:[self getPlayerRecordWithIndex:  [ps objectAtIndex:i]]];
    }
    
   
}

- (VCKiPlayerEntity *) getPlayerRecordWithIndex: (NSString *) indexValue
{
    NSDictionary *playerDataCollection = [_playerDataCollection objectForKey:indexValue];
    return [[VCKiPlayerEntity alloc]initWithDictionaryObject:playerDataCollection];
    
}

@end
