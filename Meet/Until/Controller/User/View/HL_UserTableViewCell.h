//
//  HL_UserTableViewCell.h
//  Meet
//
//  Created by SeaDragon on 2017/8/7.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HL_ConfigModel;

typedef NS_ENUM(NSInteger, CellType) {

    CellType_Dynamic = 0,
    CellType_Photo,
    CellType_Setting
};

@interface HL_UserTableViewCell : UITableViewCell

/*
 ** cell的类型
 */

@property (nonatomic, assign) CellType type;

@property (nonatomic, strong) HL_ConfigModel *configModel;

@property (nonatomic, strong) NSMutableArray *photoArray;

@end

NS_ASSUME_NONNULL_END
