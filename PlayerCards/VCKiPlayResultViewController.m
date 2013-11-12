//
//  VCKiPlayResultViewController.m
//  PlayerCards
//
//  Created by VenCKi on 11/10/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiPlayResultViewController.h"
#import "VCKiPlayScreenViewCtrl.h"
#import "VCKiPlayerRecordReader.h"

@interface VCKiPlayResultViewController ()

@end

@implementation VCKiPlayResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    VCKiPlayerRecordReader* player = [[VCKiPlayerRecordReader alloc]init];
    
    VCKiPlayScreenViewCtrl *playscreen = (VCKiPlayScreenViewCtrl *)[self presentingViewController];
    
    if(self.primaryStatValue == self.secondaryStatValue){
        self.winnerMessage.text = [NSString stringWithFormat:@"About %@, %@ drew with %@.", self.statCaption,self.secondaryPlayerName, playscreen.fullName.text];
        self.primaryPlayerWinLossMessage.text = @"Players stay as is! No body moves!!!";
        self.playerScores.text = [NSString stringWithFormat:@"%@ and %@ both have %@ %f.", playscreen.fullName.text, self.secondaryPlayerName, self.statCaption, self.secondaryStatValue ];

    }
    else if (self.primaryStatValue > self.secondaryStatValue){
        if([player moveSecondaryPlayerToPrimary:self.secondaryPlayerIndex]){
            self.winnerMessage.text = [NSString stringWithFormat:@"About %@, %@ wins over %@.", self.statCaption,playscreen.fullName.text, self.secondaryPlayerName];
            self.primaryPlayerWinLossMessage.text = @"You won over the player!";
            self.playerScores.text = [NSString stringWithFormat:@"%@ %@ is %f. And for %@ it's %f",self.statCaption,playscreen.fullName.text, self.primaryStatValue, self.secondaryPlayerName, self.secondaryStatValue ];
        }
    }
    else {
        if([player movePrimaryPlayerToSecondary:self.primaryPlayerIndex]){
            self.winnerMessage.text = [NSString stringWithFormat:@"About %@, %@ wins over %@.", self.statCaption,self.secondaryPlayerName, playscreen.fullName.text];
            self.primaryPlayerWinLossMessage.text = @"You lost the player!";
            self.playerScores.text = [NSString stringWithFormat:@"%@ %@ is %f. And for %@ it's %f",self.statCaption,playscreen.fullName.text, self.primaryStatValue, self.secondaryPlayerName, self.secondaryStatValue ];
        }
    }
    
    
    
    //
    //playscreen.fullName.text
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
