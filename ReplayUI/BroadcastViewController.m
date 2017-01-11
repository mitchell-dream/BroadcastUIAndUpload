//
//  BroadcastViewController.m
//  ReplayUI
//
//  Created by MENGCHEN on 2017/1/10.
//  Copyright © 2017年 MENGCHEN. All rights reserved.
//

#import "BroadcastViewController.h"

@implementation BroadcastViewController



- (IBAction)cancelClick:(id)sender {
    NSLog(@"%s",__func__);
    [self userDidCancelSetup];
}
- (IBAction)okClick:(id)sender {
    NSLog(@"%s",__func__);
    [self userDidFinishSetup];
}



// Called when the user has finished interacting with the view controller and a broadcast stream can start
- (void)userDidFinishSetup {
    
    // Broadcast url that will be returned to the application
    NSURL *broadcastURL = [NSURL URLWithString:@"http://broadcastURL_example/stream1"];
    
    // Service specific broadcast data example which will be supplied to the process extension during broadcast
    NSString *userID = @"user1";
    NSString *endpointURL = @"http://broadcastURL_example/stream1/upload";
    NSDictionary *setupInfo = @{ @"userID" : userID, @"endpointURL" : endpointURL };
    
    // Set broadcast settings
    RPBroadcastConfiguration *broadcastConfig = [[RPBroadcastConfiguration alloc] init];
    broadcastConfig.clipDuration = 5.0; // deliver movie clips every 5 seconds
    
    // Tell ReplayKit that the extension is finished setting up and can begin broadcasting
    [self.extensionContext completeRequestWithBroadcastURL:broadcastURL broadcastConfiguration:broadcastConfig setupInfo:setupInfo];
}

- (void)userDidCancelSetup {
    // Tell ReplayKit that the extension was cancelled by the user
    [self.extensionContext cancelRequestWithError:[NSError errorWithDomain:@"YourAppDomain" code:-1     userInfo:nil]];
}

@end
