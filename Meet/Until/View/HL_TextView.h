//
//  HL_TextView.h
//  Meet
//
//  Created by SeaDragon on 2017/8/24.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_TextView : UIView

@property (nullable ,nonatomic, copy) NSString *placeholder;

@property (nonatomic, strong, readonly) UITextView *textView;

@end

NS_ASSUME_NONNULL_END
