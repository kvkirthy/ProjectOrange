//
//  VCKiPlayerRecordReader.h
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCKiPlayerEntity.h"

@interface VCKiPlayerRecordReader : NSObject

@property int playerSquadCount;

- (VCKiPlayerEntity *) getNextPrimaryPlayer;
- (VCKiPlayerEntity *) getNextSecondaryPlayer;
- (VCKiPlayerEntity *) getPlayerRecordWithIndex: (NSString *) indexValue;

@end
