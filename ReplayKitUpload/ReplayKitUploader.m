//
//  ReplayKitUploader.m
//  ReplayKitDemo
//
//  Created by MENGCHEN on 2017/1/10.
//  Copyright © 2017年 MENGCHEN. All rights reserved.
//

#import "ReplayKitUploader.h"

@implementation ReplayKitUploader
+(instancetype)sharedObject{
    
    return [[self alloc]init];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static ReplayKitUploader * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [super allocWithZone:zone];
    });
    return manager;
}

-(void)handleBuffer:(CMSampleBufferRef)buffer{
    
    NSLog(@"%s",__func__);
}
-(void)setInfo:(NSDictionary *)info{
    NSLog(@"info = %@",info);
    
}

@end
