//
//  HL_UserHeardView.h
//  Meet
//
//  Created by SeaDragon on 2017/8/7.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HL_UserHeardView;

@protocol userHeardViewDelegate <NSObject>

@optional
- (void)userHeardView:(HL_UserHeardView *)userHeardView;

@end

@interface HL_UserHeardView : UIView

@property (nonatomic, assign) id<userHeardViewDelegate>heardViewDelegate;

@end

NS_ASSUME_NONNULL_END
