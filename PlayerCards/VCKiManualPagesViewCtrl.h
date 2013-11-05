//
//  VCKiManualPagesViewCtrl.h
//  PlayerCards
//
//  Created by VenCKi on 10/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCKiManualPagesViewCtrl : UIViewController
@property (nonatomic) NSNumber *pageIndex;
@property (nonatomic) IBOutlet UILabel *titleText;

- (IBAction)skipToAction:(id)sender;

@end
