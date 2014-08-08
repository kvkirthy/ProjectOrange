//
//  VCKiPlayResultViewController.h
//  PlayerCards
//
//  Created by VenCKi on 11/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface VCKiPlayResultViewController : UIViewController<ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *primaryPlayerPicture;
@property (weak, nonatomic) IBOutlet UIImageView *secondaryPlayerPicture;
@property (weak, nonatomic) IBOutlet UILabel *winnerMessage;
@property (weak, nonatomic) IBOutlet UILabel *primaryPlayerWinLossMessage;
@property (weak, nonatomic) IBOutlet UILabel *playerScores;

@property NSString* primaryPlayerPictureName;
@property NSString* secondaryPlayerPictureName;
@property NSString* comparisionOperator;
@property NSUInteger primaryPlayerIndex;
@property NSUInteger secondaryPlayerIndex;
@property NSString* statCaption;
@property double primaryStatValue;
@property NSString* secondaryPlayerName;
@property double secondaryStatValue;
@property id previousVcReference;

- (IBAction)buttonPlayOnClicked:(id)sender;
- (IBAction)facebookClicked:(id)sender;
- (IBAction)twitterClicked:(id)sender;

@end
