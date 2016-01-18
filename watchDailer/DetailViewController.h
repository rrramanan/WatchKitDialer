//
//  DetailViewController.h
//  watchDailer
//
//  Created by Vinod Ramanathan on 14/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *detailTable;

@end
