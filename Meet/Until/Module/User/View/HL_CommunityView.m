//
//  HL_CommunityView.m
//  Meet
//
//  Created by SeaDragon on 2017/9/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_CommunityView.h"

@interface HL_CommunityView ()

@property (nonatomic, strong) UILabel *lookLabel;
@property (nonatomic, strong) UILabel *communityCountLabel;

@property (nonatomic, strong) UIImageView *rightImgView;

@end

@implementation HL_CommunityView

#pragma mark - Private Method

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
    }
    
    return self;
}

- (void)createUI {
 
    //无动态
    [self addSubview:self.hasNoCommunityLabel];
    
    [self.hasNoCommunityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    //动态
    [self addSubview:self.communityCountLabel];
    
    [self.communityCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self);
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(RELATIVE_X(100));
        make.width.mas_equalTo(RELATIVE_WIDTH(20)).priorityLow(250);
    }];

    //右边图
    [self addSubview:self.rightImgView];
    
    [self.rightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(RELATIVE_X(-30));
        make.size.mas_equalTo(CGSizeMake(RELATIVE_WIDTH(18), RELATIVE_HEIGHT(31)));
    }];
    
    //去查看
    [self addSubview:self.lookLabel];
    
    [self.lookLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self);
        make.centerY.equalTo(self);
        make.right.equalTo(self.rightImgView.mas_left).offset(-10);
        make.width.mas_equalTo(RELATIVE_WIDTH(20)).priorityLow(250);
    }];

}

#pragma mark - Publish Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (UILabel *)lookLabel {

    if (!_lookLabel) {
        
        _lookLabel      = [[UILabel alloc] init];
        _lookLabel.text = @"去查看";
        _lookLabel.font = [UIFont systemFontOfSize:16];
        
    }
    
    return _lookLabel;
}

- (UILabel *)hasNoCommunityLabel {
 
    if (!_hasNoCommunityLabel) {
        _hasNoCommunityLabel           = [[UILabel alloc] init];
        _hasNoCommunityLabel.font      = [UIFont systemFontOfSize:18 weight:14];
        _hasNoCommunityLabel.textColor     = DEFAULT_GRAY_COLOR;
        _hasNoCommunityLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _hasNoCommunityLabel;
}

- (UILabel *)communityCountLabel {

    if (!_communityCountLabel) {
        _communityCountLabel           = [[UILabel alloc] init];
        _communityCountLabel.font      = [UIFont systemFontOfSize:23];
        _communityCountLabel.textColor = [UIColor redColor];
    }
    
    return _communityCountLabel;
}

- (UIImageView *)rightImgView {

    if (!_rightImgView) {
        _rightImgView       = [[UIImageView alloc] init];
        _rightImgView.image = [UIImage imageNamed:@"more"];
    }
    
    return _rightImgView;
}

- (void)setCommunityCount:(NSInteger)communityCount {

    _communityCount = communityCount;
    
    self.hasNoCommunityLabel.hidden = communityCount;
    self.rightImgView.hidden        = !self.hasNoCommunityLabel.hidden;
    self.lookLabel.hidden           = self.rightImgView.hidden;
    self.communityCountLabel.hidden = self.lookLabel.hidden;
    
    NSString *str = [NSString stringWithFormat:@"%ld 条心情动态",communityCount];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    [attributeStr addAttribute:NSForegroundColorAttributeName
                         value:[UIColor blackColor]
                         range:NSMakeRange(str.length - 5, 5)];
    [attributeStr addAttribute:NSFontAttributeName
                         value:[UIFont systemFontOfSize:16]
                         range:NSMakeRange(str.length - 5, 5)];
    
    self.communityCountLabel.attributedText = attributeStr;
}

#pragma Delloc

@end
