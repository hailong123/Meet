//
//  HL_BaseRequest.h
//  Meet
//
//  Created by SeaDragon on 2017/9/27.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

typedef void(^SuccessBlock)(YTKBaseRequest *request, id responseData, NSError *error);
typedef void(^FaildBlock)(YTKBaseRequest *request, NSError *error);

@interface HL_BaseRequest : YTKRequest

- (void)startRequestWithCompletionBlockWithSuccess:(SuccessBlock)success
                                            failed:(FaildBlock)failed;

@end
