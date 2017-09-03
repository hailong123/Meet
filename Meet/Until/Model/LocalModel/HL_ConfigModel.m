//
//  HL_ConfigModel.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_ConfigModel.h"

@implementation HL_ConfigModel

+ (HL_ConfigModel *)createConfigModelWithTitle:(NSString *)title
                                      subTitle:(NSString *)subTitle
                                    leftImgStr:(NSString *)leftImgStr
                                   rightImgStr:(NSString *)rightStr
                                    customItem:(BOOL)customItem {

    
    HL_ConfigModel *configModel = [[HL_ConfigModel alloc] init];
    
    configModel.title       = title;
    configModel.subTitle    = subTitle;
    configModel.leftImgStr  = leftImgStr;
    configModel.rightImgStr = rightStr;
    configModel.customItem  = customItem;
    
    return configModel;
}

@end
