//
//  HL_CommunityCell.m
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_CommunityCell.h"

#import "HL_CommunityModel.h"

@interface HL_CommunityCell ()

@property (nonatomic, strong) UILabel *timeLbl;
@property (nonatomic, strong) UILabel *ageLbl;
@property (nonatomic, strong) UILabel *introLbl;
@property (nonatomic, strong) UILabel *nickNameLbl;

@property (nonatomic, strong) UIImageView *sexImgView;
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UIImageView *timeImgView;

@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UIButton *messageBtn;

@property (nonatomic, strong) UIView *photoInfoView;

@end

@implementation HL_CommunityCell

#pragma mark - Life Cycle

#pragma mark - Private Method

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self defaultConfig];
    }
    
    return self;
}

- (void)defaultConfig {

    [self.contentView addSubview:self.iconImgView];
    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(40, 40));
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
    }];
    
    [self.contentView addSubview:self.nickNameLbl];
    
    [self.nickNameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@25);
        make.top.equalTo(self.iconImgView);
        make.width.equalTo(@20).priorityLow(250);
        make.left.equalTo(self.iconImgView.mas_right).offset(10);
    }];
    
    
    [self.contentView addSubview:self.sexImgView];
    
    [self.sexImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLbl);
        make.size.mas_equalTo(CGSizeMake(35, 17));
        make.top.equalTo(self.nickNameLbl.mas_bottom).offset(5);
    }];
    
    [self.contentView addSubview:self.ageLbl];
    
    [self.ageLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sexImgView);
        make.right.equalTo(self.sexImgView);
        make.height.equalTo(self.sexImgView);
        make.width.equalTo(self.sexImgView).multipliedBy(0.5);
    }];
    
    [self.contentView addSubview:self.introLbl];
    
    [self.introLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLbl);
        make.height.equalTo(@20).priorityLow(250);
        make.right.equalTo(self.contentView).offset(-15);
        make.top.equalTo(self.sexImgView.mas_bottom).offset(10);
    }];
    
    [self.contentView addSubview:self.timeLbl];
    
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.right.equalTo(self.introLbl);
        make.top.equalTo(self.nickNameLbl);
        make.width.equalTo(@20).priorityLow(250);
    }];

    [self.contentView addSubview:self.timeImgView];
    
    [self.timeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLbl);
        make.size.mas_equalTo(CGSizeMake(12, 12));
        make.right.equalTo(self.timeLbl.mas_left).offset(-3);
    }];
    
    [self.contentView addSubview:self.likeBtn];
    
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@20);
        make.height.equalTo(@20);
        make.left.equalTo(self.nickNameLbl);
        make.bottom.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.messageBtn];
    
    [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@20);
        make.height.equalTo(@20);
        make.centerY.equalTo(self.likeBtn);
        make.left.equalTo(self.likeBtn.mas_right).offset(15);
    }];
    
    [self.contentView addSubview:self.photoInfoView];
    
    [self.photoInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.introLbl);
        make.left.equalTo(self.nickNameLbl);
        make.top.equalTo(self.introLbl.mas_bottom).offset(15);
        make.bottom.equalTo(self.messageBtn.mas_top).offset(-15);
    }];

}

- (void)clickLikeBtn:(UIButton *)btn {

}

- (void)clickMessageBtn:(UIButton *)btn {

}


#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (void)setCommunityModel:(HL_CommunityModel *)communityModel {

    self.sexImgView.image  = [UIImage imageNamed:@"sex-ico1"];
    self.iconImgView.image = [UIImage imageNamed:communityModel.iconImg];
    
    self.ageLbl.text      = communityModel.age;
    self.timeLbl.text     = communityModel.timeStamp;
    self.introLbl.text    = communityModel.intro;
    self.nickNameLbl.text = communityModel.nickName;
    
    [self.messageBtn setTitle:communityModel.messageCount
                     forState:UIControlStateNormal];
    
    [self.messageBtn setTitleColor:[UIColor redColor]
                          forState:UIControlStateNormal];
    
    
    [self.likeBtn setTitle:communityModel.praiseCount
                  forState:UIControlStateNormal];
    
    [self.likeBtn setTitleColor:[UIColor redColor]
                       forState:UIControlStateNormal];
    
    self.photoInfoView.backgroundColor = [UIColor yellowColor];
    
}

- (UILabel *)timeLbl {

    if (!_timeLbl) {
        
        _timeLbl               = [[UILabel alloc] init];
        _timeLbl.font          = [UIFont systemFontOfSize:11];
        _timeLbl.textColor     = [UIColor grayColor];
        _timeLbl.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _timeLbl;
}

- (UILabel *)nickNameLbl {

    if (!_nickNameLbl) {
        
        _nickNameLbl               = [[UILabel alloc] init];
        _nickNameLbl.font          = [UIFont systemFontOfSize:16 weight:12];
        _nickNameLbl.textColor     = [UIColor blackColor];
        _nickNameLbl.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _nickNameLbl;
}

- (UILabel *)introLbl {

    if (!_introLbl) {
        
        _introLbl               = [[UILabel alloc] init];
        _introLbl.font          = [UIFont systemFontOfSize:13];
        _introLbl.textColor     = [UIColor blackColor];
        _introLbl.numberOfLines = 0;
        
    }
    
    return _introLbl;
}

- (UIImageView *)iconImgView {

    if (!_iconImgView) {
        
        _iconImgView = [[UIImageView alloc] init];
        _iconImgView.layer.masksToBounds = YES;
        _iconImgView.layer.cornerRadius  = 40/2;
        _iconImgView.contentMode         = UIViewContentModeScaleAspectFill;
    }
    
    return _iconImgView;
}

- (UIImageView *)sexImgView {

    if (!_sexImgView) {
        _sexImgView = [[UIImageView alloc] init];
        
    }
    
    return _sexImgView;
}

- (UIButton *)likeBtn {

    if (!_likeBtn) {
    
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_likeBtn setImage:[UIImage imageNamed:@"news-good"]
                  forState:UIControlStateNormal];
        
        _likeBtn.backgroundColor = [UIColor redColor];
        
        [_likeBtn addTarget:self
                     action:@selector(clickLikeBtn:)
           forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _likeBtn;
    
}

- (UIButton *)messageBtn {

    if (!_messageBtn) {
        
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageBtn setImage:[UIImage imageNamed:@"news-chat"]
                     forState:UIControlStateNormal];
        
        [_messageBtn addTarget:self
                        action:@selector(clickMessageBtn:)
              forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _messageBtn;
}

- (UIView *)photoInfoView {

    if (!_photoInfoView) {
        
        _photoInfoView = [[UIView alloc] init];
    
    }
    
    return _photoInfoView;
}

- (UILabel *)ageLbl {

    if (!_ageLbl) {
        
        _ageLbl           = [[UILabel alloc] init];
        _ageLbl.font      = [UIFont systemFontOfSize:12];
        _ageLbl.textColor = [UIColor whiteColor];
        _ageLbl.adjustsFontSizeToFitWidth = YES;
    }
    
    return _ageLbl;
}

- (UIImageView *)timeImgView {

    if (!_timeImgView) {
        
        _timeImgView       = [[UIImageView alloc] init];
        _timeImgView.image = [UIImage imageNamed:@"news-time"];
    }
    
    return _timeImgView;
}

#pragma mark - Dealloc

@end
