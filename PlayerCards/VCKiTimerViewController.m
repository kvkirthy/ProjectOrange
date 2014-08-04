//
//  VCKiTimerViewController.m
//  PlayerCards
//
//  Created by VenCKi on 11/5/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiTimerViewController.h"

@interface VCKiTimerViewController ()

@end

@implementation VCKiTimerViewController

int counter =3;
NSTimer *timer;

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
    counter = 3;
   timer = [NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(timerTicked:) userInfo:nil repeats:YES];
}

- (void)timerTicked:(NSTimer*)timer {
    
    
    counter = counter - 1;
    if (counter < 0){
        [timer invalidate];
        [self performSegueWithIdentifier:@"seguePlayscreen" sender:self];
    }
    else if(counter == 0){
        self.labelCountdown.text = [NSString stringWithFormat: @"GO"];
    }
    else{
        self.labelCountdown.text = [NSString stringWithFormat: @"%d",counter];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
