//
//  HL_LoginRequest.m
//  Meet
//
//  Created by SeaDragon on 2017/9/27.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_LoginRequest.h"

@interface HL_LoginRequest () {

    NSString *_phone;
    NSString *_password;
}

@end

@implementation HL_LoginRequest

- (instancetype)initWithPhone:(NSString *)phone password:(NSString *)password {

    if (self = [super init]) {
        _phone    = phone;
        _password = password;
    }
    
    return self;
}

- (NSString *)requestUrl {
    return @"test";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {

    return @{
             @"phoneNumber":_phone,
             @"password":_password
             };
}

@end
