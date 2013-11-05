//
//  VCKiManualPagesViewCtrl.m
//  PlayerCards
//
//  Created by VenCKi on 10/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiManualPagesViewCtrl.h"
#import "VCKiManualPageContentSerializer.h"

@interface VCKiManualPagesViewCtrl ()

@end

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
    //_titleText.text =[pageIndex stringValue];
    _pageIndex = pageIndex;
    //self.titleText.text = @"test label";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.titleText.text = [self.pageIndex stringValue]; // @"a sample text";//[self.pageIndex stringValue];
    if([_pageIndex integerValue] == 0){
        self.titleText.text = [VCKiManualPageContentSerializer getSingletonObject].page1;
    }
    else if([_pageIndex integerValue] == 1){
        self.titleText.text = [VCKiManualPageContentSerializer getSingletonObject].page2;
    }
    else if([_pageIndex integerValue] == 2){
        self.titleText.text = [VCKiManualPageContentSerializer getSingletonObject].page3;
    }
    else if([_pageIndex integerValue] == 3){
        self.titleText.text = [VCKiManualPageContentSerializer getSingletonObject].page4;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)skipToAction:(id)sender {
}
@end
