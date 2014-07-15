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

@interface VCKiPlayResultViewController ()
@property BOOL _hasPrimaryPlayerWon;
@end

@implementation VCKiPlayResultViewController

VCKiPlayerRecordReader* player;
VCKiPlayScreenViewCtrl *playscreen;

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
    
    #warning "rounded corners not applied"
    self.primaryPlayerPicture.layer.cornerRadius = 10;
    self.secondaryPlayerPicture.layer.cornerRadius = 10;
    
    player = [[VCKiPlayerRecordReader alloc]init];
    if(!self.comparisionOperator){
        self.comparisionOperator = @">";
    }
    playscreen = (VCKiPlayScreenViewCtrl *)[self presentingViewController];
    
    if(self.primaryStatValue == self.secondaryStatValue){
        self.winnerMessage.text = [NSString stringWithFormat:@"About %@, %@ drew with %@.", self.statCaption,self.secondaryPlayerName, playscreen.fullName.text];
        self.primaryPlayerWinLossMessage.text = @"Players stay as is! No body moves!!!";
        self.playerScores.text = [NSString stringWithFormat:@"%@ and %@ both have %@ %lu.", playscreen.fullName.text, self.secondaryPlayerName, self.statCaption, (unsigned long)self.secondaryStatValue ];

    }
    else if ((self.primaryStatValue > self.secondaryStatValue && [self.comparisionOperator isEqualToString:@">"]) || (self.primaryStatValue < self.secondaryStatValue && [self.comparisionOperator isEqualToString:@"<"])){
        if([player moveSecondaryPlayerToPrimary:self.secondaryPlayerIndex]){
            self.winnerMessage.text = [NSString stringWithFormat:@"About %@, %@ wins over %@.", self.statCaption,playscreen.fullName.text, self.secondaryPlayerName];
            self.primaryPlayerWinLossMessage.text = @"You won over the player!";
            self.playerScores.text = [NSString stringWithFormat:@"%@ %@ is %lu. And for %@ it's %lu",self.statCaption,playscreen.fullName.text, (unsigned long)self.primaryStatValue, self.secondaryPlayerName, (unsigned long)self.secondaryStatValue ];
        }
    }
    else {
        if([player movePrimaryPlayerToSecondary:self.primaryPlayerIndex]){
            self.winnerMessage.text = [NSString stringWithFormat:@"About %@, %@ wins over %@.", self.statCaption,self.secondaryPlayerName, playscreen.fullName.text];
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
        [self performSegueWithIdentifier:@"finalResultSegue" sender:self];
        self._hasPrimaryPlayerWon = NO;
    }
    else if(player.oppositionSquadCount <= 0){
        [self performSegueWithIdentifier:@"finalResultSegue" sender:self];
        self._hasPrimaryPlayerWon = YES;
    }
    else{      
        [self.previousVcReference returnToViewController];
    }
    
   
}
@end
