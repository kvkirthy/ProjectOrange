//
//  VCKiManualPageContentSerializer.m
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiManualPageContentSerializer.h"

@implementation VCKiManualPageContentSerializer

static VCKiManualPageContentSerializer *_sharedObject = nil;

@synthesize page1 = _page1;
@synthesize page2 = _page2;
@synthesize page3 = _page3;
@synthesize page4 = _page4;


-(id)init
{
    self = [super init];
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"manualPages" ofType:@"plist"];
    NSDictionary *pageCollection = [[NSDictionary alloc]initWithContentsOfFile:resourcePath];
    
    _page1 = [pageCollection objectForKey:@"page1"];
    _page2 = [pageCollection objectForKey:@"page2"];
    _page3 = [pageCollection objectForKey:@"page3"];
    _page4 = [pageCollection objectForKey:@"page4"];
    
    return self;
}

+(id)alloc
{
    @synchronized([VCKiManualPageContentSerializer class]){
        _sharedObject = [super alloc];
        return _sharedObject;
    }
    
    return nil;
}

+(VCKiManualPageContentSerializer *) getSingletonObject
{
    @synchronized([VCKiManualPageContentSerializer class])
    {
        if(!_sharedObject){
            _sharedObject = [[self alloc]init];
        }
        
        return _sharedObject;
    }
}

@end
