//
//  HL_SettingCell.m
//  Meet
//
//  Created by SeaDragon on 2017/8/7.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_SettingCell.h"

#import "HL_ConfigModel.h"

@interface HL_SettingCell ()

@property (nonatomic, strong) UILabel *desLbl;
@property (nonatomic, strong) UILabel *subLbl;

@property (nonatomic, strong) UIImageView *leftImgView;
@property (nonatomic, strong) UIImageView *rightImgView;

@end

@implementation HL_SettingCell

#pragma mark - Life Cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
    }
    
    return self;
}

#pragma mark - Private Method

- (void)createUI {
 
    [self.contentView addSubview:self.leftImgView];
    
    [self.leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@15);
        make.height.equalTo(@15);
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(15);
    }];
    
    [self.contentView addSubview:self.desLbl];
    
    [self.desLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.leftImgView);
        make.width.equalTo(@20).priorityLow(250);
        make.height.equalTo(self.contentView).multipliedBy(0.5);
        make.left.equalTo(self.leftImgView.mas_right).offset(15);
    }];
    
    [self.contentView addSubview:self.rightImgView];
    
    [self.rightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@8);
        make.height.equalTo(@14);
        make.centerY.equalTo(self.leftImgView);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    [self.contentView addSubview:self.subLbl];
    
    [self.subLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.desLbl);
        make.centerY.equalTo(self.leftImgView);
        make.width.equalTo(@20).priorityLow(250);
        make.right.equalTo(self.rightImgView.mas_left).offset(5);
    }];

}

#pragma mark - Publish Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (void)setConfigModel:(HL_ConfigModel *)configModel {

    _configModel = configModel;
    
    self.desLbl.text = configModel.title;
    self.subLbl.text = configModel.subTitle;
    
    self.leftImgView.image = [UIImage imageNamed:configModel.leftImgStr];
}

- (UILabel *)desLbl {

    if (!_desLbl) {
        _desLbl               = [[UILabel alloc] init];
        _desLbl.font          = [UIFont systemFontOfSize:14];
        _desLbl.textColor     = [UIColor blackColor];
        _desLbl.textAlignment = NSTextAlignmentLeft;
    }
    
    return _desLbl;
}

- (UILabel *)subLbl {

    if (!_subLbl) {
        _subLbl               = [[UILabel alloc] init];
        _subLbl.font          = [UIFont systemFontOfSize:11];
        _subLbl.textColor     = [UIColor grayColor];
        _subLbl.textAlignment = NSTextAlignmentRight;
    }
    
    return _subLbl;
}

- (UIImageView *)leftImgView {

    if (!_leftImgView) {
        _leftImgView = [[UIImageView alloc] init];
    }
    
    return _leftImgView;
}

- (UIImageView *)rightImgView {

    if (!_rightImgView) {
        _rightImgView       = [[UIImageView alloc] init];
        _rightImgView.image = [UIImage imageNamed:@"more"];
    }
    
    return _rightImgView;
}

#pragma Delloc

@end
