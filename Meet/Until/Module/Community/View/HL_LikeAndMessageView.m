//
//  HL_LikeAndMessageView.m
//  Meet
//
//  Created by SeaDragon on 2017/9/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_LikeAndMessageView.h"

@interface HL_LikeAndMessageView ()

@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation HL_LikeAndMessageView
{
    struct {
        unsigned int  HL_LikeAndMessageViewDelegate : 1;
    }_hasDes;
}

#pragma mark - Private Method

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self addGesture];
        
        [self createUI];
    }
    
    return self;
}

//添加点击事件
- (void)addGesture {
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                       action:@selector(clickView:)]];
}

//创建UI
- (void)createUI {
    //左图片
    [self addSubview:self.leftImageView];
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(RELATIVE_WIDTH(28),RELATIVE_HEIGHT(28)));
    }];
    
    //文字
    [self addSubview:self.countLabel];
    
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(20).priorityLow(250);
        make.left.equalTo(self.leftImageView.mas_right).offset(RELATIVE_X(20));
    }];
}

- (void)clickView:(UITapGestureRecognizer *)tap {
    if (_hasDes.HL_LikeAndMessageViewDelegate) {
        [self.messageViewDelegate likeAndMessageView:self];
    }
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter
- (UIImageView *)leftImageView {

    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
    }
    
    return _leftImageView;
}

- (UILabel *)countLabel {

    if (!_countLabel) {
        _countLabel           = [[UILabel alloc] init];
        _countLabel.font      = [UIFont systemFontOfSize:15];
        _countLabel.textColor = DEFAULT_GRAY_COLOR;
    }
    
    return _countLabel;
}

- (void)setMessageViewDelegate:(id<HL_LikeAndMessageViewDelegate>)messageViewDelegate {

    _messageViewDelegate = messageViewDelegate;
    
    _hasDes.HL_LikeAndMessageViewDelegate = [self.messageViewDelegate respondsToSelector:@selector(likeAndMessageView:)];
}

- (void)setType:(ViewType)type {

    _type = type;
    
    switch (type) {
        case ViewType_Like:
        {
            self.leftImageView.image = [UIImage imageNamed:@"news-good"];
        }
            break;
            
        case ViewType_Message:
        {
           self.leftImageView.image = [UIImage imageNamed:@"news-chat"];
        }
            break;
    }
}

- (void)setCount:(NSString *)count {

    _count = count;
    
    self.countLabel.text = count;
}

#pragma Delloc

@end
