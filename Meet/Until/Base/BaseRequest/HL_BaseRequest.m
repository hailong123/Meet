//
//  HL_BaseRequest.m
//  Meet
//
//  Created by SeaDragon on 2017/9/27.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_BaseRequest.h"

@implementation HL_BaseRequest

- (instancetype)init {

    if (self = [super init]) {
        [self converContentTypeConfig];
    }
    
    return self;
}

- (void)converContentTypeConfig {
    
    YTKNetworkAgent *agent = [YTKNetworkAgent sharedAgent];
    
    NSSet *acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                     @"text/json",
                                     @"text/javascript",
                                     @"text/plain",
                                     @"text/html",
                                     @"text/css", nil];
    
    NSString *keypath = @"jsonResponseSerializer.acceptableContentTypes";
    
    [agent setValue:acceptableContentTypes forKeyPath:keypath];
    
}

- (void)startRequestWithCompletionBlockWithSuccess:(SuccessBlock)success
                                            failed:(FaildBlock)failed {

    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        if (success) {
            
            NSError *error = nil;
            
            NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:&error];
            
            success(request,dicData[@"data"],request.error);
        }
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        if (failed) {
            failed(request,request.error);
        }
        
    }];
    
}

- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (NSTimeInterval)requestTimeoutInterval {
    return 30;
}

@end
