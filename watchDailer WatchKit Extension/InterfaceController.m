//
//  InterfaceController.m
//  watchDailer WatchKit Extension
//
//  Created by Vinod Ramanathan on 08/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface InterfaceController()<WCSessionDelegate>

@end


@implementation InterfaceController
NSString *all     = @"";
NSString *final   = @"";
NSString *one     = @"1";
NSString *two     = @"2";
NSString *three   = @"3";
NSString *four    = @"4";
NSString *five    = @"5";
NSString *six     = @"6";
NSString *seven   = @"7";
NSString *eight   = @"8";
NSString *nine    = @"9";
NSString *zero    = @"0";
NSString *star    = @"*";
NSString *hassh   = @"#";
NSString *plus    = @"+";
NSString *loadSTR = @"";

NSMutableArray *loadPhoneCall;
NSMutableArray *retArray;  NSMutableArray *retArray1; NSMutableArray *retArray2;
NSMutableArray *savePhoneCall;
NSMutableArray *saveContactsArr; NSMutableArray *listSavedno;
NSMutableArray *savedList;

NSMutableArray *loadDateTime; NSMutableArray *saveDateTime;
NSMutableArray *unrevArr;
NSMutableArray *unrevArr_td;


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    
    loadPhoneCall = [[NSMutableArray alloc]init];
    retArray = [[NSMutableArray alloc]init];  retArray1 = [[NSMutableArray alloc]init];
    savePhoneCall = [[NSMutableArray alloc]init];
    saveContactsArr = [[NSMutableArray alloc]init]; listSavedno = [[NSMutableArray alloc]init];
    savedList = [[NSMutableArray alloc]init];
    
    loadDateTime =[[NSMutableArray alloc]init]; saveDateTime = [[NSMutableArray alloc]init];

    unrevArr = [[NSMutableArray alloc]init]; unrevArr_td = [[NSMutableArray alloc]init];
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    loadPhoneCall =[[defaults objectForKey:@"savecalls"]mutableCopy];
//    
//    NSLog(@"USERDEFAULTS *** OLD CALL  %@",loadPhoneCall);
    
    
    if ([WCSession isSupported]) {
        
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
        
        
        
    }
    
    
    
    
    
    //ck re
    
    
    
    NSDictionary *getoffline = @{@"offline":@"offcatch"};
    
    [[WCSession defaultSession]sendMessage:getoffline replyHandler:^(NSDictionary *reply){
        
        NSMutableArray *getsg1 = [reply objectForKey:@"sg1"];
        
       // NSLog(@"reply offline sg1 %@",getsg1);
        
        
        NSMutableArray *getsg2 = [reply objectForKey:@"sg2"];
        
     //   NSLog(@"reply offline sg2 %@",getsg2);
        
        
        NSMutableArray *getsg3 = [reply objectForKey:@"sg3"];
        
      //  NSLog(@"reply offline sg3 %@",getsg3);

        
        
        //log
        
        NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
        
        [userdefault setObject:getsg1 forKey:@"savecalls"];
        
        [userdefault synchronize];
        
       // NSLog(@"save no in AWAKE %@",savePhoneCall);
        
        //saved list
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:getsg2 forKey:@"saveConNum"];
        
        [defaults synchronize];
        
      //  NSLog(@"save Contacts Number in AWAKE %@",listSavedno);
        
        //DT
        
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        [defaults1 setObject:getsg3 forKey:@"savedateTime"];
        
        [defaults1 synchronize];
        
      //  NSLog(@"save DT in AWAKE %@",saveDateTime);
        
        
        
        
    }errorHandler:^(NSError *error){
        
    }];

    
    
    
    
    
    [_del_button setEnabled:false];
    [_call_Button setEnabled:false];
    
    
    
}
//



- (IBAction)one {
    
    
    all = [all stringByAppendingString:one];
    
    
    [_numLabel setText:all];
    
   
    
   // NSLog(@"load1 %@",all);
    
    
    
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }

    
}


