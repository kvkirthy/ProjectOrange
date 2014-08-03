//
//  VCKiPlayScreenViewCtrl.h
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface VCKiPlayScreenViewCtrl : UIViewController<ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *playerImage;

@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *teamName;
@property (weak, nonatomic) IBOutlet UILabel *span;
@property (weak, nonatomic) IBOutlet UILabel *playerCount;
@property (weak, nonatomic) IBOutlet UILabel *oppositionCount;


@property (weak, nonatomic) IBOutlet UILabel *testRunsCaption;
@property (weak, nonatomic) IBOutlet UIButton *testRuns;
@property (weak, nonatomic) IBOutlet UILabel *testMatchesCaption;
@property (weak, nonatomic) IBOutlet UIButton *testMatches;
@property (weak, nonatomic) IBOutlet UILabel *testWicketsCaption;
@property (weak, nonatomic) IBOutlet UIButton *testWickets;

@property (weak, nonatomic) IBOutlet UILabel *odiRunsCaption;
@property (weak, nonatomic) IBOutlet UIButton *oDIRuns;
@property (weak, nonatomic) IBOutlet UILabel *odiMatchesCaption;
@property (weak, nonatomic) IBOutlet UIButton *oDIMatches;
@property (weak, nonatomic) IBOutlet UIButton *oDIWickets;
@property (weak, nonatomic) IBOutlet UILabel *odiWicketsCaption;


@property (weak, nonatomic) IBOutlet UILabel *t20WicketsCaption;
@property (weak, nonatomic) IBOutlet UILabel *t20MatchesCaption;
@property (weak, nonatomic) IBOutlet UILabel *t20RunsCaption;
@property (weak, nonatomic) IBOutlet UIButton *t20Runs;
@property (weak, nonatomic) IBOutlet UIButton *t20Matches;
@property (weak, nonatomic) IBOutlet UIButton *t20Wickets;

@property (weak, nonatomic) IBOutlet UILabel *testHighScoreCaption;
@property (weak, nonatomic) IBOutlet UIButton *testHighScore;
@property (weak, nonatomic) IBOutlet UILabel *odiHighScoreCaption;
@property (weak, nonatomic) IBOutlet UIButton *odiHighScore;
@property (weak, nonatomic) IBOutlet UILabel *t20HighScoreCaption;
@property (weak, nonatomic) IBOutlet UIButton *t20HighScore;

@property (weak, nonatomic) IBOutlet UILabel *testCenturiesCaption;
@property (weak, nonatomic) IBOutlet UIButton *testCenturies;
@property (weak, nonatomic) IBOutlet UILabel *odiCenturiesCaption;
@property (weak, nonatomic) IBOutlet UIButton *odiCenturies;
@property (weak, nonatomic) IBOutlet UILabel *t20CenturiesCaption;
@property (weak, nonatomic) IBOutlet UIButton *t20Centuries;



- (IBAction)testRunBet:(id)sender;
- (IBAction)odiRunBet:(id)sender;
- (IBAction)t20RunBet:(id)sender;
- (IBAction)testMatchesBet:(id)sender;
- (IBAction)odiMatchesBet:(id)sender;
- (IBAction)t20MatchesBet:(id)sender;
- (IBAction)testWicketsBet:(id)sender;
- (IBAction)odiWicketsBet:(id)sender;
- (IBAction)t20WicketsBet:(id)sender;
- (IBAction)testHighScoreBet:(id)sender;
- (IBAction)odiHighScoreBet:(id)sender;
- (IBAction)t20HighScoreBet:(id)sender;
- (IBAction)testCenturiesBet:(id)sender;
- (IBAction)odiCenturiesBet:(id)sender;
- (IBAction)t20CenturiesBet:(id)sender;

-(void) initializeScreen;
- (void) returnToViewController;

@end
