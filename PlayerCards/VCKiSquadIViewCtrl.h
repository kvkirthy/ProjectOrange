//
//  VCKiSquadIViewCtrl.h
//  PlayerCards
//
//  Created by VenCKi on 10/20/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCKiSquadIViewCtrl : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
