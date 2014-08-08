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
#import "VCKiFinalResultViewController.h"
#import <Social/Social.h>

@interface VCKiPlayResultViewController ()
@property BOOL _hasPrimaryPlayerWon;
@end

@implementation VCKiPlayResultViewController

VCKiPlayerRecordReader* player;
VCKiPlayScreenViewCtrl *playscreen;
NSString *facebookMessage;

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
    
    UIImage* image = [UIImage imageNamed:self.primaryPlayerPictureName];
    if(!image){
        image = [UIImage imageNamed:@"avatar.jpg"];
    }
     self.primaryPlayerPicture.image = image;
    
    image = [UIImage imageNamed:self.secondaryPlayerPictureName];
    if(!image){
        image = [UIImage imageNamed:@"avatar.jpg"];
    }
    self.secondaryPlayerPicture.image = image;
    
    player = [[VCKiPlayerRecordReader alloc]init];
    if(!self.comparisionOperator){
        self.comparisionOperator = @">";
    }
    playscreen = (VCKiPlayScreenViewCtrl *)[self presentingViewController];
    
    if(self.primaryStatValue == self.secondaryStatValue){
        self.winnerMessage.text = [NSString stringWithFormat:@"About %@, %@ drew with %@.", self.statCaption,self.secondaryPlayerName, playscreen.fullName.text];
        facebookMessage = @"Huh !!!";
        self.primaryPlayerWinLossMessage.text = @"Players stay as is! No body moves!!!";
        self.playerScores.text = [NSString stringWithFormat:@"%@ and %@ both have %@ %lu.", playscreen.fullName.text, self.secondaryPlayerName, self.statCaption, (unsigned long)self.secondaryStatValue ];

    }
    else if ((self.primaryStatValue > self.secondaryStatValue && [self.comparisionOperator isEqualToString:@">"]) || (self.primaryStatValue < self.secondaryStatValue && [self.comparisionOperator isEqualToString:@"<"])){
        if([player moveSecondaryPlayerToPrimary:self.secondaryPlayerIndex]){
            self.winnerMessage.text = [NSString stringWithFormat:@"About %@, %@ wins over %@.", self.statCaption,playscreen.fullName.text, self.secondaryPlayerName];
            facebookMessage = @"I Won!";
            self.primaryPlayerWinLossMessage.text = @"You won over the player!";
            self.playerScores.text = [NSString stringWithFormat:@"%@ %@ is %lu. And for %@ it's %lu",self.statCaption,playscreen.fullName.text, (unsigned long)self.primaryStatValue, self.secondaryPlayerName, (unsigned long)self.secondaryStatValue ];
        }
    }
    else {
        if([player movePrimaryPlayerToSecondary:self.primaryPlayerIndex]){
            self.winnerMessage.text = [NSString stringWithFormat:@"About %@, %@ wins over %@.", self.statCaption,self.secondaryPlayerName, playscreen.fullName.text];
            facebookMessage = @"Aghhh :(";
            self.primaryPlayerWinLossMessage.text = @"You lost the player!";
            self.playerScores.text = [NSString stringWithFormat:@"%@ %@ is %lu. And for %@ it's %lu",self.statCaption,playscreen.fullName.text, (unsigned long)self.primaryStatValue, self.secondaryPlayerName, (unsigned long)self.secondaryStatValue ];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier  isEqual: @"finalResultSegue"]) {
        VCKiFinalResultViewController* finalScreen = [segue destinationViewController];
        finalScreen.isPrimaryPlayerWon = self._hasPrimaryPlayerWon;
    }
   
}

- (IBAction)buttonPlayOnClicked:(id)sender {
    
    if(player.playerSquadCount <= 0){
        self._hasPrimaryPlayerWon = NO;
        [self performSegueWithIdentifier:@"finalResultSegue" sender:self];

    }
    else if(player.oppositionSquadCount <= 0){
        self._hasPrimaryPlayerWon = YES;
        [self performSegueWithIdentifier:@"finalResultSegue" sender:self];

    }
    else{      
        [self.previousVcReference returnToViewController];
    }
    
}

- (IBAction)facebookClicked:(id)sender {
        SLComposeViewController *facebookDialog = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookDialog setInitialText:[NSString stringWithFormat:@"%@ %@ %@. #BreakARecord iOS game on Cricket stats.", facebookMessage, self.winnerMessage.text, self.playerScores.text]];
        [self presentViewController:facebookDialog animated:YES completion:nil];

}

- (IBAction)twitterClicked:(id)sender {
        SLComposeViewController *twitterDialog = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitterDialog setInitialText:[NSString stringWithFormat:@"%@ %@ #BreakARecord", facebookMessage, self.playerScores.text]];
        [self presentViewController:twitterDialog animated:YES completion:nil];
}


- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0.75];
    [UIView commitAnimations];
}

-(void) bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

@end
