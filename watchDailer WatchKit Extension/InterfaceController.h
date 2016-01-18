//
//  InterfaceController.h
//  watchDailer WatchKit Extension
//
//  Created by Vinod Ramanathan on 08/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *numLabel;

@property (strong, nonatomic) IBOutlet WKInterfaceButton *call_Button;

@property (strong, nonatomic) IBOutlet WKInterfaceButton *del_button;

- (IBAction)FT_Save;

- (IBAction)FT_Recent;


@end