- (IBAction)two {
    
    
    all  =  [all stringByAppendingString:two];
    
    [_numLabel setText:all];
    
    
  //  NSLog(@"load2 %@",all);
    
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }

    
}


- (IBAction)three {
    
   
    
    
    all  =  [all stringByAppendingString:three];
    
    [_numLabel setText:all];
    
   
    
   // NSLog(@"load3 %@",all);
    
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }
    
    
}


- (IBAction)four {
    
    all  =  [all stringByAppendingString:four];
    
    [_numLabel setText:all];
    
    
    
  //  NSLog(@"load4 %@",all);
    
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }
    
}


- (IBAction)five {
    
    all  =  [all stringByAppendingString:five];
    
    [_numLabel setText:all];
    

    
  //  NSLog(@"load5 %@",all);
    
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }
    
    
}


- (IBAction)six {
    
    all  =  [all stringByAppendingString:six];
    
    [_numLabel setText:all];
    
    
    
  //  NSLog(@"load6 %@",all);
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }
    
}


- (IBAction)seven {
   
    all  =  [all stringByAppendingString:seven];
    
    [_numLabel setText:all];
    
    
  //  NSLog(@"load7 %@",all);
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }
    
}


- (IBAction)eight {
    
    all  =  [all stringByAppendingString:eight];
    
    [_numLabel setText:all];
    
    
  
    
   // NSLog(@"load8 %@",all);
    
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }
    
}


- (IBAction)nine {
    
   
    
    all  =  [all stringByAppendingString:nine];
    
    [_numLabel setText:all];
    
    
  //  NSLog(@"load9 %@",all);
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }
    
}


- (IBAction)zero {
    
    all  =  [all stringByAppendingString:zero];
    
    [_numLabel setText:all];
    
  //  NSLog(@"load0 %@",all);
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }
    
}


- (IBAction)star {
    
    all  =  [all stringByAppendingString:star];
    
    [_numLabel setText:all];
    
    
 //   NSLog(@"load * %@",all);
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }

}


- (IBAction)has {
    
    all  =  [all stringByAppendingString:hassh];
    
    [_numLabel setText:all];
    
    
  //  NSLog(@"load # %@",all);
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }

    
}


- (IBAction)plus {

    all  =  [all stringByAppendingString:plus];
    
    [_numLabel setText:all];
    
   
    
   // NSLog(@"load + %@",all);
    
    if ([all length] == 0) {
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
    }
    else{
        
        [_del_button setEnabled:true];
        [_call_Button setEnabled:true];
        
    }
    
    
}


- (IBAction)delete {
    
  //  loadSTR = @"";
    
    if ([all length] == 0) {// NSLog(@"BOOM NO STRING TO DELETE FIRST **** !!!! ");
        
        return;
    }
   
    
    
    NSString *copySTR = all; int i = 1;
    
    NSString *newString = [copySTR substringToIndex:[copySTR length]- i];
    
    NSLog(@"DELETE STR %@",newString);
    
    [_numLabel setText:newString];
    
    all = newString;
    
   // [_numLabel setText:@""];
    
   // NSLog(@"all length %d",[all length]);
   
    if ([all length] == 0) { //NSLog(@"BOOM NO STRING TO DELETE LAST **** !!!! ");
        
        [_del_button setEnabled:false];
        [_call_Button setEnabled:false];
        
       
    }
    
    
}


