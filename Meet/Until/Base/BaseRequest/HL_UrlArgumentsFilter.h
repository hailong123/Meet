//
//  HL_UrlArgumentsFilter.h
//  Meet
//
//  Created by SeaDragon on 2017/9/28.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_UrlArgumentsFilter : NSObject<YTKUrlFilterProtocol>

+ (HL_UrlArgumentsFilter *_Nullable)filterWithArguments:(NSDictionary *_Nullable)arguments;

- (NSString *)filterUrl:(NSString *)originUrl
            withRequest:(nonnull YTKBaseRequest *)request;

@end

NS_ASSUME_NONNULL_END
