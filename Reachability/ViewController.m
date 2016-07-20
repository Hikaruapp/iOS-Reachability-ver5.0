//
//  ViewController.m
//  Reachability
//
//  Created by Yanase Yuji on 2016/07/20.
//  Copyright © 2016年 hikaruApp. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelRemoteStatus;
@property (weak, nonatomic) IBOutlet UILabel *labelTCPIPStatus;

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;

- (IBAction)buttonRemoteStatus:(id)sender;
- (IBAction)buttonTCPIPStatus:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Remote Host: www.aaple.com
    NSString *remoteHostName = @"www.apple.com";
    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    
    // TCP/IP Routing Available
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonRemoteStatus:(id)sender {
    NSInteger status = [self.hostReachability currentReachabilityStatus];
    self.labelRemoteStatus.text = [self stringCodeReachabilityStatus:status];
}

- (IBAction)buttonTCPIPStatus:(id)sender {
    NSInteger status = [self.internetReachability currentReachabilityStatus];
    self.labelTCPIPStatus.text = [self stringCodeReachabilityStatus:status];
}

- (NSString *)stringCodeReachabilityStatus:(NetworkStatus )statuscode {
    switch (statuscode) {
        case NotReachable:     return @"NotReachable";     break;
        case ReachableViaWiFi: return @"ReachableViaWiFi"; break;
        case ReachableViaWWAN: return @"ReachableViaWWAN"; break;
        default:
            return @"NotCode";break;
    }
}

@end
