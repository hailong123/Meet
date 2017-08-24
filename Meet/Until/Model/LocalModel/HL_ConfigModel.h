//
//  HL_ConfigModel.h
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define CreateConfigModel(tit,subTit,imgStr,type) [HL_ConfigModel createConfigModelWithTitle:tit subTitle:subTit leftImgStr:imgStr customItem:type];

@interface HL_ConfigModel : NSObject

@property (nullable ,nonatomic, copy) NSString *title;
@property (nullable ,nonatomic, copy) NSString *leftImgStr;
@property (nullable ,nonatomic, copy) NSString *subTitle;

@property (nonatomic,assign) BOOL customItem;

+ (HL_ConfigModel *)createConfigModelWithTitle:(nullable NSString *)title
                                      subTitle:(nullable NSString *)subTitle
                                    leftImgStr:(nullable NSString *)leftImgStr
                                    customItem:(BOOL)customItem;

@end

NS_ASSUME_NONNULL_END
