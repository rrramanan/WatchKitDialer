//
//  DetailViewController.m
//  watchDailer
//
//  Created by Vinod Ramanathan on 14/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import "DetailViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>


@interface DetailViewController ()<WCSessionDelegate>

@end

@implementation DetailViewController
NSMutableArray *detailload;
NSMutableArray *detailload1;
NSMutableArray *detailload2;
NSMutableArray *sectionload;

NSMutableArray *getcallno; NSMutableArray *getcalllocal;
NSMutableArray *getsavedno; NSMutableArray *getsavedlocal;
NSMutableArray *getTD; NSMutableArray *getTDLocal;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  //  NSLog(@"dvc did load");
    if ([WCSession isSupported]) {
        
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
    }
    
    
    [_detailTable setDelegate:self];
    [_detailTable setDataSource:self];
    
    detailload = [[NSMutableArray alloc]initWithObjects:@"About", nil];
    
    detailload1 = [[NSMutableArray alloc]initWithObjects:@"Store",@"Feedback", nil];
    
    detailload2 = [[NSMutableArray alloc]initWithObjects:@"Delete All Calls",@"Delete All Saved", nil];

    sectionload = [[NSMutableArray alloc]initWithObjects:@"Details",@"Rate Us",@"Delete", nil];
    
    getcallno = [[NSMutableArray alloc]init]; getcalllocal = [[NSMutableArray alloc]init];
    
    getsavedno = [[NSMutableArray alloc]init]; getsavedlocal = [[NSMutableArray alloc]init];

    getTD = [[NSMutableArray alloc]init]; getTDLocal = [[NSMutableArray alloc]init];
    
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    getcallno = [[def objectForKey:@"callKey"]mutableCopy]; //mutable copy
    
    
  //  NSLog(@"NSUSER DID LOAD - del arr %@",getcallno);
    
    
    [getcalllocal addObjectsFromArray:getcallno];
    
  //  NSLog(@"NSUSER DID LOAD - getcalllocal %@",getcalllocal);

    
    
    //for saved no
    
    NSUserDefaults *def1 = [NSUserDefaults standardUserDefaults];
    
    getsavedno = [[def1 objectForKey:@"numKey"]mutableCopy];
    
 //   NSLog(@"NSUSER DID LOAD - del arr1 %@",getsavedno);
    
    [getsavedlocal addObjectsFromArray:getsavedno];
    
 //   NSLog(@"NSUSER DID LOAD - local %@",getsavedlocal);
    
    
    //for Date and Time
    
    NSUserDefaults *def2 = [NSUserDefaults standardUserDefaults];
    
    getTD = [[def2 objectForKey:@"callTD"]mutableCopy];
    
 //   NSLog(@"NSUSER DID LOAD - dateret %@",getTD);
    
    [getTDLocal addObjectsFromArray:getTD];
    
 //   NSLog(@"NSUSER DID LOAD - Local%@",getTDLocal);
    
    
    
    
    
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [sectionload count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
          return [detailload count];
    }
    if (section == 1) {
        
        return [detailload1 count];
        
    }
    if (section == 2) {
        
        return [detailload2 count];
        
    }
    
    return 0;
  
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionload objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
 
    
    if (indexPath.section == 0) {
        
           cell.textLabel.text = [detailload objectAtIndex:indexPath.row];
        
    }
    
    if (indexPath.section == 1) {
        
        cell.textLabel.text = [detailload1 objectAtIndex:indexPath.row];
        
    }
    
    if (indexPath.section == 2) {
        
        cell.textLabel.text = [detailload2 objectAtIndex:indexPath.row];
        
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 2) {
        
        
        if (indexPath.row == 0) {
            
         //   NSLog(@"BOOM Yeah");
            
            [getcalllocal removeAllObjects];
            
            // NSLog(@"getcall - %@",getcalllocal);
            
            NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
            
            [usrdefaults setObject:getcalllocal forKey:@"callKey"];
            
            [usrdefaults synchronize];
            

            [getTDLocal removeAllObjects];
            
            // NSLog(@"getTD - %@",getTDLocal);
            
            NSUserDefaults *usrdefaults1 = [NSUserDefaults standardUserDefaults];
            
            [usrdefaults1 setObject:getTDLocal forKey:@"callTD"];
            
            [usrdefaults1 synchronize];

            
            NSDictionary *dvc = @{@"ckey":getcalllocal,@"dtkey":getTDLocal};
            
           
            [[WCSession defaultSession]sendMessage:dvc replyHandler:^(NSDictionary *reply){
                
                
                
            }errorHandler:^(NSError *error){
                
            }];

            
            
            
            
            
        }
        
        
        
        if (indexPath.row == 1) {
            
          //  NSLog(@"BOOM");
            
            
            [getsavedlocal removeAllObjects]; // NSLog(@"getSaved - %@",getsavedlocal);
            
            NSUserDefaults *usrdefaults1 = [NSUserDefaults standardUserDefaults];
            
            [usrdefaults1 setObject:getsavedlocal forKey:@"numKey"];
            
            [usrdefaults1 synchronize];

            
            NSDictionary *dvc1 = @{@"skey":getsavedlocal};
            
            
            [[WCSession defaultSession]sendMessage:dvc1 replyHandler:^(NSDictionary *reply){
                
                
                
            }errorHandler:^(NSError *error){
                
            }];
            
            
            
            
        }
        
        
    }
    
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
 //dvc
 
 
 
 NSDictionary *getoffline1 = @{@"offdvc":@"offdget"};
 
 [[WCSession defaultSession]sendMessage:getoffline1 replyHandler:^(NSDictionary *reply1){
 
 NSMutableArray *getsg4 = [reply1 objectForKey:@"sg4"];
 
 NSLog(@"reply offline1 sg4 %@",getsg4);
 
 
 NSMutableArray *getsg5 = [reply1 objectForKey:@"sg5"];
 
 NSLog(@"reply offline1 sg5 %@",getsg5);
 
 
 NSMutableArray *getsg6 = [reply1 objectForKey:@"sg6"];
 
 NSLog(@"reply offline1 sg6 %@",getsg6);
 
 
 
 //log
 
 NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
 
 [userdefault setObject:getsg4 forKey:@"savecalls"];
 
 [userdefault synchronize];
 
 NSLog(@"save no in AWAKE - dvc %@",savePhoneCall);
 
 //saved list
 
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 
 [defaults setObject:getsg5 forKey:@"saveConNum"];
 
 [defaults synchronize];
 
 NSLog(@"save Contacts Number in AWAKE - dvc %@",listSavedno);
 
 //DT
 
 NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
 
 [defaults1 setObject:getsg6 forKey:@"savedateTime"];
 
 [defaults1 synchronize];
 
 NSLog(@"save DT in AWAKE - dvc %@",saveDateTime);
 
 
 
 
 
 }errorHandler:^(NSError *error){
 
 }];

 */



/*
 
 - (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message replyHandler:(void(^)(NSDictionary<NSString *, id> *replyMessage))replyHandler{
 
 
 
 if ([[message objectForKey:@"offdvc"]isEqualToString:@"offdget"]) {
 
 
 
 NSDictionary *offload1 = @{@"sg4":getcalllocal,@"sg5":getsavedlocal,@"sg6":getTDLocal};
 replyHandler(offload1);
 
 
 
 }//
 
 
 
 
 
 
 }

 */

@end
