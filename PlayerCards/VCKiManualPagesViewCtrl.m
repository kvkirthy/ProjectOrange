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
- (UIImage *)resizeImage:(UIImage*)originalImage scaledToSize:(CGSize)size;
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
    
    // heights 585, 480
    // width 341
    
    
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

- (UIImage *)resizeImage:(UIImage*)originalImage scaledToSize:(CGSize)size
{
    //avoid redundant drawing
    if (CGSizeEqualToSize(originalImage.size, size))
    {
        return originalImage;
    }
    
    //create drawing context
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //draw
    [originalImage drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
    
    //capture resultant image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return image
    return image;
}

@end
