//
//  HL_LocalModelHelper.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_LocalModelHelper.h"

#import "HL_ConfigModel.h"

@implementation HL_LocalModelHelper

/*
 ** 注册模型填充
 */

+ (NSMutableArray *)fetchRegisterData {

    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:4];
    
    HL_ConfigModel *configModelOne   = CreateConfigModel(@"选择生日", nil, nil, nil, NO);
    HL_ConfigModel *configModelTwo   = CreateConfigModel(@"选择城市", nil, nil, nil, NO);
    HL_ConfigModel *configModelFour  = CreateConfigModel(@"选择身高", nil, nil, nil, NO);
    HL_ConfigModel *configModelThree = CreateConfigModel(@"选择性别", nil, nil, nil, NO);
    
    [tmpArray addObject:configModelOne];
    [tmpArray addObject:configModelFour];
    [tmpArray addObject:configModelTwo];
    [tmpArray addObject:configModelThree];
    
    return tmpArray;
}

/*
 ** 用户模型填充
 */
+ (NSMutableArray *)fetchUserDataWithoutSetting:(BOOL)without {

    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:0];
    HL_ConfigModel *modifyModel        = CreateConfigModel(@"征婚动态", nil, @"my-ico2", nil, NO);
    HL_ConfigModel *certificationModel = CreateConfigModel(@"我的认证", nil, @"my-ico1", nil, NO);
    HL_ConfigModel *feelModel   = CreateConfigModel(@"心情动态", nil, @"my-ico3", nil, NO);
    HL_ConfigModel *lifeModel   = CreateConfigModel(@"生活照片", nil, @"my-ico4", nil, NO);
    HL_ConfigModel *settModel   = CreateConfigModel(@"设置",    nil, @"my-ico6", @"more", YES);
    HL_ConfigModel *friendModel = CreateConfigModel(@"好友",    nil, @"my-ico5", @"more", NO);
    
    [tmpArray addObject:@[certificationModel]];
    [tmpArray addObject:@[modifyModel]];
    [tmpArray addObject:@[feelModel]];
    [tmpArray addObject:@[lifeModel]];
    
    if (!without) {
        [tmpArray addObject:@[friendModel,settModel]];
    }
    
    return tmpArray;
}

/*
 ** 编辑用户资料
 */

+ (NSMutableArray *)fetchEditBaseInfo {
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:0];
    
    HL_ConfigModel *usModel      = CreateConfigModel(@"关于我们", nil, @"edit-ico1", nil, YES);
    HL_ConfigModel *cleanModel   = CreateConfigModel(@"清理缓存", nil, @"edit-ico3", nil, YES);
    HL_ConfigModel *checkUpModel = CreateConfigModel(@"检查更新", nil, @"edit-ico2", nil, YES);
    HL_ConfigModel *loginExitModel      = CreateConfigModel(@"退出登录", nil, @"edit-ico5", nil, YES);
    HL_ConfigModel *modifyPasswordModel = CreateConfigModel(@"修改密码", nil, @"edit-ico4", nil, YES);
    
    [tmpArray addObject:@[usModel,checkUpModel,cleanModel,modifyPasswordModel]];
    [tmpArray addObject:@[loginExitModel]];
    
    return tmpArray;
}

@end
