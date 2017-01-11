//
//  ReplayKitUploader.h
//  ReplayKitDemo
//
//  Created by MENGCHEN on 2017/1/10.
//  Copyright © 2017年 MENGCHEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReplayKit/ReplayKit.h>
@interface ReplayKitUploader : NSObject
+(instancetype)sharedObject;
- (void)setInfo:(NSDictionary*)info;
- (void)handleBuffer:(CMSampleBufferRef)buffer;
@end
