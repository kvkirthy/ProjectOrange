//
//  VCKiApplicationState.h
//  PlayerCards
//
//  Created by VenCKi on 8/5/14.
//  Copyright (c) 2014 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCKiApplicationState : NSObject

-(void) addValue: (id) theValue :(NSString* )theKey;
-(id) getValueForKey: (NSString*) theKey;

@end
