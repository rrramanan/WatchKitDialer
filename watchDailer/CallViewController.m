//
//  CallViewController.m
//  watchDailer
//
//  Created by Vinod Ramanathan on 14/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import "CallViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface CallViewController ()<WCSessionDelegate>

@end

@implementation CallViewController
NSMutableArray *testload;  NSMutableArray *tabsg1;
NSMutableArray *testload1;
NSMutableArray *timeandDate;

NSMutableArray *addarr;
NSMutableArray *delarr;
NSMutableArray *delarr1;
NSMutableArray *dateret;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  //  NSLog(@"DID LOAD");
    
    tabsg1 = [[NSMutableArray alloc]init];
    
     testload = [[NSMutableArray alloc]init];
    testload1 = [[NSMutableArray alloc]init];
    timeandDate =[[NSMutableArray alloc]init];
    
    addarr = [[NSMutableArray alloc]init];
    delarr = [[NSMutableArray alloc]init];
    delarr1 = [[NSMutableArray alloc]init];
    dateret =[[NSMutableArray alloc]init];
    
    [_callTable setDelegate:self];
    [_callTable setDataSource:self];
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    delarr = [[def objectForKey:@"callKey"]mutableCopy]; //mutable copy
    
    
  //  NSLog(@"NSUSER DID LOAD - del arr %@",delarr);
    
    
    [testload addObjectsFromArray:delarr];
    
 //   NSLog(@"NSUSER DID LOAD - test load %@",testload);

    
    [tabsg1 addObjectsFromArray:delarr]; // NSLog(@"NSUSER DID LOAD - tabsg1 %@",tabsg1);
    
    tabsg1 =[NSMutableArray arrayWithArray:delarr];

    
    //for saved no
    
    NSUserDefaults *def1 = [NSUserDefaults standardUserDefaults];
    
    delarr1 = [[def1 objectForKey:@"numKey"]mutableCopy];
    
  //  NSLog(@"NSUSER DID LOAD - del arr1 %@",delarr1);
    
    [testload1 addObjectsFromArray:delarr1];
    
  //  NSLog(@"NSUSER DID LOAD - test load1 %@",testload1);

    
    
    //for Date and Time
    
    NSUserDefaults *def2 = [NSUserDefaults standardUserDefaults];
    
    dateret = [[def2 objectForKey:@"callTD"]mutableCopy];
    
   // NSLog(@"NSUSER DID LOAD - dateret %@",dateret);
    
    [timeandDate addObjectsFromArray:dateret];
    
  //  NSLog(@"NSUSER DID LOAD - timeandDate %@",timeandDate);
    
    
    
    
    
    if ([WCSession isSupported]) {
        
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
    }
    
   
  //  testload = [[NSMutableArray alloc]initWithObjects:@"One",@"Two", nil];
  //  testload1 = [[NSMutableArray alloc]initWithObjects:@"One_1",@"Two_2",@"Three",@"Four",@"Five", nil];
    
    if(_segmentctrl.selectedSegmentIndex == 0)
        
    {  //tab
    if ([testload count] == 0) {
        
      //  NSLog(@"Count is zero");
        
        _callTable.hidden = TRUE;
        _nocall_label.hidden = FALSE;
        _savedCall_label.hidden =TRUE;
       
        
    }else{
        
        
      //  NSLog(@"Count is not zero");
        
        _callTable.hidden = FALSE;
        _nocall_label.hidden = TRUE;

        _savedCall_label.hidden =TRUE;
        
        
    }//
    
    }else  if(_segmentctrl.selectedSegmentIndex == 1)
        
    {

    
    if ([testload1 count] == 0) {
        
      //  NSLog(@"Count is zero - TestLoad1");
        
        _callTable.hidden = TRUE;
        _nocall_label.hidden = TRUE;
        _savedCall_label.hidden =FALSE;
        
    }else{
        
        
      //  NSLog(@"Count is not zero - TestLoad1");
        
        _callTable.hidden = FALSE;
        _nocall_label.hidden = TRUE;
        _savedCall_label.hidden =TRUE;
        
        
        
    }
        
    }//

    
    
    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   
    if(_segmentctrl.selectedSegmentIndex == 0)
        
    {
        return [testload count]; //tab
        
    }
    else  if(_segmentctrl.selectedSegmentIndex == 1)
        
    {
        
        return [testload1 count];
    }
    
    return 0;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   

   
    if(_segmentctrl.selectedSegmentIndex == 0)
        
    {
        
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];

        
        cell.textLabel.text = [testload objectAtIndex:indexPath.row]; //tab
        
        cell.detailTextLabel.text = [timeandDate objectAtIndex:indexPath.row];
        
        
        
    }
   else  if(_segmentctrl.selectedSegmentIndex == 1)
        
    {
        
        cell = [[UITableViewCell alloc] initWithStyle:NO reuseIdentifier:@"cell"];


        
         cell.textLabel.text = [testload1 objectAtIndex:indexPath.row];
        
        
    }
    
    return cell;
    
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(_segmentctrl.selectedSegmentIndex == 0){
        
        // ** one
        
        
        
            
            //**** NEW
            
          //  NSLog(@"TestLoad before left swipe %@",testload);
            
            
            [testload removeObjectAtIndex:indexPath.row]; //tab
            
            
        //    NSLog(@"TestLoad AFTER **** left swipe %@",testload);
        
        
        //     NSLog(@"timeandDate before left swipe %@",timeandDate);
        
            [timeandDate removeObjectAtIndex:indexPath.row];
        
      //       NSLog(@"timeandDate AFTER **** left swipe %@",timeandDate);
            
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            
            
            
        
       
        
      //  NSDictionary *delnumP = @{@"delnum":testload};
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:testload forKey:@"callKey"];
        
        [defaults synchronize];

        
      //   NSDictionary *delnumDT = @{@"delnumDT":timeandDate};
        
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        
        [defaults1 setObject:timeandDate forKey:@"callTD"];
        
        [defaults1 synchronize];
        
        
        
        [[WCSession defaultSession]sendMessage:@{@"delnum":testload,@"delnumDT":timeandDate} replyHandler:^(NSDictionary *reply){
            
            
            
        }errorHandler:^(NSError *error){
            
        }];

        //tab
        
            if ([testload count] == 0) {
                
            //    NSLog(@"Count is zero in delete");
                
                _callTable.hidden = TRUE;
                _nocall_label.hidden = FALSE;
                 _savedCall_label.hidden = TRUE;
                
            }else{
                
                
           //     NSLog(@"Count is not zero in delete");
                
                _callTable.hidden = FALSE;
                _nocall_label.hidden = TRUE;
                _savedCall_label.hidden = TRUE;
            
        }

        
        
}//
    
   else if(_segmentctrl.selectedSegmentIndex == 1){
        
        [testload1 removeObjectAtIndex:indexPath.row];
        
         [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
       
       
        NSDictionary *delsavedNum = @{@"delSavnum":testload1};
       
       NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
       
       [defaults setObject:testload1 forKey:@"numKey"];
       
       [defaults synchronize];

       
       [[WCSession defaultSession]sendMessage:delsavedNum replyHandler:^(NSDictionary *reply){
           
           
           
       }errorHandler:^(NSError *error){
           
       }];
       

       
       
       if ([testload1 count] == 0) {
           
           _callTable.hidden = TRUE;
           _nocall_label.hidden = TRUE;
           _savedCall_label.hidden = FALSE;
           
           
           
       }else{
           
           _callTable.hidden = FALSE;
           _nocall_label.hidden = TRUE;
           _savedCall_label.hidden = TRUE;
           
          
           
       }

       
    }//
    
   
    
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message replyHandler:(void(^)(NSDictionary<NSString *, id> *replyMessage))replyHandler{
    
  //  NSLog(@"didReceive");
   
    
    // *** Save Call Log from Watch ***
    
    NSArray *str1 = [message valueForKey:@"callno"];
  //  NSLog(@"DICT1 CHK %@",str1);
  
    // ******* Get Date and Time for call made
    
    NSArray *stp = [message valueForKey:@"callstamp"];
  //  NSLog(@"DICT1.1 callstamp %@",stp);
    
    if ([[message objectForKey:@"callno"]isEqualToArray:str1]) {
    
        dispatch_async(dispatch_get_main_queue(), ^{
        // code here
        
            
            
            [testload removeAllObjects];
            
            [testload addObjectsFromArray:str1];

       
        
      //  NSLog(@"did rec - array %@",testload);        //tab***
        
    
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:testload forKey:@"callKey"];
        
        [defaults synchronize];
        
            
       
            
         //   NSLog(@"TIME BOMB");
            [timeandDate removeAllObjects];
            
          
            
            [timeandDate addObjectsFromArray:stp];
            
      //      NSLog(@"TIME & DATE ar - %@",timeandDate);
            
            
            NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
            
            [defaults1 setObject:timeandDate forKey:@"callTD"];
            
            [defaults1 synchronize];
            
            [_callTable reloadData];

        
    });
    
    }//
    
    
    
    
    // **** Del Phone Number i.e call Log from watch ****
    
    
    NSArray *str2 = [message valueForKey:@"delAr"];
    
   // NSLog(@"DICT2 CHK %@",str2);
    
    // **** Del date time for call log from watch ****
    
    NSArray *str23 = [message valueForKey:@"delArdate"];
    
   // NSLog(@"DICT2.1 CHK datetime %@",str23);
    
    
    if ([[message objectForKey:@"delAr"]isEqualToArray:str2]) {
    
     dispatch_async(dispatch_get_main_queue(), ^{
    
       

        
        
         [testload removeAllObjects];
         
         [testload addObjectsFromArray:str2];

         
         
       ///  NSLog(@"did rec 2nd key- array NEW %@",testload);
         
        
         
             NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
             
             [defaults1 setObject:testload forKey:@"callKey"];
             
             [defaults1 synchronize];
             
             [_callTable reloadData];
         
         
         
         // del time and date from watch  ****
         
         
         
         
        // NSLog(@"TIME BOMB new all");
         [timeandDate removeAllObjects];
         
         //  timeandDate = [message valueForKey:@"callstamp"];
         
         [timeandDate addObjectsFromArray:str23];
         
       //  NSLog(@"TIME & DATE ar - %@",timeandDate);
         
         
         NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
         
         [defaults setObject:timeandDate forKey:@"callTD"];
         
         [defaults synchronize];
         
         [_callTable reloadData];
         
         
         
         
        

     });
        
    }//
    
    
    // *** save Contact From Watch  ****
    
    NSString  *str3 = [message valueForKey:@"numsave"];
   // NSLog(@"DICT3 CHK SAVE %@",str3);
    
    if ([[message objectForKey:@"numsave"]isEqualToString:str3]) {
      
        dispatch_async(dispatch_get_main_queue(), ^{
            // code here
            
            
            [testload1 addObject:str3];
            
            // NSLog(@"call load %@",callload);
            
            
            //[testload addObject:callload];
            
         //   NSLog(@"did rec - array for SAVE %@",testload1);
            
            
            NSDictionary *rhand = @{@"rhand":testload1};
            
            replyHandler(rhand);
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:testload1 forKey:@"numKey"];
            
            [defaults synchronize];
            
            [_callTable reloadData];
            
            
            
        });
        
    }//

    
    // *** Delete Saved Contact list from Watch ****
    
    NSArray *str4 = [message valueForKey:@"delsavedCLST"];
   // NSLog(@"DICT4 CHK DEL SAVED CONTACT LIST %@",str4);
    
    if ([[message objectForKey:@"delsavedCLST"]isEqualToArray:str4]) {

        dispatch_async(dispatch_get_main_queue(), ^{
            // code here
            
            testload1 = [message valueForKey:@"delsavedCLST"];
            
         //   NSLog(@"did rec - array after DEL -SAVED CONTACTS LIST- %@",testload1);
            
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:testload1 forKey:@"numKey"];
            
            [defaults synchronize];
            
            [_callTable reloadData];
            //show label **** imm
            
        });

  
    
    }//
    
    
    
    
    
    
    //****** get data from iOS app when watch starts **** /
    
    
    if ([[message objectForKey:@"offline"]isEqualToString:@"offcatch"]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // code here
            
          
            
            
            NSDictionary *offload = @{@"sg1":testload,@"sg2":testload1,@"sg3":timeandDate};
            replyHandler(offload);
            
            
        });
        
        
        
    }//
    
        
    
    

    
    
    
    //****** updated call log from RIC  **** /

    NSArray *str5 = [message valueForKey:@"updatedLog"];
  //  NSLog(@"DICT5  updated call log from RIC %@",str5);
    //
    
    //****** updated call log TIME DATE from RIC  **** /
    
    
    NSArray *str51 = [message valueForKey:@"updatedlogStamp"];
   // NSLog(@"DICT5  updated call log TIME DATE from RIC %@",str51);
    
    
    
    if ([[message objectForKey:@"updatedLog"]isEqualToArray:str5]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // code here
            
            [testload  removeAllObjects];
            [testload addObjectsFromArray:str5];
           
       //     NSLog(@"updated log from RIC %@",testload);
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:testload forKey:@"callKey"];
            
            [defaults synchronize];
            
          //  [_callTable reloadData];
            
            
            //****** timedate
            
            
            
            [timeandDate removeAllObjects];
            
            //  timeandDate = [message valueForKey:@"callstamp"];
            
            [timeandDate addObjectsFromArray:str51];
            
       //     NSLog(@"TIME & DATE ar updatedlogStamp - %@",timeandDate);
            
            
            NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
            
            [defaults1 setObject:timeandDate forKey:@"callTD"];
            
            [defaults1 synchronize];
            
            [_callTable reloadData];

            
            
            
            
            
        });
        
        
        
    }//
    
    
    
    
    
    
    

    
    
    //****** updated call log from Saved List  **** /
    
    NSArray *str6 = [message valueForKey:@"updatedLogfromSaved"];
  //  NSLog(@"DICT5  updated call log from Saved List %@",str6);
    
    //****** updated call log TIME DATE from Saved List  **** /
        NSArray *str61 = [message valueForKey:@"updatedLogStampfromSaved"];
  //  NSLog(@"DICT5  updated call log from Saved List %@",str61);
    
    if ([[message objectForKey:@"updatedLogfromSaved"]isEqualToArray:str6]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // code here
            
            [testload  removeAllObjects];
            [testload addObjectsFromArray:str6];
            
       //     NSLog(@"updated log from saved list %@",testload);
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:testload forKey:@"callKey"];
            
            [defaults synchronize];
            
            
            // code here *****
            
            
            [timeandDate removeAllObjects];
            
          
            
            [timeandDate addObjectsFromArray:str61];
            
      //      NSLog(@"TIME & DATE ar LogStampfromSaved - %@",timeandDate);
            
            
            NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
            
            [defaults1 setObject:timeandDate forKey:@"callTD"];
            
            [defaults1 synchronize];
            
            [_callTable reloadData];
            
            
            
            
        });
        
        
        
    }//

    
    
    
   
    
    
    
    
    
    
    

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)segmentACTION:(id)sender {
    
    
    
    if(_segmentctrl.selectedSegmentIndex == 0)
        
    {
        
     //   NSLog(@"SEGMENT CONTROL ID 0"); //tab
        if ([testload count] == 0) {
            
          //  NSLog(@"Count is zero");
            
            _callTable.hidden = TRUE;
            _nocall_label.hidden = FALSE;
               _savedCall_label.hidden = TRUE;
             [_callTable reloadData];
            
            
        }else{
            
            
          //  NSLog(@"Count is not zero");
            
            _callTable.hidden = FALSE;
            _nocall_label.hidden = TRUE;
               _savedCall_label.hidden = TRUE;
             [_callTable reloadData];
            
        }

      
        
    }//
    
    if(_segmentctrl.selectedSegmentIndex == 1)
        
    {
        
      //  NSLog(@"SEGMENT CONTROL ID 1");
        
        if ([testload1 count] == 0) {
            
            _callTable.hidden = TRUE;
            _nocall_label.hidden = TRUE;
            _savedCall_label.hidden = FALSE;
            
            [_callTable reloadData];
            
        }else{
           
            _callTable.hidden = FALSE;
            _nocall_label.hidden = TRUE;
            _savedCall_label.hidden = TRUE;
            
            [_callTable reloadData];
            
        }
        
        
    }//

    
    
    
}
- (IBAction)editTable:(id)sender {
    
   
    
    
    if ([_callTable isEditing]) {
        
       // NSLog(@"EDITING");
        
        [_editBut setTitle:@"Edit"];
        
         [_callTable setEditing:NO animated:YES];
        
        
    }else{
       //  NSLog(@"NOT EDITING");
        [_editBut setTitle:@"Done"];
        
        
         [_callTable setEditing:YES animated:YES];
    }
    
    
}

