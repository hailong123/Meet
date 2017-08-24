//
//  HL_SearchCell.m
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_SearchCell.h"

@interface HL_SearchCell ()

@property (nonatomic, strong) UIImageView *iconImgView;

@property (nonatomic, strong) UILabel *introLbl;
@property (nonatomic, strong) UILabel *nickNameLbl;

@end

@implementation HL_SearchCell

#pragma mark - Private Method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
    }
    
    return self;
}

- (void)createUI {

    [self.contentView addSubview:self.iconImgView];
    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.left.equalTo(self.contentView).offset(15);
    }];
    
    [self.contentView addSubview:self.nickNameLbl];
    
    [self.nickNameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.top.equalTo(self.iconImgView);
        make.width.equalTo(@20).priorityLow(250);
        make.left.equalTo(self.iconImgView.mas_right).offset(15);
    }];
    
    [self.contentView addSubview:self.introLbl];
    
    [self.introLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLbl);
        make.bottom.equalTo(self.iconImgView);
        make.height.equalTo(self.nickNameLbl);
        make.width.equalTo(@20).priorityLow(250);
    }];
    
    self.backgroundColor             = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (UIImageView *)iconImgView {

    if (!_iconImgView) {
        
        _iconImgView = [[UIImageView alloc] init];
        _iconImgView.layer.masksToBounds = YES;
        _iconImgView.layer.cornerRadius  = 50/2;
        
        _iconImgView.backgroundColor = [UIColor redColor];
    }
    
    return _iconImgView;
}

- (UILabel *)nickNameLbl {

    if (!_nickNameLbl) {
        _nickNameLbl               = [[UILabel alloc] init];
        _nickNameLbl.font          = [UIFont systemFontOfSize:13];
        _nickNameLbl.textColor     = [UIColor blackColor];
        _nickNameLbl.textAlignment = NSTextAlignmentLeft;
        
        _nickNameLbl.text = @"昵称";
    }
 
    return _nickNameLbl;
}

- (UILabel *)introLbl {

    if (!_introLbl) {
        
        _introLbl      = [[UILabel alloc] init];
        _introLbl.font = [UIFont systemFontOfSize:13];
        _introLbl.textColor     = [UIColor grayColor];
        _introLbl.textAlignment = NSTextAlignmentLeft;
        
        _introLbl.text = @"简介";
    }
    
    return _introLbl;
}

#pragma mark - Dealloc

@end
