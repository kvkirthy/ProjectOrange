//
//  VCKiPlayScreenViewCtrl.m
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "stdlib.h"
#import "VCKiPlayScreenViewCtrl.h"
#import "VCKiPlayerEntity.h"
#import "VCKiPlayerRecordReader.h"
#import "VCKiConfirmBetScreenViewCtrl.h"
#import "VCKiPlayResultViewController.h"

@interface VCKiPlayScreenViewCtrl (){
    
    NSString* _givenPlayerStatCaption;
    double _givenPlayerStatValue;
    double _secondPlayerStatValue;
    VCKiPlayerEntity *_secondPlayer;
    NSUInteger _primaryPlayerIndex;
    NSUInteger _secondaryPlayerIndex;
}
@end

@implementation VCKiPlayScreenViewCtrl



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
    
#warning All code should have null checks like span.
    
    //NSUInteger randomNumber = arc4random() % 11;
	
    //VCKiPlayerEntity *player = [ [[VCKiPlayerRecordReader alloc]init] getPlayerRecordWithIndex:[NSString stringWithFormat:@"%d",randomNumber]];
    
    VCKiPlayerRecordReader* recordReader = [[VCKiPlayerRecordReader alloc]init];
    VCKiPlayerEntity *player = [recordReader getRandomPrimaryPlayer: &_primaryPlayerIndex];
    _secondPlayer = [recordReader getRandomSecondaryPlayer: &_secondaryPlayerIndex];

    self.playerCount.text = [NSString stringWithFormat:@"%d", recordReader.playerSquadCount];

    self.oppositionCount.text = [NSString stringWithFormat:@"%d", recordReader.oppositionSquadCount];
    
    self.fullName.text = player.fullName;
    self.teamName.text = [NSString stringWithFormat:@"National Team - %@", player.team];
    
    if(player.span){
        self.span.text = [NSString stringWithFormat:@"( %@ )", player.span];
    }else{
        self.span.text = @"";
    }
    
    self.playerImage.image = [UIImage imageNamed:player.playerPicture];
    
    [self.testMatches setTitle:[NSString stringWithFormat:@"%d", player.numberOfTests] forState:UIControlStateNormal];
    [self.testRuns setTitle:[NSString stringWithFormat:@"%d", player.totalTestRuns] forState:UIControlStateNormal];
    [self.testWickets setTitle:[NSString stringWithFormat:@"%d", player.totalTestWickets] forState:UIControlStateNormal];
    
    [self.oDIMatches setTitle:[NSString stringWithFormat:@"%d", player.numberOfODIs] forState:UIControlStateNormal];
    [self.oDIRuns setTitle:[NSString stringWithFormat:@"%d", player.totalODIRuns] forState:UIControlStateNormal];
    [self.oDIWickets setTitle: [NSString stringWithFormat:@"%d", player.totalODIWickets] forState:UIControlStateNormal];
    
    [self.t20Matches setTitle:[NSString stringWithFormat:@"%d", player.numberOfT20s] forState: UIControlStateNormal] ;
    [self.t20Runs setTitle: [NSString stringWithFormat:@"%d", player.totalT20Runs] forState:UIControlStateNormal];
    [self.t20Wickets setTitle:[NSString stringWithFormat:@"%d", player.totalT20Wickets] forState: UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier  isEqual: @"goToConfirmScreen"]){
        VCKiConfirmBetScreenViewCtrl *confirmVc = [segue destinationViewController];
        confirmVc.givenPlayerStatCaption = _givenPlayerStatCaption;
        
        confirmVc.playerImage.image = self.playerImage.image;
        
#warning TODO: .00 doesn't make sense for some and does for someother. Need to think through.
        
        confirmVc.givenPlayerStatValue = [[NSString alloc]initWithFormat:@"%f", _givenPlayerStatValue];
    }
    else if([segue.identifier isEqual:@"playStatusSegue"])
    {
        VCKiPlayResultViewController *resultVc = [segue destinationViewController];
        resultVc.primaryStatValue = _givenPlayerStatValue;
        resultVc.secondaryStatValue = _secondPlayerStatValue;
        resultVc.statCaption = _givenPlayerStatCaption;
        resultVc.secondaryPlayerName = _secondPlayer.fullName;
        resultVc.primaryPlayerPicture.image = self.playerImage.image;
        resultVc.secondaryPlayerPicture.image = [UIImage imageNamed:_secondPlayer.playerPicture];
        resultVc.primaryPlayerIndex = _primaryPlayerIndex;
        resultVc.secondaryPlayerIndex = _secondaryPlayerIndex;
        
        
    }
}

- (IBAction)testRunBet:(id)sender {
    _givenPlayerStatCaption = self.testRunsCaption.text;
    _givenPlayerStatValue = [self.testRuns.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.totalTestRuns ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}
@end
