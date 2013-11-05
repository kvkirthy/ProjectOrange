//
//  VCKiSquadIViewCtrl.m
//  PlayerCards
//
//  Created by VenCKi on 10/20/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiSquadIViewCtrl.h"
#import "VCKiPlayerRecordReader.h"

@interface VCKiSquadIViewCtrl ()

@end

@implementation VCKiSquadIViewCtrl

@synthesize tableView = _tableView;
VCKiPlayerRecordReader* playerManager;
NSMutableArray* _playersList;

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
	_tableView.delegate = self;
    _tableView.dataSource = self;
    _playersList = [[NSMutableArray alloc]init];
    
    playerManager = [[VCKiPlayerRecordReader alloc]init];
    
    VCKiPlayerEntity *player = [playerManager getNextPrimaryPlayer];
    
    while (player){
        [_playersList addObject:player];
        player = [playerManager getNextPrimaryPlayer];
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_playersList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"playerRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    VCKiPlayerEntity* player = [_playersList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = player.fullName;
    cell.detailTextLabel.text = player.team;
    cell.imageView.image = [UIImage imageNamed:player.playerPicture];
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
