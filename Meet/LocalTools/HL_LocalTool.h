//
//  HL_LocalTool.h
//  Meet
//
//  Created by SeaDragon on 2017/9/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//本地工具类

#import <Foundation/Foundation.h>

@interface HL_LocalTool : NSObject

//匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;

//正则匹配6~18位密码
+ (BOOL)checkPassword:(NSString *) password;

@end
