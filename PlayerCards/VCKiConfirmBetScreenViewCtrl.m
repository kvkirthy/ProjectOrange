//
//  VCKiConfirmBetScreenViewCtrl.m
//  PlayerCards
//
//  Created by VenCKi on 10/13/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiConfirmBetScreenViewCtrl.h"
#import "VCKiPlayScreenViewCtrl.h"

@interface VCKiConfirmBetScreenViewCtrl ()


-(void)togglePlayScreenControlsVisibility: (VCKiPlayScreenViewCtrl *) playScreen;


@end

@implementation VCKiConfirmBetScreenViewCtrl

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
    
    VCKiPlayScreenViewCtrl *playScreen = (VCKiPlayScreenViewCtrl *)[self presentingViewController];
#warning "rounded corners not applied"
    self.playerImage.layer.cornerRadius = 10;
    self.playerImage.image = playScreen.playerImage.image;
    self.playerName.text = playScreen.fullName.text;
    self.betCaption.text = [NSString stringWithFormat:@"About to bet on %@ - %@", self.givenPlayerStatCaption, self.givenPlayerStatValue ];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) togglePlayScreenControlsVisibility: (VCKiPlayScreenViewCtrl *) playScreen
{
    playScreen.fullName.hidden = (playScreen.fullName.hidden)?false:true;
    playScreen.teamName.hidden = (playScreen.teamName.hidden)?false:true;
    
    playScreen.playerImage.hidden = (playScreen.playerImage.hidden)?false:true;
    
    playScreen.testMatches.hidden = (playScreen.testMatches.hidden)?false:true;
    playScreen.testMatchesCaption.hidden = (playScreen.testMatchesCaption.hidden)?false:true;
    
    playScreen.testRuns.hidden = (playScreen.testRuns.hidden)?false:true;
    playScreen.testRunsCaption.hidden = (playScreen.testRunsCaption.hidden)?false:true;
    
    playScreen.testWickets.hidden = (playScreen.testWickets.hidden)?false:true;
    playScreen.testWicketsCaption.hidden = (playScreen.testWicketsCaption.hidden)?false:true;
    
    playScreen.oDIMatches.hidden = (playScreen.oDIMatches.hidden)?false:true;
    playScreen.odiMatchesCaption.hidden = (playScreen.odiMatchesCaption.hidden)?false:true;
    
    playScreen.oDIRuns.hidden = (playScreen.oDIRuns.hidden)?false:true;
    playScreen.odiRunsCaption.hidden = (playScreen.odiRunsCaption.hidden)?false:true;
    
    playScreen.oDIWickets.hidden = (playScreen.oDIWickets.hidden)?false:true;
    playScreen.odiWicketsCaption.hidden = (playScreen.odiWicketsCaption.hidden)?false:true;
    
    playScreen.t20Matches.hidden = (playScreen.t20Matches.hidden)?false:true;
    playScreen.t20MatchesCaption.hidden = (playScreen.t20MatchesCaption.hidden)?false:true;
    
    playScreen.t20Runs.hidden = (playScreen.t20Runs.hidden)?false:true;
    playScreen.t20RunsCaption.hidden = (playScreen.t20RunsCaption.hidden)?false:true;
    
    playScreen.t20Wickets.hidden = (playScreen.t20Wickets.hidden)?false:true;
    playScreen.t20WicketsCaption.hidden = (playScreen.t20WicketsCaption.hidden)?false:true;
    
    // self.testMatches.hidden = (self.testMatches.hidden)?false:true;
}

- (IBAction)continueClicked:(id)sender {
    VCKiPlayScreenViewCtrl *playScreen = (VCKiPlayScreenViewCtrl *)[self presentingViewController];
    //[self togglePlayScreenControlsVisibility:playScreen];
    [self dismissViewControllerAnimated:YES completion:^{
        [playScreen performSegueWithIdentifier:@"playStatusSegue" sender:self];
    }];
}
@end
