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
    NSString* _comparisionOperator;
    VCKiPlayerEntity *_secondPlayer;
    NSUInteger _primaryPlayerIndex;
    NSUInteger _secondaryPlayerIndex;
}

-(void) renderPlayerData;
-(void) setButton: (UIButton*) button WithValue:(id) value;


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
    [self renderPlayerData];

}

-(void) renderPlayerData
{
    //NSUInteger randomNumber = arc4random() % 11;
	
    //VCKiPlayerEntity *player = [ [[VCKiPlayerRecordReader alloc]init] getPlayerRecordWithIndex:[NSString stringWithFormat:@"%d",randomNumber]];
    
    VCKiPlayerRecordReader* recordReader = [[VCKiPlayerRecordReader alloc]init];
    VCKiPlayerEntity* player = [recordReader getRandomPrimaryPlayer: &_primaryPlayerIndex];
    _secondPlayer = [recordReader getRandomSecondaryPlayer: &_secondaryPlayerIndex];
    
    self.playerCount.text = [NSString stringWithFormat:@"%d", recordReader.playerSquadCount];
    
    self.oppositionCount.text = [NSString stringWithFormat:@"%d", recordReader.oppositionSquadCount];
    
    self.fullName.text = player.fullName;
    self.teamName.text = [NSString stringWithFormat:@"National Team - %@", player.team];
    
#warning "some times span is coming up as big number"
    if(player.span){
        self.span.text = [NSString stringWithFormat:@"( %@ )", player.span];
    }else{
        self.span.text = @"";
    }
    
    if([UIImage imageNamed:player.fullName]){
        self.playerImage.image = [UIImage imageNamed:player.fullName];
    }
    
    [self setButton: self.testMatches WithValue:[NSNumber numberWithInt:player.numberOfTests]];
    [self setButton:self.testMatches WithValue:[NSNumber numberWithInt:player.numberOfTests]];
    [self setButton:self.testRuns WithValue:[NSNumber numberWithInt:player.totalTestRuns]];
    [self setButton:self.testWickets WithValue:player.totalTestWickets];
    [self setButton:self.testHighScore WithValue:player.testHighScore];
    [self setButton:self.testCenturies WithValue:[NSNumber numberWithInt:player.testCenturiesCount]];
    
    [self setButton: self.oDIMatches WithValue:[NSNumber numberWithInt:player.numberOfODIs]];
    [self setButton: self.oDIRuns WithValue:[NSNumber numberWithInt:player.totalODIRuns]];
    [self setButton: self.oDIWickets WithValue:player.totalODIWickets];
    [self setButton: self.odiHighScore WithValue:player.odiHighScore];
    [self setButton: self.odiCenturies WithValue:[NSNumber numberWithInt:player.odiCenturiesCount]];

    [self setButton: self.t20Matches WithValue:[NSNumber numberWithInt:player.numberOfT20s]];
    [self setButton: self.t20Runs WithValue:[NSNumber numberWithInt:player.totalT20Runs]];
    [self setButton: self.t20Wickets WithValue:player.totalT20Wickets];
    [self setButton: self.t20HighScore WithValue:player.t20HighScore];
    [self setButton: self.t20Centuries WithValue:[NSNumber numberWithInt:player.t20CenturiesCount]];
   
    _comparisionOperator = @">";
}

-(void) setButton:(UIButton *)button WithValue:(id)value
{
    [button setImage:nil forState:UIControlStateNormal];
    [button setTitle:nil forState:UIControlStateNormal];
    NSString* valueAsString = [NSString stringWithFormat:@"%@",value];

    if([valueAsString  isEqualToString: @"-"] || [valueAsString  isEqualToString: @"0"]){
        button.userInteractionEnabled = false;
        [button setImage:[UIImage imageNamed:@"51-outlet.png"] forState:UIControlStateNormal];
    }
    else{
        button.userInteractionEnabled = true;
        [button setTitle:[NSString stringWithFormat:@"%@", value] forState: UIControlStateNormal];
    }

}

