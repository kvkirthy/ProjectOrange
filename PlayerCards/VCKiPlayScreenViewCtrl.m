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

@interface VCKiPlayScreenViewCtrl (){
    
    NSString* _givenPlayerStatCaption;
    NSString* _givenPlayerStatValue;
    
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
    
    NSUInteger randomNumber = arc4random() % 11;
	
    VCKiPlayerEntity *player = [ [[VCKiPlayerRecordReader alloc]init] getPlayerRecordWithIndex:[NSString stringWithFormat:@"%d",randomNumber]];

    self.fullName.text = player.fullName;
    self.teamName.text = player.team;
    
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
        confirmVc.givenPlayerStatValue = _givenPlayerStatValue;
        
    }
}

- (IBAction)testRunBet:(id)sender {
    _givenPlayerStatCaption = self.testRunsCaption.text;
    _givenPlayerStatValue = self.testRuns.titleLabel.text;
    [self performSegueWithIdentifier:@"goToConfirmScreen" sender:self];
}
@end
