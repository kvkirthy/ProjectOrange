//
//  VCKiPlayerRecordReader.m
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiPlayerRecordReader.h"
#import "VCKiPlayerEntity.h"

#warning null record scenario fix required. One of the record turns up to be all null

@interface VCKiPlayerEntity()
-(void) createPrimarySquad;
-(void) createSecondarySquad;

@end

@implementation VCKiPlayerRecordReader

static NSMutableArray* _primarySquad;
static NSMutableArray* _secondSquad;

const int squadBeginCount = 50;

static NSMutableArray* availablePlayers = nil;
static NSMutableArray* availableNewbees = nil;
static NSString* _resourcePath = nil;
static NSMutableDictionary* _playerDataCollection = nil;
static NSMutableDictionary* _newbeeDataCollection = nil;

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
    _resourcePath = [[NSBundle mainBundle] pathForResource:@"playerData" ofType:@"plist"];
    _playerDataCollection  = [[NSMutableDictionary alloc]initWithContentsOfFile:_resourcePath];
    availablePlayers = [NSMutableArray arrayWithArray: [_playerDataCollection allKeys]];
    
    NSString* newbeesResourcePath = [[NSBundle mainBundle] pathForResource:@"newbees" ofType:@"plist"];
    _newbeeDataCollection =[[NSMutableDictionary alloc]initWithContentsOfFile:newbeesResourcePath];
    availableNewbees = [NSMutableArray arrayWithArray: [_newbeeDataCollection allKeys]];
  
    [self createPrimarySquad];
    [self createSecondarySquad];
   
}

- (VCKiPlayerEntity *) getPlayerRecordWithKey: (NSString *) keyValue fromCollection:(NSMutableDictionary *)playerList
{
    NSDictionary *playerDataCollection = [playerList objectForKey:keyValue];
    return [[VCKiPlayerEntity alloc]initWithDictionaryObject:playerDataCollection];
}

- (void)createPrimarySquad
{
    if(!_primarySquad){
        _primarySquad = [[NSMutableArray alloc]init];
    }
    
    if ([_primarySquad count] <= 0) {

        NSArray* primePlayers = generateAvailablePlayers(availablePlayers);
        NSArray* newbees = generateAvailablePlayers(availableNewbees);
        for(int i=0; i< [primePlayers count]; i++){
            NSString* playerKey = [primePlayers objectAtIndex:i];
            VCKiPlayerEntity *player =[self getPlayerRecordWithKey:  playerKey fromCollection:_playerDataCollection];
            [_primarySquad addObject: player];
            
            NSString* newbeeKey = [newbees objectAtIndex:i];
            if (newbeeKey) {
                VCKiPlayerEntity *playerNewbee =[self getPlayerRecordWithKey:  newbeeKey fromCollection:_newbeeDataCollection];
                [_primarySquad addObject: playerNewbee];
            }
        }

    }
    self.playerSquadCount = _primarySquad.count;
}

NSArray* generateAvailablePlayers(NSMutableArray* players)
{
    NSMutableSet* allSquadData = [[NSMutableSet alloc]init];
    
    while ([allSquadData count] < squadBeginCount/2) {
        NSString* randomPlayerKey = [NSString stringWithFormat:@"%@", [players objectAtIndex: arc4random_uniform([players count])]];
        [allSquadData addObject: randomPlayerKey];
        [players removeObject:randomPlayerKey];
    }
    
    return [allSquadData allObjects];
}


-(void) createSecondarySquad
{
    if(!_secondSquad){
        _secondSquad = [[NSMutableArray alloc]init];
    }
    
    if ([_secondSquad count] <=0) {
        NSMutableSet* allSquadData = [[NSMutableSet alloc]init];
        
        while ([allSquadData count] < squadBeginCount) {
            NSString* randomPlayerKey = [NSString stringWithFormat:@"%@", [availablePlayers objectAtIndex: arc4random_uniform([availablePlayers count])]];
            [allSquadData addObject: randomPlayerKey];
            [availablePlayers removeObject:randomPlayerKey];
        }
        NSArray* ps = [allSquadData allObjects];
        int i;
        
        for(i=0; i< [ps count]; i++){
            NSString* playerIndex = [ps objectAtIndex:i];
            VCKiPlayerEntity *player =[self getPlayerRecordWithKey:  playerIndex fromCollection:_playerDataCollection];
            [_secondSquad addObject: player];
        }
    }
    self.oppositionSquadCount = _secondSquad.count;
}

@end
