//
//  VCKiManualPageContentSerializer.h
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCKiManualPageContentSerializer : NSObject

@property (atomic) NSString *page1;
@property (atomic) NSString *page2;
@property (atomic) NSString *page3;
@property (atomic) NSString *page4;

+(VCKiManualPageContentSerializer *) getSingletonObject;

@end
