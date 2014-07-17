//
//  VCKiFinalResultViewController.m
//  PlayerCards
//
//  Created by VenCKi on 11/14/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiFinalResultViewController.h"

@interface VCKiFinalResultViewController ()

@end

@implementation VCKiFinalResultViewController

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
    
#warning "Need to implement play again!"
    if (self.isPrimaryPlayerWon) {
        self.finalResultMessage.text = @"Congratulations";
    }
    else
    {
        self.finalResultMessage.text = @"You should try again. Hope you enjoyed the game!";
    }
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
