//
//  HL_CommunityModel.h
//  Meet
//
//  Created by SeaDragon on 2017/8/19.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_CommunityModel : NSObject

@property (nullable, nonatomic, copy) NSString *age;
@property (nullable, nonatomic, copy) NSString *iconImg;
@property (nullable, nonatomic, copy) NSString *nickName;
@property (nullable, nonatomic, copy) NSString *timeStamp;
@property (nullable, nonatomic, copy) NSString *praiseCount;
@property (nullable, nonatomic, copy) NSString *messageCount;

@property (nullable, nonatomic, copy) NSString *intro;

@property (nullable, nonatomic, strong) NSArray *photoImgArray;

@property (nonatomic, assign) NSInteger sex;

@end

NS_ASSUME_NONNULL_END