-(void)viewDidAppear:(BOOL)animated{
   // NSLog(@"viewDidAppear");
    
    //[_callTable reloadData];
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    delarr = [[def objectForKey:@"callKey"]mutableCopy]; //mutable copy
    
    
  //  NSLog(@"NSUSER DID Appear - del arr %@",delarr);
    
    [testload removeAllObjects];
    
    [testload addObjectsFromArray:delarr];
    
 //   NSLog(@"NSUSER DID Appear - test load %@",testload);
    
    if (testload == nil) {
        
        _nocall_label.hidden =false;
    }
    
    //for saved no
    
    NSUserDefaults *def1 = [NSUserDefaults standardUserDefaults];
    
    delarr1 = [[def1 objectForKey:@"numKey"]mutableCopy];
    
  //  NSLog(@"NSUSER DID Appear - del arr1 %@",delarr1);
    
    [testload1 removeAllObjects];

    
    [testload1 addObjectsFromArray:delarr1];
   
  //  NSLog(@"NSUSER DID Appear - test load1 %@",testload1);
    if (testload1 == nil) {
        
        _savedCall_label.hidden =false;
    }
    
    
    //for Date and Time
    
    NSUserDefaults *def2 = [NSUserDefaults standardUserDefaults];
    
    dateret = [[def2 objectForKey:@"callTD"]mutableCopy];
    
 //   NSLog(@"NSUSER DID Appear - dateret %@",dateret);
    
    [timeandDate removeAllObjects];
    
    [timeandDate addObjectsFromArray:dateret];
    
 //   NSLog(@"NSUSER DID Appear - timeandDate %@",timeandDate);
    
    [_callTable reloadData];
    
    
}

@end
