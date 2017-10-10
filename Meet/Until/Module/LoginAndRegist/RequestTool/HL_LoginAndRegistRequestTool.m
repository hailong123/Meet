//
//  HL_LoginAndRegistRequestTool.m
//  Meet
//
//  Created by SeaDragon on 2017/9/27.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_LoginAndRegistRequestTool.h"

#import "HL_LoginRequest.h"

@implementation HL_LoginAndRegistRequestTool {

    struct {
        unsigned int loginAndRegistRequestSuccessDelegate : 1;
        unsigned int loginAndRegistRequestFaildDelegate   : 1;
    }_hasDes;
}

//登录接口
- (void)loginWithPhoneNumber:(NSString *)phone password:(NSString *)password {

    HL_LoginRequest *loginRequest = [[HL_LoginRequest alloc] initWithPhone:phone
                                                                  password:password];
    
    [loginRequest startRequestWithCompletionBlockWithSuccess:^(YTKBaseRequest *request, id responseData, NSError *error) {
        if (_hasDes.loginAndRegistRequestSuccessDelegate) {
            [self.loginAndRegistDelegate loginAndRegistRequestSuccess:self
                                                             response:responseData
                                                           codeNumber:[request.responseObject[@"code"] integerValue]
                                                                error:error];
        }
    } failed:^(YTKBaseRequest *request, NSError *error) {
        if (_hasDes.loginAndRegistRequestFaildDelegate) {
            [self.loginAndRegistDelegate loginAndRegistRequestFaild:self
                                                         codeNumber:[request.responseObject[@"code"] integerValue]
                                                              error:error];
        }
    }];
}

#pragma mark - Setter And Getter
- (void)setLoginAndRegistDelegate:(id<loginAndRegistRequestToolDelegate>)loginAndRegistDelegate {

    _loginAndRegistDelegate  = loginAndRegistDelegate;
    
    _hasDes.loginAndRegistRequestSuccessDelegate = [self.loginAndRegistDelegate respondsToSelector:@selector(loginAndRegistRequestSuccess:response:codeNumber:error:)];
    _hasDes.loginAndRegistRequestFaildDelegate = [self.loginAndRegistDelegate respondsToSelector:@selector(loginAndRegistRequestFaild:codeNumber:error:)];
    
}

@end
