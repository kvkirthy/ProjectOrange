//
//  VCKiConfirmBetScreenViewCtrl.h
//  PlayerCards
//
//  Created by VenCKi on 10/13/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCKiConfirmBetScreenViewCtrl : UIViewController

@property NSString* givenPlayerStatCaption;
@property NSString* givenPlayerStatValue;
@property (weak, nonatomic) IBOutlet UILabel *playerName;
@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
@property (weak, nonatomic) IBOutlet UILabel *betCaption;

- (IBAction)continueClicked:(id)sender;

@end
