//
//  HL_PermissionTool.h
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_PermissionTool : NSObject

//相机
+ (BOOL)hasPermissionGetCamera;

//相册
+ (BOOL)hasPermissionGetPhoto;

@end

NS_ASSUME_NONNULL_END
