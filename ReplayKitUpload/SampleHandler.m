//
//  SampleHandler.m
//  ReplayKitUpload
//
//  Created by MENGCHEN on 2017/1/10.
//  Copyright © 2017年 MENGCHEN. All rights reserved.
//


#import "SampleHandler.h"

#import "ReplayKitUploader.h"
//  To handle samples with a subclass of RPBroadcastSampleHandler set the following in the extension's Info.plist file:
//  - RPBroadcastProcessMode should be set to RPBroadcastProcessModeSampleBuffer
//  - NSExtensionPrincipalClass should be set to this class

@interface SampleHandler()


@end


@implementation SampleHandler

- (void)broadcastStartedWithSetupInfo:(NSDictionary<NSString *,NSObject *> *)setupInfo {
    // User has requested to start the broadcast. Setup info from the UI extension will be supplied.
    NSLog(@"进行视频流的一些初始化工作");
    [[ReplayKitUploader sharedObject] setInfo:setupInfo];
    
}

- (void)broadcastPaused {
    // User has requested to pause the broadcast. Samples will stop being delivered.
    
    NSLog(@"%s",__func__);

    
    
}

- (void)broadcastResumed {
    // User has requested to resume the broadcast. Samples delivery will resume.
    NSLog(@"%s",__func__);

}

- (void)broadcastFinished {
    // User has requested to finish the broadcast.
    NSLog(@"%s",__func__);

}

- (void)processSampleBuffer:(CMSampleBufferRef)sampleBuffer withType:(RPSampleBufferType)sampleBufferType {
    //这里来发送音频视频数据
    NSLog(@"发送音频视频数据");
    switch (sampleBufferType) {
        case RPSampleBufferTypeVideo:
            // Handle audio sample buffer
            break;
        case RPSampleBufferTypeAudioApp:
            // Handle audio sample buffer for app audio
            break;
        case RPSampleBufferTypeAudioMic:
            // Handle audio sample buffer for mic audio
            break;
            
        default:
            break;
    }
    [[ReplayKitUploader sharedObject]handleBuffer:sampleBuffer];
    
    
}

@end
