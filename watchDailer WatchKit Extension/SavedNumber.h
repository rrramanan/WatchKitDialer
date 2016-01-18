//
//  SavedNumber.h
//  watchDailer
//
//  Created by Vinod Ramanathan on 06/11/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface SavedNumber : WKInterfaceController

@property (strong, nonatomic) IBOutlet WKInterfaceTable *savedTable;

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *nosavednum_label;

@end
