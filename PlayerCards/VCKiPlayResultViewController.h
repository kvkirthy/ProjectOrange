//
//  VCKiPlayResultViewController.h
//  PlayerCards
//
//  Created by VenCKi on 11/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCKiPlayResultViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *primaryPlayerPicture;
@property (weak, nonatomic) IBOutlet UIImageView *secondaryPlayerPicture;
@property (weak, nonatomic) IBOutlet UILabel *winnerMessage;
@property (weak, nonatomic) IBOutlet UILabel *primaryPlayerWinLossMessage;
@property (weak, nonatomic) IBOutlet UILabel *playerScores;

@property NSUInteger primaryPlayerIndex;
@property NSUInteger secondaryPlayerIndex;
@property NSString* statCaption;
@property double primaryStatValue;
@property NSString* secondaryPlayerName;
@property double secondaryStatValue;

@end
