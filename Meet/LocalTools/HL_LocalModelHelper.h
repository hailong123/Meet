//
//  HL_LocalModelHelper.h
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_LocalModelHelper : NSObject

/*
 ** 注册模型填充
 */
+ (NSMutableArray *)fetchRegisterData;

/*
 ** 用户模型填充
 */

+ (NSMutableArray *)fetchUserDataWithoutSetting:(BOOL)without;

/*
 ** 编辑资料
 */

+ (NSMutableArray *)fetchEditBaseInfo;

@end

NS_ASSUME_NONNULL_END
