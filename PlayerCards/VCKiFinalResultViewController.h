//
//  VCKiFinalResultViewController.h
//  PlayerCards
//
//  Created by VenCKi on 11/14/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCKiFinalResultViewController : UIViewController

@property BOOL isPrimaryPlayerWon;
@property (weak, nonatomic) IBOutlet UILabel *finalResultMessage;

@end