- (IBAction)Call {

    
        
    if ([all isEqualToString:@""]) {
        
       // NSLog(@"Phone call is not possible now");
    }else{
        
       // NSLog(@"Phone call is possible now");
        
      //  NSLog(@"all Value is %@",all);
        
//        NSArray *arr = [NSArray arrayWithObject:all];
//        NSLog(@"NSARRAY has %@",arr);
//        
//        [loadPhoneCall addObjectsFromArray:arr];
        
        
        NSDate *today1 = [NSDate date];
        NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
       
        [dateFormat1 setDateFormat:@"MM/dd/yy"];
        NSString *dateString1 = [dateFormat1 stringFromDate:today1];
        NSLog(@"%@", dateString1); //Date
        
        [dateFormat1 setDateFormat:@"hh:mma"];
        NSString   *sample13 =[dateFormat1 stringFromDate:today1];
        NSLog(@"%@",sample13); //Time

        
        NSString *dt = [NSString stringWithFormat:@"%@ %@",dateString1,sample13];
        NSLog(@"%@",dt);
        
        [loadDateTime removeAllObjects];
        [loadDateTime addObject:dt];
       // NSLog(@"Date-Time AR %@",loadDateTime);
        
        int arck1 = 0;
        
        if ([saveDateTime count]==arck1) {
            
           // NSLog(@"First DateTime");
            [saveDateTime addObjectsFromArray:loadDateTime];
          //  NSLog(@"saveDateTime has %@",savePhoneCall);
            
            
            
            saveDateTime=[[[saveDateTime reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array
          //  NSLog(@"saveDateTime REVERSE LOAD %@",saveDateTime);
            
        }else{
            
          //  NSLog(@"NOT ^^^ First DateTime");
            
            saveDateTime=[[[saveDateTime reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array  ** unreverse
         //   NSLog(@"SAVEPhonecall REVERSE LOAD %@",saveDateTime);
            
            [unrevArr_td removeAllObjects];
            [unrevArr_td addObjectsFromArray:saveDateTime];
         //   NSLog(@"unrevArr_td Arr %@",unrevArr_td);
            
            [unrevArr_td addObjectsFromArray:loadDateTime];
        //    NSLog(@"after adding new no %@",unrevArr_td);
            
            unrevArr_td=[[[unrevArr_td reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array  ** back 2 reverse
        //    NSLog(@"unrevArr_td REVERSE LOAD %@",unrevArr_td);
            
            
            [saveDateTime removeAllObjects];
            [saveDateTime addObjectsFromArray:unrevArr_td];
        //    NSLog(@"saveDateTime finally has %@",saveDateTime);
            
            
            
        }

        
        
        
        
        
        
      //  [saveDateTime addObjectsFromArray:loadDateTime];
      //  NSLog(@"saveDateTime has %@",saveDateTime);
        
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        [defaults1 setObject:saveDateTime forKey:@"savedateTime"];
        
        [defaults1 synchronize];
        
     //   NSLog(@"save dateTime def %@",saveDateTime);
        
        //boom YEAH
        
      //  NSDictionary *timeshit = @{@"timecrap":loadDateTime};
        
        
        //call *** code
        [loadPhoneCall removeAllObjects];
        [loadPhoneCall addObject:all];
     //   NSLog(@"ARRAY has %@",loadPhoneCall);
        
        int arck = 0;
        
        if ([savePhoneCall count]==arck) {
         
        //    NSLog(@"First CALL");
            [savePhoneCall addObjectsFromArray:loadPhoneCall];
        //    NSLog(@"SAVEPhonecall has %@",savePhoneCall);
            
            
            
            savePhoneCall=[[[savePhoneCall reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array
         //   NSLog(@"SAVEPhonecall REVERSE LOAD %@",savePhoneCall);
            
        }else{
        
      //   NSLog(@"NOT ^^^ First CALL");
            
            savePhoneCall=[[[savePhoneCall reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array  ** unreverse
        //    NSLog(@"SAVEPhonecall REVERSE LOAD %@",savePhoneCall);
            
            [unrevArr removeAllObjects];
            [unrevArr addObjectsFromArray:savePhoneCall];
         //   NSLog(@"Unrev Arr %@",unrevArr);
            
            [unrevArr addObjectsFromArray:loadPhoneCall];
        //    NSLog(@"after adding new no %@",unrevArr);
            
            unrevArr=[[[unrevArr reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array  ** back 2 reverse
        //    NSLog(@"unrevArr REVERSE LOAD %@",unrevArr);

            
            [savePhoneCall removeAllObjects];
            [savePhoneCall addObjectsFromArray:unrevArr];
         //   NSLog(@"SAVEPhonecall finally has %@",savePhoneCall);

            

        }
        
        
        
//        [savePhoneCall addObjectsFromArray:loadPhoneCall];
//        NSLog(@"SAVEPhonecall has %@",savePhoneCall);
//        
//        
//        
//        savePhoneCall=[[[savePhoneCall reverseObjectEnumerator] allObjects] mutableCopy]; //reverse array
//        NSLog(@"SAVEPhonecall REVERSE LOAD %@",savePhoneCall);
        
        
        
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:savePhoneCall forKey:@"savecalls"];
        
        [defaults synchronize];
        
     //   NSLog(@"save no %@",savePhoneCall);
        
        NSDictionary *callDict = @{@"callno":savePhoneCall,@"callstamp":saveDateTime};  //,@"dati":saveDateTime
        
        [[WCSession defaultSession]sendMessage:callDict replyHandler:^(NSDictionary *reply){
            
           // NSString *rhandler = [reply valueForKey:@"rhandle"];
            
           // NSLog(@"REPLY MSG %@",rhandler);
            
            
        }errorHandler:^(NSError *error){
            
        }];
        
        
         NSString *phoneNumber = [@"tel://" stringByAppendingString:all];
        [[WKExtension sharedExtension]openSystemURL:[NSURL URLWithString:phoneNumber]];
        
        
    }
    
    

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    retArray =[[defaults objectForKey:@"savecalls"]mutableCopy];
    
   // NSLog(@"WillActivate ret array %@",retArray);
    
    [savePhoneCall removeAllObjects];
    
    [savePhoneCall addObjectsFromArray:retArray];
    
   //  NSLog(@"WillActivate AFTER ret array %@",savePhoneCall);
    
    
    
    retArray1 = [[defaults objectForKey:@"saveConNum"]mutableCopy];
    
  //  NSLog(@"WillActivate ret array for saved %@",retArray1);
    
    [listSavedno removeAllObjects];
    
    [listSavedno addObjectsFromArray:retArray1];
    
   // NSLog(@"WillActivate AFTER ret array for Saved %@",listSavedno);

    
    
    
    retArray2 = [[defaults objectForKey:@"savedateTime"]mutableCopy];
    
  //  NSLog(@"WillActivate ret array for timedate %@",retArray2);
    
    [saveDateTime removeAllObjects];
    
    [saveDateTime addObjectsFromArray:retArray2];
    
   //  NSLog(@"WillActivate AFTER ret array for timedate %@",saveDateTime);
    
    
    
    
    if ([WCSession isSupported]) {
        
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
    }
    
    
    
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)FT_Save {
    
 //   NSLog(@"FT Save");

//    NSLog(@"all Value in SaveFT %@",all);

    
    if ([all isEqualToString:@""]) {
        
        WKAlertAction *act1 = [WKAlertAction actionWithTitle:@"OK" style:WKAlertActionStyleDefault handler:^(void){
            
            
        }];
        
        NSArray *loadaction = @[act1];
        
        [self presentAlertControllerWithTitle:@"Cannot Save !" message:@"\n Add some number in dailer & proceed" preferredStyle:WKAlertControllerStyleAlert actions:loadaction];
        
        
    }else {
    
    
    
    
    NSDictionary *savenum = @{@"numsave":all};
    
    [saveContactsArr removeAllObjects];
    
    [saveContactsArr addObject:all];
    
   // NSLog(@"To Save - %@",saveContactsArr);
    
    [listSavedno addObjectsFromArray:saveContactsArr];
    
   // NSLog(@"Final Saved List %@",listSavedno);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:listSavedno forKey:@"saveConNum"];
    
    [defaults synchronize];
    
   // NSLog(@"save Contacts Number %@",listSavedno);

    
    
    [[WCSession defaultSession]sendMessage:savenum replyHandler:^(NSDictionary *reply){
        
        NSString *getrp = [reply objectForKey:@"rhand"];
        
        NSLog(@"reply SAVED %@",getrp);
        
        
        
        
    }errorHandler:^(NSError *error){
        
    }];

    
    }//else
    
    
    
}

- (IBAction)FT_Recent {
    
     NSLog(@"FT Recent");
    
    
    
 //   NSDictionary *recentdict = @{@"RecentCalls":loadPhoneCall};
    
    [self pushControllerWithName:@"RIC" context:nil];
    
    
}


- (IBAction)FT_SavedNumbers {
    
    
   // NSLog(@"FT Saved Numbers");
    
    
    
    [self pushControllerWithName:@"savedlist" context:nil];
    
}




- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message replyHandler:(void(^)(NSDictionary<NSString *, id> *replyMessage))replyHandler{
    
  //  NSLog(@"didReceive for Del");
    
    
    NSArray *delArray = [message objectForKey:@"delnum"]; //phone number
    
 //   NSLog(@"delarray %@",delArray);
    
    NSArray *delArray_DT = [message objectForKey:@"delnumDT"]; //TIME DATE
    
  //  NSLog(@"delarray_DT %@",delArray_DT);

    
    
    if ([[message objectForKey:@"delnum"]isEqualToArray:delArray]) {
        
        [savePhoneCall removeAllObjects];
       
        [savePhoneCall addObjectsFromArray:delArray];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:savePhoneCall forKey:@"savecalls"];
        
        [defaults synchronize];
        
    //    NSLog(@"save no after parent del %@",savePhoneCall);

        //DT
        [saveDateTime removeAllObjects];
        
        [saveDateTime addObjectsFromArray:delArray_DT];
        
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        [defaults1 setObject:saveDateTime forKey:@"savedateTime"];
        
        [defaults1 synchronize];
        
   //     NSLog(@"save no after parent DT del %@",saveDateTime);
        
        
        
        
    }// Delete phone number & DateTime RIC
    
    
    
    NSArray *delArray1 = [message objectForKey:@"delSavnum"];
    
  //  NSLog(@"delarray for saved %@",delArray1);
    
    if ([[message objectForKey:@"delSavnum"]isEqualToArray:delArray1]) {
        
        [savedList removeAllObjects];
        
        [savedList addObjectsFromArray:delArray1];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:savedList forKey:@"saveConNum"];
        
        [defaults synchronize];
        
   //     NSLog(@"save Contacts Number-DEL from iOS %@",savedList);
        
        
        
        
        
    }// saved list DELETE from iOS ******
    
    
    
    
    
    
    
    NSArray *dvcArray = [message objectForKey:@"ckey"]; //phone number
    
  //  NSLog(@"dvcArray %@",dvcArray);
    
    NSArray *dvcArray_DT = [message objectForKey:@"dtkey"]; //TIME DATE
    
 //   NSLog(@"dvcArray_DT %@",dvcArray_DT);
    
    
    
    if ([[message objectForKey:@"ckey"]isEqualToArray:dvcArray]) {
        
        [savePhoneCall removeAllObjects];
        
        [savePhoneCall addObjectsFromArray:dvcArray];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:savePhoneCall forKey:@"savecalls"];
        
        [defaults synchronize];
        
    //    NSLog(@"save no after parent del-dvc %@",savePhoneCall);
        
        //DT
        [saveDateTime removeAllObjects];
        
        [saveDateTime addObjectsFromArray:dvcArray_DT];
        
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        [defaults1 setObject:saveDateTime forKey:@"savedateTime"];
        
        [defaults1 synchronize];
        
    //    NSLog(@"save no after parent DT del-dvc %@",saveDateTime);
        
        
        
        
    }// Delete phone number & DateTime ALL From iOS DVC

    
    
    
    
    NSArray *dvcArr_Saved = [message objectForKey:@"skey"];
    
 //   NSLog(@"dvcArr_Saved for saved %@",dvcArr_Saved);
    
    if ([[message objectForKey:@"skey"]isEqualToArray:dvcArr_Saved]) {
        
        [savedList removeAllObjects];
        
        [savedList addObjectsFromArray:dvcArr_Saved];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:savedList forKey:@"saveConNum"];
        
        [defaults synchronize];
        
     //   NSLog(@"save Contacts Number-DEL from iOS-dvc %@",savedList);
        
        
        
        
        
    }// saved list DELETE ALL from iOS DVC  ******
    
    
    
    
}

@end



