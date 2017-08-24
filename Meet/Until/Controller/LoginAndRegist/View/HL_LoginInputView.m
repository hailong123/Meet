//
//  HL_LoginInputView.m
//  Meet
//
//  Created by SeaDragon on 2017/8/13.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_LoginInputView.h"

IB_DESIGNABLE
@interface HL_LoginInputView ()
<
    UITextFieldDelegate
>

@property (nonatomic, strong) UILabel *lineLbl;

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UITextField *inputTextField;

@end

@implementation HL_LoginInputView

#pragma mark - Private Method
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        
    }
    
    return self;
}

/*
 **
 */

- (void)createUI {

    [self addSubview:self.imgView];

    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.mas_equalTo(RELATIVE_HEIGHT(40));
        make.height.mas_equalTo(RELATIVE_HEIGHT(40));
        make.left.equalTo(self).offset(RELATIVE_X(20));
    }];
    
    [self addSubview:self.inputTextField];
    
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.imgView);
        make.centerY.equalTo(self.imgView);
        make.right.equalTo(self).offset(-15);
        make.left.equalTo(self.imgView.mas_right).offset(RELATIVE_X(50));
    }];
    
    [self addSubview:self.lineLbl];
    
    [self.lineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

#pragma mark - Publish Method

#pragma mark - Delegate


#pragma mark - Setter And Getter

- (void)setImgStr:(NSString *)imgStr {
 
    _imgStr            = imgStr;
    self.imgView.image = [UIImage imageNamed:imgStr];
    
}

- (void)setPlaceholderStr:(NSString *)placeholderStr {

    _placeholderStr                 = placeholderStr;
    self.inputTextField.placeholder = placeholderStr;
}

- (void)setInputType:(InputViewType)inputType {
 
    _inputType = inputType;
    
    if (inputType == InputViewType_Password) {
        self.inputTextField.secureTextEntry = YES;
    }
    
}

- (UILabel *)lineLbl {

    if (!_lineLbl) {
        _lineLbl                 = [[UILabel alloc] init];
        _lineLbl.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    return _lineLbl;
}

- (UIImageView *)imgView {

    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
    }
    
    return _imgView;
}

- (UITextField *)inputTextField {
    
    if (!_inputTextField) {
        
        _inputTextField             = [[UITextField alloc] init];
        _inputTextField.delegate    = self;
        _inputTextField.borderStyle = UITextBorderStyleNone;
    }

    return _inputTextField;
}

#pragma Delloc

@end
