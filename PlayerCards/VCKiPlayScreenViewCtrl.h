//
//  VCKiPlayScreenViewCtrl.h
//  PlayerCards
//
//  Created by VenCKi on 10/11/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCKiPlayScreenViewCtrl : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *playerImage;

@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *teamName;
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

- (IBAction)testRunBet:(id)sender;

@end
