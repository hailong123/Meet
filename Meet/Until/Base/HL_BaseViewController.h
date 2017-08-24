//
//  HL_BaseViewController.h
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_BaseViewController : UIViewController

/*
 ** 设置默认的标题
 */

- (void)setNavNormalTitleWithTitle:(NSString *)title;

/*
 ** 设置左边图片
 */

- (void)setNavLeftBarItemWithImg:(NSString *)imgName;

/*
 ** 设置左边文字
 */

- (void)setNavLeftBarItemWithTitle:(NSString *)title;

/*
 ** 设置右边文字
 */

- (void)setNavRightBarItemWithTittle:(NSString *)title;

/*
 ** 设置右边图片
 */
- (void)setNavRightBarItemWithImg:(NSString *)imgName;



- (void)clickRightBtnEvent:(UIButton *)rightBtn;

- (void)clickLeftBtnEvent:(UIButton *)leftBtn;

@end

NS_ASSUME_NONNULL_END
