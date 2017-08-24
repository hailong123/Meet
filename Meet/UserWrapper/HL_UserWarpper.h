//
//  HL_UserWarpper.h
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_UserWarpper : NSObject

+ (instancetype)sharedInstance;

/*
 * 是否已登录
 */
@property (nonatomic, assign) BOOL logined;

@end

NS_ASSUME_NONNULL_END
