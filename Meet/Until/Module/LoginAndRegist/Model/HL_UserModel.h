//
//  HL_UserModel.h
//  Meet
//
//  Created by SeaDragon on 2017/9/27.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//用户模型

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_UserModel : NSObject

@property (nonatomic, strong) NSString * token;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * birthday;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, strong) NSString * heard_img;
@property (nonatomic, strong) NSString * nick_name;

@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, assign) NSInteger car_authentication;
@property (nonatomic, assign) NSInteger real_name_authentication;

@end

NS_ASSUME_NONNULL_END
