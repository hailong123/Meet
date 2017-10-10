//
//  HL_EditBaseInfoView.h
//  Meet
//
//  Created by SeaDragon on 2017/8/24.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HL_EditBaseInfoView;

NS_ASSUME_NONNULL_BEGIN

@protocol HL_EditBaseInfoViewDelegate <NSObject>

- (void)editBaseInfoView:(HL_EditBaseInfoView *)infoView;

@end

@interface HL_EditBaseInfoView : UIView

@property (nonatomic, strong) UIImageView *backgroundImgView;

@property (nonatomic, strong) UIButton *heardButton;
@property (nonatomic, strong) UIButton *photoButton;

@property (nonatomic, strong) UILabel *nickNameLabel;

@property (nonatomic, assign) id<HL_EditBaseInfoViewDelegate> infoViewDelegate;

@end

NS_ASSUME_NONNULL_END
