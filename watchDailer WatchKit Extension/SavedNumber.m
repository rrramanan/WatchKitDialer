//
//  SavedNumber.m
//  watchDailer
//
//  Created by Vinod Ramanathan on 06/11/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import "SavedNumber.h"
#import "RowTable1.h"
#import <WatchConnectivity/WatchConnectivity.h>
@interface SavedNumber ()<WCSessionDelegate>

@end

@implementation SavedNumber
NSMutableArray *SavedList;
NSMutableArray *localRET;
NSMutableArray *ricArr;  NSMutableArray *ricArr1;
NSMutableArray *callTBL; NSMutableArray *timedate_Larr;
NSMutableArray *revarr_SL; NSMutableArray *revarr_DTime;
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    if ([WCSession isSupported]) {
        
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
    }
    
    localRET = [[NSMutableArray alloc]init];
    
    SavedList = [[NSMutableArray alloc]init];
    
    ricArr = [[NSMutableArray alloc]init];  callTBL = [[NSMutableArray alloc]init]; timedate_Larr =[[NSMutableArray alloc]init];
    
    revarr_SL = [[NSMutableArray alloc]init]; revarr_DTime = [[NSMutableArray alloc]init]; ricArr1 = [[NSMutableArray alloc]init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    localRET =[[defaults objectForKey:@"saveConNum"]mutableCopy];
    
  //  NSLog(@"For SAVEDNumber ret array %@",localRET);
    

    [SavedList addObjectsFromArray:localRET];
    
   // NSLog(@"list has %@",SavedList);
    
    
   
    if ([SavedList count] == 0) {
        
        
        [_savedTable setHidden:TRUE];
        
      //  [_nosavednum_label setHidden:FALSE];
        
        
    }else{
        
        [_savedTable setHidden:FALSE];
        
        [_nosavednum_label setHidden:TRUE];

        
        [_savedTable setNumberOfRows:[SavedList count] withRowType:@"cell1"];
        
        for (int i=0; i < [SavedList count] ; i++) {
            
            NSString *getvalues = [SavedList objectAtIndex:i];
            
            RowTable1 *rowvc = [_savedTable rowControllerAtIndex:i];
            
            [rowvc.label_saved setText:getvalues];
            
        }
        
        
    }//
    
    
    
    
    
    
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    if ([WCSession isSupported]) {
        
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
    }
    
    
    
    
    
    
    
}



- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message replyHandler:(void(^)(NSDictionary<NSString *, id> *replyMessage))replyHandler{
    
  //  NSLog(@"didReceive for Del");
    
    
    NSArray *delArray = [message objectForKey:@"delSavnum"];
  
  //  NSLog(@"delarray for saved %@",delArray);
    
    if ([[message objectForKey:@"delSavnum"]isEqualToArray:delArray]) {
        
        [SavedList removeAllObjects];
        
        [SavedList addObjectsFromArray:delArray];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:SavedList forKey:@"saveConNum"];
        
        [defaults synchronize];
        
     //   NSLog(@"save Contacts Number-DEL from iOS %@",SavedList);
        
        
        
        [_savedTable setNumberOfRows:[SavedList count] withRowType:@"cell1"];
        
        for (int i=0; i < [SavedList count] ; i++) {
            
            NSString *getvalues = [SavedList objectAtIndex:i];
            
            RowTable1 *rowvc = [_savedTable rowControllerAtIndex:i];
            
            [rowvc.label_saved setText:getvalues];
            
            
        }

        
        
    }// saved list DELETE from iOS ******
    
    
    
    NSArray *delArray1 = [message objectForKey:@"delnum"];
    
  //  NSLog(@"delarray1  %@",delArray1);
    
    NSArray *delArr_DT = [message objectForKey:@"delnumDT"]; //TIME DATE
    
  //  NSLog(@"delarray_DT %@",delArr_DT);
    
    
    if ([[message objectForKey:@"delnum"]isEqualToArray:delArray1]) {
        
        [ricArr removeAllObjects];
        
        [ricArr addObjectsFromArray:delArray1];
        
       
    //    NSLog(@"ricArr %@",ricArr);
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:ricArr forKey:@"savecalls"];
        
        [defaults synchronize];
        
        
        
        //DT
        
        [ricArr1 removeAllObjects];
        
        [ricArr1 addObjectsFromArray:delArr_DT];
        
        
        
        NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
        
        [usrdefaults setObject:ricArr1 forKey:@"savedateTime"];
        
        [usrdefaults synchronize];

        
        
        
        
    }// recent call & DateTime from iOS ****
    
    
    
    
    //** DVC
    
    NSArray *dvcArray = [message objectForKey:@"ckey"]; //phone number
    
  //  NSLog(@"dvcArray %@",dvcArray);
    
    NSArray *dvcArray_DT = [message objectForKey:@"dtkey"]; //TIME DATE
    
  //  NSLog(@"dvcArray_DT %@",dvcArray_DT);
    
    
    
    if ([[message objectForKey:@"ckey"]isEqualToArray:dvcArray]) {
        
        [ricArr removeAllObjects];
        
        [ricArr addObjectsFromArray:dvcArray];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:ricArr forKey:@"savecalls"];
        
        [defaults synchronize];
        
    //    NSLog(@"save no after parent del-dvc in SN %@",ricArr);
        
        //DT
        [ricArr1 removeAllObjects];
        
        [ricArr1 addObjectsFromArray:dvcArray_DT];
        
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        [defaults1 setObject:ricArr1 forKey:@"savedateTime"];
        
        [defaults1 synchronize];
        
   //     NSLog(@"save no after parent DT del-dvc in SN %@",ricArr1);
        
        
        
        
    }// Delete phone number & DateTime ALL From iOS DVC
    
    
    
    
    
    NSArray *dvcArr_Saved = [message objectForKey:@"skey"];
    
  //  NSLog(@"dvcArr_Saved for saved %@",dvcArr_Saved);
    
    if ([[message objectForKey:@"skey"]isEqualToArray:dvcArr_Saved]) {
        
        [SavedList removeAllObjects];
        
        [SavedList addObjectsFromArray:dvcArr_Saved];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:SavedList forKey:@"saveConNum"];
        
        [defaults synchronize];
        
   //     NSLog(@"save Contacts Number-DEL from iOS-dvc in SN %@",SavedList);
        
        
        if ([SavedList count] == 0) {
            
            
            [_savedTable setHidden:TRUE];
            
            [_nosavednum_label setHidden:FALSE];
            
            
        }else{
            
            [_savedTable setHidden:FALSE];
            
            [_nosavednum_label setHidden:TRUE];
            
            
            [_savedTable setNumberOfRows:[SavedList count] withRowType:@"cell1"];
            
            for (int i=0; i < [SavedList count] ; i++) {
                
                NSString *getvalues = [SavedList objectAtIndex:i];
                
                RowTable1 *rowvc = [_savedTable rowControllerAtIndex:i];
                
                [rowvc.label_saved setText:getvalues];
                
            }
            
            
        }//
        
        
        
        
        
        
    }// saved list DELETE ALL from iOS DVC  ******

    
    
    
    
    
}



- (IBAction)FT_DelSavedContacts {
    
    
 //   NSLog(@"FT all Del Saved Contacts list");
    
    [SavedList removeAllObjects];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:SavedList forKey:@"saveConNum"];
    
    [defaults synchronize];
    
    
    
    [_savedTable setNumberOfRows:[SavedList count] withRowType:@"cell1"];
    
    for (int i=0; i < [SavedList count] ; i++) {
        
        NSString *getvalues = [SavedList objectAtIndex:i];
        
        RowTable1 *rowvc = [_savedTable rowControllerAtIndex:i];
        
        [rowvc.label_saved setText:getvalues];
        
        
    }
    
    [_savedTable setHidden:TRUE];
    [_nosavednum_label setHidden:FALSE];
    
    
    NSDictionary *delSavedC = @{@"delsavedCLST":SavedList};
    
    [[WCSession defaultSession] sendMessage:delSavedC replyHandler:^(NSDictionary *reply){
        
    }errorHandler:^(NSError *error){
        
    }];
    
    
}



- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex{
    
    NSString *tablephone = SavedList [rowIndex];
    
  //  NSLog(@"DID SELECT %@",SavedList[rowIndex]);
    
    NSString *callstr = SavedList[rowIndex];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
  NSMutableArray  *RETloglist =[[defaults objectForKey:@"savecalls"]mutableCopy];
    
  //  NSLog(@"ext log %@",RETloglist);
    
    
    //lets unreverse
    
    RETloglist=[[[RETloglist reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array --> unreverse
  //  NSLog(@"RETloglist REVERSE LOAD %@",RETloglist);
    
    [revarr_SL removeAllObjects];
    [revarr_SL addObjectsFromArray:RETloglist];
    
 //   NSLog(@"reversed & now Original %@",revarr_SL);
    
    //
    
    // current number didselect
    [callTBL removeAllObjects];
    [callTBL addObject:callstr];
 //   NSLog(@"callstr %@",callTBL);
   
    [revarr_SL addObjectsFromArray:callTBL];
    
  //  NSLog(@"now updated Org %@",revarr_SL);
    
    revarr_SL = [[[revarr_SL reverseObjectEnumerator] allObjects] mutableCopy]; // back 2 reverse
 //   NSLog(@"revarr_SL REVERSE LOAD %@",revarr_SL);
    
    
    [RETloglist  removeAllObjects];
    [RETloglist addObjectsFromArray:revarr_SL];
    
 //   NSLog(@"FINALLY  revarr_SL REV %@ ",revarr_SL);

    
    
    
    //[RETloglist addObjectsFromArray:callTBL];
    //NSLog(@"updates log  %@",RETloglist);
    
    
    NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
    
    [usrdefaults setObject:RETloglist forKey:@"savecalls"];
    
    [usrdefaults synchronize];

    
    
    //for timedate *******
    
    
    NSDate *todaydate = [NSDate date];
    NSDateFormatter *dateFormat_new = [[NSDateFormatter alloc] init];
    
    [dateFormat_new setDateFormat:@"MM/dd/yy"];
    NSString *dateString1 = [dateFormat_new stringFromDate:todaydate];
   // NSLog(@"%@", dateString1); //Date
    
    [dateFormat_new setDateFormat:@"hh:mma"];
    NSString   *sample13 =[dateFormat_new stringFromDate:todaydate];
  //  NSLog(@"%@",sample13); //Time
    
    
    NSString *dtfull_D = [NSString stringWithFormat:@"%@ %@",dateString1,sample13];
 //   NSLog(@"%@",dtfull_D);
    
    [timedate_Larr removeAllObjects];
    [timedate_Larr addObject:dtfull_D];
    
    // ret ext datetime ****
    
    
    NSUserDefaults *urdefaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray  *RETdatetime =[[urdefaults objectForKey:@"savedateTime"]mutableCopy];
    
    NSLog(@"ext timedate in savedlist %@",RETdatetime);
    

    
    
    //lets unreverse datetime array
    
    RETdatetime =[[[RETdatetime reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array --> unreverse
  //  NSLog(@"RETdatetime REVERSE LOAD %@",RETdatetime);
    
    [revarr_DTime removeAllObjects];
    [revarr_DTime addObjectsFromArray:RETdatetime];
    
 //    NSLog(@"reversed & now Original %@",revarr_DTime);
    
    [revarr_DTime addObjectsFromArray:timedate_Larr];
    
  //    NSLog(@"now updated Org %@",revarr_DTime);
    
    revarr_DTime=[[[revarr_DTime reverseObjectEnumerator] allObjects] mutableCopy]; //back 2 unreverse
 //   NSLog(@"revArr_DT REVERSE LOAD %@",revarr_DTime);
    
    [RETdatetime removeAllObjects];
    [RETdatetime addObjectsFromArray:revarr_DTime];
    
 //   NSLog(@"FINALLY REV %@ ",RETdatetime);
    
    
    
    
    
    //[RETdatetime addObjectsFromArray:timedate_Larr];
    
    //NSLog(@"saveDateTime Main from SAVEDlist %@",RETdatetime);
    
    
    
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    
    [defaults1 setObject:RETdatetime forKey:@"savedateTime"];
    
    [defaults1 synchronize];
    
    
    
    
    
    NSDictionary *UpdateDict = @{@"updatedLogfromSaved":RETloglist,@"updatedLogStampfromSaved":RETdatetime};  //,@"dati":saveDateTime
    
    [[WCSession defaultSession]sendMessage:UpdateDict replyHandler:^(NSDictionary *reply){
        
        
        
        
    }errorHandler:^(NSError *error){
        
    }];
    
    
    
    
    NSString *phoneNumber = [@"tel://" stringByAppendingString:tablephone];
    [[WKExtension sharedExtension]openSystemURL:[NSURL URLWithString:phoneNumber]];
    
    
    
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



