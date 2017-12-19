//
//  HL_LoginInputView.h
//  Meet
//
//  Created by SeaDragon on 2017/8/13.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HL_LoginInputView;

typedef NS_ENUM(NSInteger, InputViewType) {

    InputViewType_Default = 0,
    InputViewType_Password
    
};

@protocol HL_LoginInputViewDelegate <NSObject>

- (void)loginInputViewDelegate:(HL_LoginInputView *)loginView
                      phoneStr:(NSString *)phoneStr
                   passwordStr:(NSString *)passwordStr;

@end

IB_DESIGNABLE

@interface HL_LoginInputView : UIView

@property (nonatomic, assign) id<HL_LoginInputViewDelegate> loginViewDelegate;

@property (nonatomic, assign) InputViewType inputType;

@property (nonatomic, strong) UITextField *inputTextField;

@property (nonatomic, copy) NSString *imgStr;
@property (nonatomic, copy) NSString *placeholderStr;

@end
