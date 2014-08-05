//
//  VCKiRootPageViewCtrl.h
//  PlayerCards
//
//  Created by VenCKi on 10/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCKiRootPageViewCtrl : UIPageViewController< UIPageViewControllerDataSource>
@property (nonatomic) NSMutableArray *allViewControllers;

-(void) resetAppHere;

@end
