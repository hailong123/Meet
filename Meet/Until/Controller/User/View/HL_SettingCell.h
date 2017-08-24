//
//  HL_SettingCell.h
//  Meet
//
//  Created by SeaDragon on 2017/8/7.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HL_ConfigModel;

NS_ASSUME_NONNULL_BEGIN

@interface HL_SettingCell : UITableViewCell

@property (nonatomic, strong) HL_ConfigModel *configModel;

@end

NS_ASSUME_NONNULL_END
