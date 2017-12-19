//
//  HL_EditViewController.h
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, EditViewType) {

    EditViewTypeCommunity = 0,
    EditViewTypeMarriage
    
};

@interface HL_EditViewController : HL_BaseViewController

@property (nonatomic, assign) EditViewType type;

@end

NS_ASSUME_NONNULL_END
