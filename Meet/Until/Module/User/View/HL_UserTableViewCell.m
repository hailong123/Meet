//
//  HL_UserTableViewCell.m
//  Meet
//
//  Created by SeaDragon on 2017/8/7.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_UserTableViewCell.h"

#import "HL_ConfigModel.h"

#import "HL_CommunityView.h"

#import "HL_CertificationView.h"

@interface HL_UserTableViewCell ()
<
    UIScrollViewDelegate
>

@property (nonatomic, strong) UILabel *lineLbl;
@property (nonatomic, strong) UILabel *cataryLbl;
@property (nonatomic, strong) UILabel *contantLbl;

@property (nonatomic, strong) HL_CommunityView *communityView;
@property (nonatomic, strong) HL_CertificationView *certificationView;

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UIScrollView *photoScrollView;

@end

@implementation HL_UserTableViewCell

#pragma mark - Private Method

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
    }
    
    return self;
}

- (void)createUI {

    //图片
    [self.contentView addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@18);
        make.height.equalTo(@15);
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.contentView).offset(15);
    }];

    //标题
    [self.contentView addSubview:self.cataryLbl];
    
    [self.cataryLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.iconImageView);
        make.centerY.equalTo(self.iconImageView);
        make.width.equalTo(@20).priorityLow(250);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
    }];
    
    //线条
    [self.contentView addSubview:self.lineLbl];
    
    [self.lineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.cataryLbl.mas_bottom).offset(15);
        make.left.equalTo(self.iconImageView.mas_right).offset(5);
    }];
    
    //右边的图片
    [self.contentView addSubview:self.rightImageView];
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(RELATIVE_X(-30));
        make.size.mas_equalTo(CGSizeMake(RELATIVE_WIDTH(18), RELATIVE_HEIGHT(31)));
    }];
}

- (void)addScrollView {

    [self.contentView addSubview:self.photoScrollView];
    
    [self.photoScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.lineLbl.mas_bottom).offset(5);
    }];
    
}

- (void)addCommunityViewWithStr:(NSString *)str {
    
    [self.contentView addSubview:self.communityView];
    
    self.communityView.hasNoCommunityLabel.text = str;
    
    [self.communityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.top.equalTo(self.lineLbl.mas_bottom);
    }];
    
}

//f认证图片
- (void)addCertificationView {

    [self.contentView addSubview:self.certificationView];
    
    [self.certificationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineLbl);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.top.equalTo(self.lineLbl.mas_bottom);
    }];

}

#pragma mark - Publish Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (void)setType:(CellType)type {

    switch (type) {
        case CellType_Setting:
        {
            
        }
            break;
            
        case CellType_Dynamic:
        {
            [self addCommunityViewWithStr:MEET_USER_COMMUNITY_HASNO_TITLE];
        }
            break;
        case CellType_Photo:
        {
            [self addScrollView];
        }
            break;
        case CellType_Marriage:
        {
             [self addCommunityViewWithStr:MEET_USER_COMMUNITY_HASNO_MARIARY_TITLE];
        }
            break;
        case CellType_Certification:
        {
            [self addCertificationView];
        }
            break;
    }
    
}

- (void)setConfigModel:(HL_ConfigModel *)configModel {

    _configModel = configModel;
    
    self.cataryLbl.text      = configModel.title;
    self.iconImageView.image = [UIImage imageNamed:configModel.leftImgStr];
    self.rightImageView.hidden = !(configModel.rightImgStr.length > 0);
    self.rightImageView.image  = [UIImage imageNamed:configModel.rightImgStr];
}

- (void)setPhotoArray:(NSMutableArray *)photoArray {
    
    _photoArray = photoArray;
    
    [self.photoScrollView removeAllSubviews];
    
    for (NSInteger i = 0; i < photoArray.count; i++) {
        
        if (i == 0) {
            UIButton *addPhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [addPhotoBtn setBackgroundImage:[UIImage imageNamed:@"addhd-ico"]
                                   forState:UIControlStateNormal];
            [self.photoScrollView addSubview:addPhotoBtn];
            
            [addPhotoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.photoScrollView);
                make.left.equalTo(self.photoScrollView).offset(35);
                make.height.equalTo(self.photoScrollView).multipliedBy(0.65);
                make.width.equalTo(self.photoScrollView.mas_height).multipliedBy(0.65);
            }];
            
        } else {
            
            UIImageView *imgView = [[UIImageView alloc] init];
            imgView.image        = [UIImage imageNamed:photoArray[i]];
            
            imgView.backgroundColor     = [UIColor redColor];
            imgView.layer.masksToBounds = YES;
            imgView.layer.cornerRadius  = 8;
            
            [self.photoScrollView addSubview:imgView];
            
            [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(i*(85)+35);
                make.centerY.equalTo(self.photoScrollView);
                make.height.equalTo(self.photoScrollView).multipliedBy(0.65);
                make.width.equalTo(self.photoScrollView.mas_height).multipliedBy(0.65);
            }];
        }
        
        [self.photoScrollView setContentSize:CGSizeMake(photoArray.count*(95), 0)];
    }
}

- (void)setCommunityCount:(NSInteger)communityCount {

    _communityCount = communityCount;
    
    self.communityView.communityCount = communityCount;
}

- (UILabel *)lineLbl {

    if (!_lineLbl) {
        
        _lineLbl                 = [[UILabel alloc] init];
        _lineLbl.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    return _lineLbl;
}

- (UILabel *)cataryLbl {

    if (!_cataryLbl) {
        _cataryLbl               = [[UILabel alloc] init];
        _cataryLbl.font          = [UIFont systemFontOfSize:14];
        _cataryLbl.textColor     = [UIColor grayColor];
        _cataryLbl.textAlignment = NSTextAlignmentLeft;
        
    }
    
    return _cataryLbl;
}

- (UIImageView *)iconImageView {

    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    
    return _iconImageView;
}

- (UIImageView *)rightImageView {

    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] init];
    }
    
    return _rightImageView;
}

- (UIScrollView *)photoScrollView {

    if (!_photoScrollView) {
        
        _photoScrollView          = [[UIScrollView alloc] init];
        _photoScrollView.delegate = self;
    }
    
    return _photoScrollView;
}

- (HL_CommunityView *)communityView {

    if (!_communityView) {
        _communityView = [[HL_CommunityView alloc] init];
    }
    
    return _communityView;
}

- (HL_CertificationView *)certificationView {

    if (!_certificationView) {
        _certificationView = [[HL_CertificationView alloc] init];
    }
    
    return _certificationView;
}

@end
