//
//  VCKiManualPagesViewCtrl.m
//  PlayerCards
//
//  Created by VenCKi on 10/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiManualPagesViewCtrl.h"

@implementation VCKiManualPagesViewCtrl

@synthesize titleText = _titleText;
@synthesize pageIndex = _pageIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void) setPageIndex:(NSNumber *)pageIndex
{
    _pageIndex = pageIndex;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)skipToAction:(id)sender {
    [self performSegueWithIdentifier:@"segueToReviewSquads" sender:self];
}

@end