-(void) returnToViewController
{
    [self renderPlayerData];
    [self dismissViewControllerAnimated:YES completion:nil];
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
        
        confirmVc.givenPlayerStatValue = [[NSString alloc]initWithFormat:@"%lu", (unsigned long)_givenPlayerStatValue];
    }
    else if([segue.identifier isEqual:@"playStatusSegue"])
    {
        VCKiPlayResultViewController *resultVc = [segue destinationViewController];
        resultVc.previousVcReference = self;
        resultVc.primaryStatValue = _givenPlayerStatValue;
        resultVc.secondaryStatValue = _secondPlayerStatValue;
        resultVc.statCaption = _givenPlayerStatCaption;
        resultVc.secondaryPlayerName = _secondPlayer.fullName;
        resultVc.primaryPlayerPicture.image = self.playerImage.image;
        resultVc.secondaryPlayerPicture.image = [UIImage imageNamed:_secondPlayer.playerPicture];
        resultVc.primaryPlayerIndex = _primaryPlayerIndex;
        resultVc.secondaryPlayerIndex = _secondaryPlayerIndex;
        resultVc.comparisionOperator = _comparisionOperator;
    }
}

- (IBAction)testRunBet:(id)sender {
    
    if(self.testRuns.titleLabel.text && [self.testRuns.titleLabel.text isEqualToString:@"-"])
    {
        return;
    }
    
    _givenPlayerStatCaption = self.testRunsCaption.text;
    _givenPlayerStatValue = [self.testRuns.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.totalTestRuns ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

- (IBAction)odiRunBet:(id)sender {
    
    if(self.oDIRuns.titleLabel.text && [self.oDIRuns.titleLabel.text isEqualToString:@"-"]){
        return;
    }
    
    _givenPlayerStatCaption = self.odiRunsCaption.text;
    _givenPlayerStatValue = [self.oDIRuns.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.totalODIRuns ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
    
}

- (IBAction)t20RunBet:(id)sender {
    if (self.t20Runs.titleLabel.text && [self.t20Runs.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.t20RunsCaption.text;
    _givenPlayerStatValue = [self.t20Runs.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.totalT20Runs ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

- (IBAction)testMatchesBet:(id)sender {
    if (self.testMatches.titleLabel.text && [self.testMatches.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.testMatchesCaption.text;
    _givenPlayerStatValue = [self.testMatches.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.numberOfTests ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

- (IBAction)odiMatchesBet:(id)sender {
    if (self.oDIMatches.titleLabel.text && [self.oDIMatches.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.odiMatchesCaption.text;
    _givenPlayerStatValue = [self.oDIMatches.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.numberOfODIs ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

- (IBAction)t20MatchesBet:(id)sender {
    if (self.t20Matches.titleLabel.text && [self.t20Matches.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.t20MatchesCaption.text;
    _givenPlayerStatValue = [self.t20Matches.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.numberOfT20s ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

- (IBAction)testWicketsBet:(id)sender {
    
    if (self.testWickets.titleLabel.text && [self.testWickets.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    
    _givenPlayerStatCaption = self.testWicketsCaption.text;
    
    NSString *givePlayerStat = [self.testWickets.titleLabel.text componentsSeparatedByString:@"/"][0];
    NSString *secondPlayerStat = [_secondPlayer.totalTestWickets componentsSeparatedByString:@"/"][0];
    
    if ([givePlayerStat  isEqual: @"-"] && [secondPlayerStat isEqual: @"-"]) {
        return;
    }
    
    _givenPlayerStatValue = [givePlayerStat doubleValue];
    _secondPlayerStatValue = [secondPlayerStat doubleValue];
    
    if (_givenPlayerStatValue == _secondPlayerStatValue) {
        givePlayerStat = [self.testWickets.titleLabel.text componentsSeparatedByString:@"/"][1];
        secondPlayerStat = [_secondPlayer.totalTestWickets componentsSeparatedByString:@"/"][1];
        _comparisionOperator = @"<";
        _givenPlayerStatValue = [givePlayerStat doubleValue];
        _secondPlayerStatValue = [secondPlayerStat doubleValue];
    }
    
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

- (IBAction)odiWicketsBet:(id)sender {
    
    if (self.oDIWickets.titleLabel.text && [self.oDIWickets.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.odiWicketsCaption.text;
    
    NSString *givePlayerStat = [self.oDIWickets.titleLabel.text componentsSeparatedByString:@"/"][0];
    NSString *secondPlayerStat = [_secondPlayer.totalODIWickets componentsSeparatedByString:@"/"][0];
    
    if ([givePlayerStat  isEqual: @"-"] && [secondPlayerStat isEqual: @"-"]) {
        return;
    }
    
    _givenPlayerStatValue = [givePlayerStat doubleValue];
    _secondPlayerStatValue = [secondPlayerStat doubleValue];
    
    if (_givenPlayerStatValue == _secondPlayerStatValue) {
        givePlayerStat = [self.oDIWickets.titleLabel.text componentsSeparatedByString:@"/"][1];
        secondPlayerStat = [_secondPlayer.totalODIWickets componentsSeparatedByString:@"/"][1];
        _comparisionOperator = @"<";
        _givenPlayerStatValue = [givePlayerStat doubleValue];
        _secondPlayerStatValue = [secondPlayerStat doubleValue];
    }
    
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

- (IBAction)t20WicketsBet:(id)sender {
    if (self.t20Wickets.titleLabel.text && [self.t20Wickets.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.t20WicketsCaption.text;
    
    NSString *givePlayerStat = [self.t20Wickets.titleLabel.text componentsSeparatedByString:@"/"][0];
    NSString *secondPlayerStat = [_secondPlayer.totalT20Wickets componentsSeparatedByString:@"/"][0];
    
    if ([givePlayerStat  isEqual: @"-"] && [secondPlayerStat isEqual: @"-"]) {
        return;
    }
    
    _givenPlayerStatValue = [givePlayerStat doubleValue];
    _secondPlayerStatValue = [secondPlayerStat doubleValue];
    
    if (_givenPlayerStatValue == _secondPlayerStatValue) {
        givePlayerStat = [self.t20Wickets.titleLabel.text componentsSeparatedByString:@"/"][1];
        secondPlayerStat = [_secondPlayer.totalT20Wickets componentsSeparatedByString:@"/"][1];
        _comparisionOperator = @"<";
        _givenPlayerStatValue = [givePlayerStat doubleValue];
        _secondPlayerStatValue = [secondPlayerStat doubleValue];
    }
    
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

-(void)testHighScoreBet:(id)sender
{
    if (self.testHighScore.titleLabel.text && [self.testHighScore.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    
    _givenPlayerStatCaption = self.testHighScoreCaption.text;
    _givenPlayerStatValue = [self.testHighScore.titleLabel.text doubleValue];
    _secondPlayerStatValue =[[_secondPlayer.testHighScore componentsSeparatedByString:@"*"][0] doubleValue] ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

- (void)odiHighScoreBet:(id)sender
{
    if (self.odiHighScore.titleLabel.text && [self.odiHighScore.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    
    _givenPlayerStatCaption = self.odiHighScoreCaption.text;
    _givenPlayerStatValue = [self.odiHighScore.titleLabel.text doubleValue];
    _secondPlayerStatValue =[[_secondPlayer.odiHighScore componentsSeparatedByString:@"*"][0] doubleValue] ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

- (void)t20HighScoreBet:(id)sender
{
#warning "This function is almost always crashing."
    if (self.t20HighScore.titleLabel.text && [self.t20HighScore.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.t20HighScoreCaption.text;
    _givenPlayerStatValue = [self.t20HighScore.titleLabel.text doubleValue];
    _secondPlayerStatValue =[[_secondPlayer.t20HighScore componentsSeparatedByString:@"*"][0] doubleValue] ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

-(void)testCenturiesBet:(id)sender
{
    if (self.testCenturies.titleLabel.text && [self.testCenturies.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.testCenturiesCaption.text;
    _givenPlayerStatValue = [self.testCenturies.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.testCenturiesCount ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

-(void)odiCenturiesBet:(id)sender
{
    if (self.odiCenturies.titleLabel.text && [self.odiCenturies.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.odiCenturiesCaption.text;
    _givenPlayerStatValue = [self.odiCenturies.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.odiCenturiesCount ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

-(void)t20CenturiesBet:(id)sender
{
    if (self.t20Centuries.titleLabel.text && [self.t20Centuries.titleLabel.text isEqualToString:@"-"]) {
        return;
    }
    _givenPlayerStatCaption = self.t20CenturiesCaption.text;
    _givenPlayerStatValue = [self.t20Centuries.titleLabel.text doubleValue];
    _secondPlayerStatValue =_secondPlayer.t20CenturiesCount ;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}

@end
