//
//  RecentInterfaceController.h
//  watchDailer
//
//  Created by Vinod Ramanathan on 19/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface RecentInterfaceController : WKInterfaceController

@property (strong, nonatomic) IBOutlet WKInterfaceTable *callTable;

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *norecent_label;

@end
