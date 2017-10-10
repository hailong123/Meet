//
//  HL_LoginRequest.h
//  Meet
//
//  Created by SeaDragon on 2017/9/27.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//登录接口

#import "HL_BaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface HL_LoginRequest : HL_BaseRequest

- (instancetype)initWithPhone:(NSString *)phone password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
