//
//  HL_JudgeLoginTool.h
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//判断是否登录

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_JudgeLoginTool : NSObject

/*
    * 登录判断
 */
@property (nonatomic, assign, getter=isLogined) BOOL logined;

@end

NS_ASSUME_NONNULL_END
