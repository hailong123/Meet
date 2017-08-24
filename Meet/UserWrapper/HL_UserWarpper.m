//
//  HL_UserWarpper.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//全局存储类

#import "HL_UserWarpper.h"

@implementation HL_UserWarpper


+ (instancetype)sharedInstance {

    static HL_UserWarpper *_instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [[HL_UserWarpper alloc] init];
    });
    
    return _instance;
}



@end
