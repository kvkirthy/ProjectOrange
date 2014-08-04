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

static NSMutableArray* _primarySquad;
static NSMutableArray* _secondSquad;

const int squadBeginCount = 24;

static NSArray* availablePlayers = nil;
static NSString* _resourcePath = nil;
static NSDictionary* _playerDataCollection = nil;

- (void)resetSquads
{
    _primarySquad = nil;
    _secondSquad = nil;
}

-(VCKiPlayerEntity *) getRandomPrimaryPlayer: (NSUInteger *) refPlayerIndex
{
    if (_primarySquad && _primarySquad.count > 0) {
       *refPlayerIndex = arc4random_uniform([_primarySquad count]);
       return [_primarySquad objectAtIndex: *refPlayerIndex];
    }

    return nil;
}

-(VCKiPlayerEntity *) getRandomSecondaryPlayer: (NSUInteger *) refPlayerIndex
{
    if (_secondSquad && _secondSquad.count > 0) {
        *refPlayerIndex = arc4random_uniform([_secondSquad count]);
        return [_secondSquad objectAtIndex: *refPlayerIndex];
    }
    
    return nil;
}

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

-(BOOL)movePrimaryPlayerToSecondary:(NSUInteger )player{
    if (_primarySquad && _primarySquad.count > 0) {
        [_secondSquad addObject: [_primarySquad objectAtIndex:player]];
        [_primarySquad removeObjectAtIndex:player];
        
        self.playerSquadCount = _primarySquad.count;
        self.oppositionSquadCount = _secondSquad.count;
        
        return YES;
    }
    
    return NO;
}

-(BOOL) moveSecondaryPlayerToPrimary:(NSUInteger ) player{
    if (_secondSquad && _secondSquad.count > 0) {
        [_primarySquad addObject:[_secondSquad objectAtIndex:player]];
        [_secondSquad removeObjectAtIndex:player];
        
        self.playerSquadCount = _primarySquad.count;
        self.oppositionSquadCount = _secondSquad.count;
        
        return YES;
    }
    
    return NO;
}

- (id) init{
    self = [super init];
    
    [self createSquad];
    
    return self;
    
}

- (void) createSquad
{
    if(!_primarySquad){
        _primarySquad = [[NSMutableArray alloc]init];
    }
    
    if(!_secondSquad){
        _secondSquad = [[NSMutableArray alloc]init];
    }
    
    if ([_primarySquad count] <= 0 && [_secondSquad count] <=0) {
        
        _resourcePath = [[NSBundle mainBundle] pathForResource:@"playerData" ofType:@"plist"];
        _playerDataCollection  = [[NSDictionary alloc]initWithContentsOfFile:_resourcePath];
        
        availablePlayers =  [_playerDataCollection allKeys];
        
        NSMutableSet* allSquadData = [[NSMutableSet alloc]init];
        
        while ([allSquadData count] < squadBeginCount * 2) {
            [allSquadData addObject: [NSString stringWithFormat:@"%d", arc4random_uniform([availablePlayers count])]];
        }
        
        NSArray* ps = [allSquadData allObjects];
        int i;
        
        for(i=0; i< [ps count]/2; i++){
            NSString* playerIndex = [ps objectAtIndex:i];
            //NSLog(playerIndex);
            VCKiPlayerEntity *player =[self getPlayerRecordWithIndex:  playerIndex];
            [_primarySquad addObject: player];
        }
        
        for(; i< [ps count]; i++){
            [_secondSquad addObject:[self getPlayerRecordWithIndex:  [ps objectAtIndex:i]]];
        }
    }
    self.playerSquadCount = _primarySquad.count;
    self.oppositionSquadCount = _secondSquad.count;
   
}

- (VCKiPlayerEntity *) getPlayerRecordWithIndex: (NSString *) indexValue
{
    NSDictionary *playerDataCollection = [_playerDataCollection objectForKey:indexValue];
    return [[VCKiPlayerEntity alloc]initWithDictionaryObject:playerDataCollection];
    
}

@end
