//
//  HL_EditBaseInfoView.m
//  Meet
//
//  Created by SeaDragon on 2017/8/24.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_EditBaseInfoView.h"

@interface HL_EditBaseInfoView ()

@end

@implementation HL_EditBaseInfoView
{
    struct {
        unsigned int HL_EditBaseInfoViewDelegate : 1;
    }_hasDes;
}

#pragma mark - Life Cycle

#pragma mark - Private Method

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self createBaseInfoUI];
        
    }
    
    return self;
}

- (void)createBaseInfoUI {

    //背景
    [self addSubview:self.backgroundImgView];
    
    [self.backgroundImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
    }];
    
    //头像
    [self addSubview:self.heardButton];
    
    [self.heardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.mas_equalTo(RELATIVE_WIDTH(180));
        make.height.mas_equalTo(RELATIVE_WIDTH(180));
        make.top.equalTo(self).offset(RELATIVE_Y(90));
    }];
    
    //相机
    [self addSubview:self.photoButton];
    
    [self.photoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.heardButton);
        make.bottom.equalTo(self.heardButton);
        make.size.mas_equalTo(CGSizeMake(RELATIVE_WIDTH(50), RELATIVE_WIDTH(50)));
    }];
    
    //昵称
    [self addSubview:self.nickNameLabel];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.mas_equalTo(RELATIVE_HEIGHT(50));
        make.width.mas_equalTo(RELATIVE_WIDTH(30)).priorityLow(250);
        make.top.equalTo(self.heardButton.mas_bottom).offset(RELATIVE_Y(30));
    }];
    
}

//点击头像
- (void)addPhotoButton:(UIButton *)button {
    if (_hasDes.HL_EditBaseInfoViewDelegate) {
        [self.infoViewDelegate editBaseInfoView:self];
    }
}

#pragma mark - Publish Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (UIImageView *)backgroundImgView {

    if (!_backgroundImgView) {
        
        _backgroundImgView       = [[UIImageView alloc] init];
        
        _backgroundImgView.image = [UIImage imageNamed:@"icon"];
    }
    
    return _backgroundImgView;
}

- (UIButton *)heardButton {

    if (!_heardButton) {
        
        _heardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _heardButton.contentMode         = UIViewContentModeScaleToFill;
        _heardButton.layer.borderWidth   = 2.5;
        _heardButton.layer.borderColor   = [UIColor whiteColor].CGColor;
        _heardButton.layer.cornerRadius  = RELATIVE_WIDTH(180)/2;
        _heardButton.layer.masksToBounds = YES;
        [_heardButton addTarget:self
                         action:@selector(addPhotoButton:)
               forControlEvents:UIControlEventTouchUpInside];
        
        [_heardButton setBackgroundImage:[UIImage imageNamed:@"icon"]
                                forState:UIControlStateNormal];
    }
    
    return _heardButton;
}

- (UIButton *)photoButton {

    if (!_photoButton) {
        
        _photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_photoButton setBackgroundImage:[UIImage imageNamed:@"write-photo"]
                                forState:UIControlStateNormal];
        [_photoButton addTarget:self
                         action:@selector(addPhotoButton:)
               forControlEvents:UIControlEventTouchUpInside];
    }

    return _photoButton;
}

- (UILabel *)nickNameLabel {

    if (!_nickNameLabel) {
        _nickNameLabel               = [[UILabel alloc] init];
        _nickNameLabel.font          = [UIFont systemFontOfSize:15];
        _nickNameLabel.textColor     = [UIColor whiteColor];
        _nickNameLabel.textAlignment = NSTextAlignmentCenter;
        
        _nickNameLabel.text = @"我的头像";
    }
    
    return _nickNameLabel;
}

- (void)setInfoViewDelegate:(id<HL_EditBaseInfoViewDelegate>)infoViewDelegate {

    _infoViewDelegate = infoViewDelegate;
    
    _hasDes.HL_EditBaseInfoViewDelegate = [self.infoViewDelegate respondsToSelector:@selector(editBaseInfoView:)];
    
}

#pragma Delloc

@end
