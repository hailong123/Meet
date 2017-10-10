//
//  HL_UrlArgumentsFilter.m
//  Meet
//
//  Created by SeaDragon on 2017/9/28.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//给接口提供公共的参数

#import "HL_UrlArgumentsFilter.h"

#import <YTKNetwork/YTKNetworkAgent.h>

@interface HL_UrlArgumentsFilter () {

    NSDictionary *_arguments;
    
}

@end

@implementation HL_UrlArgumentsFilter

+ (HL_UrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments {
    return [[self alloc] initWithArguments:arguments];
}

- (instancetype)initWithArguments:(NSDictionary *)arguments {

    if (self = [super init]) {
        _arguments = arguments;
    }
    
    return self;
}

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {
    return [self urlStringWithOriginUrlString:originUrl appendParameters:_arguments];
}

- (NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString
                          appendParameters:(NSDictionary *)parameters {
    
    NSString *paraUrlString = AFQueryStringFromParameters(parameters);
    
    if (!(paraUrlString.length > 0)) {
        return originUrlString;
    }
    
    BOOL useDummyUrl = NO;
    
    static NSString *dummyUrl = nil;
    
    NSURLComponents *components = [NSURLComponents componentsWithString:originUrlString];
    
    if (!components) {
        
        useDummyUrl = YES;
        
        if (!dummyUrl) {
            dummyUrl = @"http://www.dummy.com";
        }
        components = [NSURLComponents componentsWithString:dummyUrl];
    }
    
    NSString *queryString = components.query ?: @"";
    
    NSString *newQueryString = [queryString stringByAppendingFormat:queryString.length > 0 ? @"&%@" : @"%@", paraUrlString];
    
    components.query = newQueryString;
    
    if (useDummyUrl) {
        return [components.URL.absoluteString substringFromIndex:dummyUrl.length - 1];
    } else {
        return components.URL.absoluteString;
    }
}


@end
