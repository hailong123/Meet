//
//  HL_LoginAndRegistRequestTool.h
//  Meet
//
//  Created by SeaDragon on 2017/9/27.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//登录和注册请求工具类

#import "HL_BaseRequest.h"

@class HL_BaseRequest;

NS_ASSUME_NONNULL_BEGIN

@protocol loginAndRegistRequestToolDelegate <NSObject>

@required
- (void)loginAndRegistRequestSuccess:(HL_BaseRequest *)baseReqeust
                            response:(id)response
                          codeNumber:(NSInteger)codeNumber
                               error:(nullable NSError *)error;

@optional
- (void)loginAndRegistRequestFaild:(HL_BaseRequest *)baseRequest
                        codeNumber:(NSInteger)codeNumber
                             error:(nullable NSError *)error;

@end

@interface HL_LoginAndRegistRequestTool : HL_BaseRequest

@property (nonatomic, assign) id<loginAndRegistRequestToolDelegate>loginAndRegistDelegate;

//登录接口
- (void)loginWithPhoneNumber:(NSString *)phone password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
