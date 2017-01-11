//
//  MovieClipHandler.m
//  ReplayKitUpload
//
//  Created by MENGCHEN on 2017/1/10.
//  Copyright © 2017年 MENGCHEN. All rights reserved.
//

#import "MovieClipHandler.h"

@implementation MovieClipHandler

- (void)processMP4ClipWithURL:(NSURL *)mp4ClipURL setupInfo:(NSDictionary<NSString *,NSObject *> *)setupInfo finished:(BOOL)finished {
    
    // Get the endpoint URL supplied by the UI extension in the service info dictionary
    NSURL *endpointURL = [NSURL URLWithString:(NSString *)setupInfo[@"endpointURL"]];
    
    // Set up the request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:endpointURL];
    [request setHTTPMethod:@"POST"];
    
    // Upload the movie file with an upload task
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromFile:mp4ClipURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            // Handle the error locally
        }
        
        // Update broadcast settings
        RPBroadcastConfiguration *broadcastConfiguration = [[RPBroadcastConfiguration alloc] init];
        broadcastConfiguration.clipDuration = 5;
        
            // Tell ReplayKit that processing is complete for thie clip
        [self finishedProcessingMP4ClipWithUpdatedBroadcastConfiguration:broadcastConfiguration error:nil];
    }];
    
    [uploadTask resume];
}
@end
