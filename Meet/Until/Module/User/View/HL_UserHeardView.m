//
//  HL_UserHeardView.m
//  Meet
//
//  Created by SeaDragon on 2017/8/7.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_UserHeardView.h"

@interface HL_UserHeardView () {
    struct {
        unsigned int userHeardViewDelegate : 1;
    }_hasDes;
}

@property (nonatomic, strong) UILabel *introLbl;
@property (nonatomic, strong) UILabel *nickNameLbl;

@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIImageView *bgImageView;

@end


@implementation HL_UserHeardView

#pragma mark - Life Cycle

#pragma mark - Private Method

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
    }
    
    return self;
}

- (void)createUI {

    [self addSubview:self.bgImageView];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
    }];
    
    [self addSubview:self.introLbl];
    
    [self.introLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@35);
        make.bottom.equalTo(self);
    }];
    
    [self addSubview:self.nickNameLbl];
    
    [self.nickNameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.introLbl);
        make.centerX.equalTo(self.introLbl);
        make.width.equalTo(@20).priorityLow(250);
        make.bottom.equalTo(self.introLbl.mas_top);
    }];
    
    [self addSubview:self.rightBtn];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(RELATIVE_WIDTH(60));
        make.height.mas_equalTo(RELATIVE_HEIGHT(60));
        make.top.equalTo(self).offset(RELATIVE_Y(40));
        make.right.equalTo(self).offset(RELATIVE_X(-20));
    }];
}

- (void)clickRightBtn:(UIButton *)btn {
    if (_hasDes.userHeardViewDelegate) {
        [self.heardViewDelegate userHeardView:self];
    }
}

#pragma mark - Publish Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (UILabel *)nickNameLbl {

    if (!_nickNameLbl) {
        
        _nickNameLbl               = [[UILabel alloc] init];
        _nickNameLbl.font          = [UIFont systemFontOfSize:18 weight:12];
        _nickNameLbl.textColor     = [UIColor whiteColor];
        _nickNameLbl.textAlignment = NSTextAlignmentCenter;
        
        _nickNameLbl.text          = @"啥时候";
    }

    return _nickNameLbl;
}

- (UIButton *)rightBtn {

    if (!_rightBtn) {
        
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_rightBtn addTarget:self
                      action:@selector(clickRightBtn:)
            forControlEvents:UIControlEventTouchUpInside];
        
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"my-write"]
                             forState:UIControlStateNormal];
        
    }
    
    return _rightBtn;
}

- (UILabel *)introLbl {

    if (!_introLbl) {
        
        _introLbl      = [[UILabel alloc] init];
        _introLbl.font = [UIFont systemFontOfSize:12];
        _introLbl.textColor     = [UIColor yellowColor];
        _introLbl.textAlignment = NSTextAlignmentCenter;
        
        _introLbl.text = @"大典撒多";
        
    }

    return _introLbl;
}

- (UIImageView *)bgImageView {

    if (!_bgImageView) {
    
        _bgImageView       = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:@"icon"];
    }
    
    return _bgImageView;
}

- (void)setHeardViewDelegate:(id<userHeardViewDelegate>)heardViewDelegate {

    _heardViewDelegate = heardViewDelegate;

    _hasDes.userHeardViewDelegate = [heardViewDelegate respondsToSelector:@selector(userHeardView:)];
}

#pragma Delloc


@end
