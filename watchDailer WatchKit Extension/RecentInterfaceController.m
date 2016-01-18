//
//  RecentInterfaceController.m
//  watchDailer
//
//  Created by Vinod Ramanathan on 19/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import "RecentInterfaceController.h"
#import "RowTable.h"
#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface RecentInterfaceController ()<WCSessionDelegate>

@end

@implementation RecentInterfaceController
NSMutableArray *tableLoad;
NSMutableArray *didlocalArray; NSMutableArray *saved_List;
NSMutableArray *callfromLog;
NSMutableArray *timeload;
NSMutableArray *timeloadlocal;

NSMutableArray *timedidselect_load;
NSMutableArray *revArrCAll;
NSMutableArray *revArr_DT;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
  //  tableLoad = [context valueForKey:@"RecentCalls"];
    
   // tableLoad = [[NSMutableArray alloc]initWithObjects:@"ONE",@"TWO",@"THREE", nil];
  //  NSLog(@"table array from %@",contextArray);
    
    if ([WCSession isSupported]) {
        
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
    }
    
    tableLoad = [[NSMutableArray alloc]init];  didlocalArray = [[NSMutableArray alloc]init];
    
    saved_List = [[NSMutableArray alloc]init];  callfromLog = [[NSMutableArray alloc]init];
    
    timeload = [[NSMutableArray alloc]init]; timeloadlocal = [[NSMutableArray alloc]init];
    
    timedidselect_load =[[NSMutableArray alloc]init];
    
    revArrCAll = [[NSMutableArray alloc]init]; revArr_DT =[[NSMutableArray alloc]init];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    didlocalArray =[defaults objectForKey:@"savecalls"];
    
   // NSLog(@"USERDEFAULTS %@",didlocalArray);
    
    [tableLoad addObjectsFromArray:didlocalArray];
    
   // NSLog(@"at TableLOad array %@",tableLoad);
    
    
    //for time date
    
    
    NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
    
    timeloadlocal = [usrdefaults objectForKey:@"savedateTime"];
    
    
  //  NSLog(@"USER DEF TIMEDATE %@",timeloadlocal);
    
    [timeload addObjectsFromArray:timeloadlocal];
    
 //   NSLog(@"Table load Date ** Time  %@",timeload);
    
    
    
    if ([tableLoad count] == 0) {
        
     //   NSLog(@"Table Array has nothing");
        
        [_callTable setHidden:TRUE];
        
        [_norecent_label setHidden:FALSE];
        
    }else{
       
        [_callTable setHidden:FALSE];
        
        [_norecent_label setHidden:TRUE];
       

    
        [_callTable setNumberOfRows:[tableLoad count] withRowType:@"cell"];
        
        
        for (int i=0; i < [tableLoad count]; i++) {
            
            
            NSString *getvalue = [tableLoad objectAtIndex:i];  NSString *getdatetime = [timeload objectAtIndex:i];
            
            RowTable *rowVC = [_callTable rowControllerAtIndex:i];
            
            [rowVC.table_label setText:getvalue];  [rowVC.tLabel_sub setText:getdatetime];
            
            
            
        }
        
    }//
    
   
    
    
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex{
    
    NSString *tablephone = tableLoad [rowIndex];
    
  //  NSLog(@"DID SELECT %@",tableLoad[rowIndex]);
    
    
    NSString *logstr = tableLoad[rowIndex];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray  *RETlog =[[defaults objectForKey:@"savecalls"]mutableCopy];
    
 //   NSLog(@"ext log in logTableview %@",RETlog);
    
    
    //lets unreverse
    
    RETlog=[[[RETlog reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array --> unreverse
 //   NSLog(@"RETlog REVERSE LOAD %@",RETlog);
    
    [revArrCAll removeAllObjects];
    [revArrCAll addObjectsFromArray:RETlog];
    
 //   NSLog(@"reversed & now Original %@",revArrCAll);
    
    
    
    // current call number
    [callfromLog removeAllObjects];
    [callfromLog addObject:logstr];
    
    [revArrCAll addObject:logstr];
    
 ///   NSLog(@"now updated Org %@", revArrCAll);
    
    
    revArrCAll=[[[revArrCAll reverseObjectEnumerator] allObjects] mutableCopy]; // back 2 reverse
    // NSLog(@"revArrCAll REVERSE LOAD %@",revArrCAll);
    
    
    [RETlog removeAllObjects];
    [RETlog addObjectsFromArray:revArrCAll];
    
 //   NSLog(@"FINALLY REV %@ ",RETlog);
    
   // [RETlog addObjectsFromArray:callfromLog]; //dummy
   // NSLog(@"updates log  %@",RETlog);

    
    
    NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
    
    [usrdefaults setObject:RETlog forKey:@"savecalls"];
    
    [usrdefaults synchronize];
    
    
    
    
    [_callTable setNumberOfRows:[RETlog count] withRowType:@"cell"];  //table row *****
    
    
    //for timedate *******
    
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"MM/dd/yy"];
    NSString *dateString1 = [dateFormat stringFromDate:today];
   // NSLog(@"%@", dateString1); //Date
    
    [dateFormat setDateFormat:@"hh:mma"];
    NSString   *sample13 =[dateFormat stringFromDate:today];
  //  NSLog(@"%@",sample13); //Time
    
    
    NSString *dtfull = [NSString stringWithFormat:@"%@ %@",dateString1,sample13];
   // NSLog(@"%@",dtfull);

    [timedidselect_load removeAllObjects];
    [timedidselect_load addObject:dtfull];
   // NSLog(@"load time data %@",timedidselect_load);
    
    // ret ext timedate array ***
  
    NSUserDefaults *urdefaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray  *RETdate =[[urdefaults objectForKey:@"savedateTime"]mutableCopy];
    
  //  NSLog(@"ext timedate in logTableview %@",RETdate);
    
    
    
    //lets unreverse datetime array
    
    RETdate=[[[RETdate reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array --> unreverse 
  //  NSLog(@"RETdate REVERSE LOAD %@",RETdate);
    
    [revArr_DT removeAllObjects];
    [revArr_DT addObjectsFromArray:RETdate];
    
  //  NSLog(@"reversed & now Original %@",revArr_DT);
    
    [revArr_DT addObjectsFromArray:timedidselect_load];
    
 //   NSLog(@"now updated Org %@",revArr_DT);
    
    revArr_DT=[[[revArr_DT reverseObjectEnumerator] allObjects] mutableCopy]; //back 2 unreverse
 //   NSLog(@"revArr_DT REVERSE LOAD %@",revArr_DT);
    
    [RETdate removeAllObjects];
    [RETdate addObjectsFromArray:revArr_DT];
    
  //  NSLog(@"FINALLY REV %@ ",RETdate);
    
    
    
  //  [RETdate addObjectsFromArray:timedidselect_load];
  //  NSLog(@"saveDateTime Main %@",RETdate);
    
    
    
    
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    
    [defaults1 setObject:RETdate forKey:@"savedateTime"];
    
    [defaults1 synchronize];
    
    
    //table ***
    
    for (int i=0; i < [RETlog count]; i++) {
        
        
        NSString *getvalue = [RETlog objectAtIndex:i];  NSString *gettimedate = [RETdate objectAtIndex:i];
        
        RowTable *rowVC = [_callTable rowControllerAtIndex:i];
        
        [rowVC.table_label setText:getvalue];  [rowVC.tLabel_sub setText:gettimedate];
        
        
    }
    

    
    
    NSDictionary *updtDict = @{@"updatedLog":RETlog,@"updatedlogStamp":RETdate};  //,@"dati":saveDateTime
    
    [[WCSession defaultSession]sendMessage:updtDict replyHandler:^(NSDictionary *reply){
        
        
        
        
    }errorHandler:^(NSError *error){
        
    }];

    
    
    
    
    NSString *phoneNumber = [@"tel://" stringByAppendingString:tablephone];
    [[WKExtension sharedExtension]openSystemURL:[NSURL URLWithString:phoneNumber]];

    
    
}

- (IBAction)DeleteCalls {
    
   // InterfaceController *vc1;
    //  NSLog(@"BEFORE DELETE %@",tableLoad);
    
    [tableLoad removeAllObjects];
    
  //  NSLog(@"DELETE %@",tableLoad);
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:tableLoad forKey:@"savecalls"];
    
    [defaults synchronize];
    
    [_callTable setNumberOfRows:[tableLoad count] withRowType:@"cell"];
    
    
    for (int i=0; i < [tableLoad count]; i++) {
        
        
        NSString *getvalue = [tableLoad objectAtIndex:i];
        
        RowTable *rowVC = [_callTable rowControllerAtIndex:i];
        
        [rowVC.table_label setText:getvalue];
        
        
    }

    [_callTable setHidden:TRUE];
    
    [_norecent_label setHidden:FALSE];
    
    
    
    
    //
    [timeload removeAllObjects];
    
  //  NSLog(@"DELETE TIME%@",timeload);
    
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    
    [defaults1 setObject:timeload forKey:@"savedateTime"];
    
    [defaults1 synchronize];
    


    //delete calls in watch sud update in iOS table --- make it reverse -- iOS table view scrolling -- save --
    
    NSDictionary *delDict = @{@"delAr":tableLoad,@"delArdate":timeload};
    
    [[WCSession defaultSession]sendMessage:delDict replyHandler:^(NSDictionary *reply){
        
        
        
    }errorHandler:^(NSError *Error){
        
        
    
    }];
    
    
}


- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message replyHandler:(void(^)(NSDictionary<NSString *, id> *replyMessage))replyHandler{
    
  //  NSLog(@"didReceive for Del");
    
    
    NSArray *delArray = [message objectForKey:@"delnum"]; //phone number
    
 //   NSLog(@"delarray %@",delArray);
    
    NSArray *delArr_DT = [message objectForKey:@"delnumDT"]; //TIME DATE
    
//    NSLog(@"delarray_DT %@",delArr_DT);

    
    if ([[message objectForKey:@"delnum"]isEqualToArray:delArray]) {
        
        [tableLoad removeAllObjects];
       
        [tableLoad addObjectsFromArray:delArray];
        
        [_callTable setNumberOfRows:[tableLoad count] withRowType:@"cell"];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:tableLoad forKey:@"savecalls"];
        
        [defaults synchronize];
        
        
        
        //DT
        
        [timeload removeAllObjects];
        
        [timeload addObjectsFromArray:delArr_DT];
        
        
        
        
        NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
        
        [usrdefaults setObject:timeload forKey:@"savedateTime"];
        
        [usrdefaults synchronize];

        
        for (int i=0; i < [tableLoad count]; i++) {
            
            
            NSString *getvalue = [tableLoad objectAtIndex:i]; NSString *getDT = [timeload objectAtIndex:i];
            
            RowTable *rowVC = [_callTable rowControllerAtIndex:i];
            
            [rowVC.table_label setText:getvalue];
            
            [rowVC.tLabel_sub setText:getDT];
            
            
        }
       

        
        
    }// recent call ****
    
    
    
    
    NSArray *delArray1 = [message objectForKey:@"delSavnum"];
    
 //   NSLog(@"delarray for saved %@",delArray1);
    
    if ([[message objectForKey:@"delSavnum"]isEqualToArray:delArray1]) {
        
        [saved_List removeAllObjects];
        
        [saved_List addObjectsFromArray:delArray1];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:saved_List forKey:@"saveConNum"];
        
        [defaults synchronize];
        
 //       NSLog(@"save Contacts Number-DEL from iOS --in RIC-- %@",saved_List);
        
        
        
        
        
    }// saved list DELETE from iOS ******
    
    
    
    
    // DVC
    
    //** DVC
    
    NSArray *dvcArray = [message objectForKey:@"ckey"]; //phone number
    
 //   NSLog(@"dvcArray %@",dvcArray);
    
    NSArray *dvcArray_DT = [message objectForKey:@"dtkey"]; //TIME DATE
    
 //   NSLog(@"dvcArray_DT %@",dvcArray_DT);
    
    
    
    if ([[message objectForKey:@"ckey"]isEqualToArray:dvcArray]) {
        
        [tableLoad removeAllObjects];
        
        [tableLoad addObjectsFromArray:dvcArray];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:tableLoad forKey:@"savecalls"];
        
        [defaults synchronize];
    
    //    NSLog(@"save no after parent del-dvc in SN in RIC %@",tableLoad);
        
        //DT
        [timeload removeAllObjects];
        
        [timeload addObjectsFromArray:dvcArray_DT];
        
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        [defaults1 setObject:timeload forKey:@"savedateTime"];
        
        [defaults1 synchronize];
        
   //     NSLog(@"save no after parent DT del-dvc in SN in RIC %@",timeload);
        
        
        if ([tableLoad count] == 0) {
            
     //       NSLog(@"Table Array has nothing");
            
            [_callTable setHidden:TRUE];
            
            [_norecent_label setHidden:FALSE];
            
        }else{
            
            [_callTable setHidden:FALSE];
            
            [_norecent_label setHidden:TRUE];
            
            
            
            [_callTable setNumberOfRows:[tableLoad count] withRowType:@"cell"];
            
            
            for (int i=0; i < [tableLoad count]; i++) {
                
                
                NSString *getvalue = [tableLoad objectAtIndex:i];  NSString *getdatetime = [timeload objectAtIndex:i];
                
                RowTable *rowVC = [_callTable rowControllerAtIndex:i];
                
                [rowVC.table_label setText:getvalue];  [rowVC.tLabel_sub setText:getdatetime];
                
                
                
            }
            
        }//

        
        
        
        
    }// Delete phone number & DateTime ALL From iOS DVC
    
    
    
    
    
    
    
    NSArray *dvcArr_Saved = [message objectForKey:@"skey"];
    
 //   NSLog(@"dvcArr_Saved for saved %@",dvcArr_Saved);
    
    if ([[message objectForKey:@"skey"]isEqualToArray:dvcArr_Saved]) {
        
        [saved_List removeAllObjects];
        
        [saved_List addObjectsFromArray:dvcArr_Saved];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:saved_List forKey:@"saveConNum"];
        
        [defaults synchronize];
        
   //     NSLog(@"save Contacts Number-DEL from iOS-dvc in RIC %@",saved_List);
        
        
        
        
        
    }// saved list DELETE ALL from iOS DVC  ******
    

    
    
    
    
    
}



- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



