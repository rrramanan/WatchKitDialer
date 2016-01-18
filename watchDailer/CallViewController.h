//
//  CallViewController.h
//  watchDailer
//
//  Created by Vinod Ramanathan on 14/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *callTable;

@property (strong, nonatomic) IBOutlet UILabel *nocall_label;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentctrl;

- (IBAction)segmentACTION:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *savedCall_label;

- (IBAction)editTable:(id)sender;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *editBut;


@end
