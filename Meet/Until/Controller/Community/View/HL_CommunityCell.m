//
//  HL_CommunityCell.m
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_CommunityCell.h"
#import "HL_PhotoCollectionViewCell.h"

#import "HL_CommunityModel.h"
#import "HL_LikeAndMessageView.h"

#import "XLPhotoBrowser.h"

@interface HL_CommunityCell ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    XLPhotoBrowserDelegate,
    XLPhotoBrowserDatasource,
    HL_LikeAndMessageViewDelegate
>

@property (nonatomic, strong) UILabel *timeLbl;
@property (nonatomic, strong) UILabel *ageLbl;
@property (nonatomic, strong) UILabel *introLbl;
@property (nonatomic, strong) UILabel *nickNameLbl;

@property (nonatomic, strong) UILabel *ageTwoLabel;

@property (nonatomic, strong) UIImageView *sexImgView;
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UIImageView *timeImgView;

@property (nonatomic, strong) HL_LikeAndMessageView *likeBtnView;
@property (nonatomic, strong) HL_LikeAndMessageView *messageBtnView;

@property (nonatomic, strong) UIView *photoInfoView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *dataSources;

@end

@implementation HL_CommunityCell {
    struct {
        unsigned int HL_CommunityCellDelegate : 1;
    }_hasDes;
    
}

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
    //头像
    [self.contentView addSubview:self.iconImgView];
    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(40, 40));
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
    }];
    
    //昵称
    [self.contentView addSubview:self.nickNameLbl];
    
    [self.nickNameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@25);
        make.top.equalTo(self.iconImgView);
        make.width.equalTo(@20).priorityLow(250);
        make.left.equalTo(self.iconImgView.mas_right).offset(10);
    }];
    
    //性别
    [self.contentView addSubview:self.sexImgView];
    
    [self.sexImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLbl);
        make.size.mas_equalTo(CGSizeMake(35, 17));
        make.top.equalTo(self.nickNameLbl.mas_bottom).offset(5);
    }];
    
    //年级
    [self.contentView addSubview:self.ageLbl];
    
    [self.ageLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sexImgView);
        make.right.equalTo(self.sexImgView);
        make.height.equalTo(self.sexImgView);
        make.width.equalTo(self.sexImgView).multipliedBy(0.5);
    }];
    
    //简介
    [self.contentView addSubview:self.introLbl];
    
    [self.introLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLbl);
        make.height.equalTo(@20).priorityLow(250);
        make.right.equalTo(self.contentView).offset(-15);
        make.top.equalTo(self.sexImgView.mas_bottom).offset(10);
    }];
    
    //时间
    [self.contentView addSubview:self.timeLbl];
    
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.right.equalTo(self.introLbl);
        make.top.equalTo(self.nickNameLbl);
        make.width.equalTo(@20).priorityLow(250);
    }];

    //时间图片
    [self.contentView addSubview:self.timeImgView];
    
    [self.timeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLbl);
        make.size.mas_equalTo(CGSizeMake(12, 12));
        make.right.equalTo(self.timeLbl.mas_left).offset(-3);
    }];
    
    //点赞
    [self.contentView addSubview:self.likeBtnView];
    
    [self.likeBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLbl);
        make.bottom.equalTo(self.contentView).offset(RELATIVE_Y(-20));
        make.size.mas_equalTo(CGSizeMake(RELATIVE_WIDTH(100), RELATIVE_HEIGHT(40)));
    }];
    
    //消息
    [self.contentView addSubview:self.messageBtnView];
    
    [self.messageBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.likeBtnView);
        make.centerY.equalTo(self.likeBtnView);
        make.left.equalTo(self.likeBtnView.mas_right).offset(15);
    }];
    
    //相册
    [self.contentView addSubview:self.photoInfoView];
    
    [self.photoInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.introLbl);
        make.left.equalTo(self.nickNameLbl);
        make.top.equalTo(self.introLbl.mas_bottom).offset(15);
        make.bottom.equalTo(self.messageBtnView.mas_top).offset(RELATIVE_Y(-15));
    }];

    //相册列表
    [self.photoInfoView addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.photoInfoView);
        make.size.equalTo(self.photoInfoView);
        make.bottom.equalTo(self.photoInfoView);
    }];
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    // 快速创建并进入浏览模式
    XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithCurrentImageIndex:indexPath.row
                                                                         imageCount:self.dataSources.count
                                                                         datasource:self];
    
    
    // 自定义一些属性
    browser.currentPageDotColor = [UIColor whiteColor];
    browser.browserStyle        = XLPhotoBrowserStyleSimple;
    browser.pageControlStyle    = XLPhotoBrowserPageControlStyleAnimated;///< 修改底部pagecontrol的样式为系统样式,默认是弹性动画的样式
    browser.delegate            = self;
}

#pragma mark UICollectionDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HL_PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[HL_PhotoCollectionViewCell description]
                                                                                 forIndexPath:indexPath];
    
    cell.photoImageView.image = [UIImage imageNamed:self.dataSources[indexPath.row]];
    
    return cell;
}

#pragma mark XLPhotoBrowserDatasource

/**
 *  返回这个位置的占位图片 , 也可以是原图(如果不实现此方法,会默认使用placeholderImage)
 *
 *  @param browser 浏览器
 *  @param index   位置索引
 *
 *  @return 占位图片
 */
- (UIImage *)photoBrowser:(XLPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {
    
    NSString *imgStr = self.dataSources[index];
    
    return [UIImage imageNamed:imgStr];
}

/**
 *  返回指定位置的高清图片URL
 *
 *  @param browser 浏览器
 *  @param index   位置索引
 *
 *  @return 返回高清大图索引
 */
//- (NSURL *)photoBrowser:(XLPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index {
//    JH_ChatRoomBaseModel *model = self.viewModel.photoSourceArr[index];
//    
//    return [NSURL URLWithString:DEF_OBJECT_TO_STIRNG(model.chatFileModel.file.url)];
//}

#pragma mark HL_LikeAndMessageDelegate
- (void)likeAndMessageView:(HL_LikeAndMessageView *)view {

    switch (view.type) {
        case ViewType_Like:
        {
            [[iToast makeText:@"点赞"] show];
        }
            break;
            
        case ViewType_Message:
        {
            [[iToast makeText:@"消息"] show];
        }
            break;
    }

}

- (void)clickIconImageVie:(UITapGestureRecognizer *)tap {
    if (_hasDes.HL_CommunityCellDelegate) {
        [self.communityCellDelegate communityCell:self];
    }
}

#pragma mark - Setter And Getter

- (void)setCommunityModel:(HL_CommunityModel *)communityModel {

    self.sexImgView.image  = [UIImage imageNamed:@"sex-ico1"];
    self.iconImgView.image = [UIImage imageNamed:communityModel.iconImg];
    
    self.ageLbl.text      = communityModel.age;
    self.timeLbl.text     = communityModel.timeStamp;
    self.introLbl.text    = communityModel.intro;
    self.nickNameLbl.text = communityModel.nickName;
    
    self.likeBtnView.count    = communityModel.praiseCount;
    self.messageBtnView.count = communityModel.messageCount;
    
    self.dataSources = communityModel.photoImgArray;
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
        _iconImgView.userInteractionEnabled = YES;
        
        [_iconImgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                   action:@selector(clickIconImageVie:)]];
    }
    
    return _iconImgView;
}

- (UIImageView *)sexImgView {

    if (!_sexImgView) {
        _sexImgView = [[UIImageView alloc] init];
        
    }
    
    return _sexImgView;
}

- (HL_LikeAndMessageView *)likeBtnView {

    if (!_likeBtnView) {
        _likeBtnView      = [[HL_LikeAndMessageView alloc] init];
        _likeBtnView.type = ViewType_Like;
        _likeBtnView.messageViewDelegate = self;
    }
    
    return _likeBtnView;
    
}

- (HL_LikeAndMessageView *)messageBtnView {

    if (!_messageBtnView) {
        _messageBtnView      = [[HL_LikeAndMessageView alloc] init];
        _messageBtnView.type = ViewType_Message;
        _messageBtnView.messageViewDelegate = self;
    }
    
    return _messageBtnView;
}

- (UIView *)photoInfoView {

    if (!_photoInfoView) {
        
        _photoInfoView = [[UIView alloc] init];
        _photoInfoView.backgroundColor = [UIColor redColor];
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

- (UILabel *)ageTwoLabel {

    if (!_ageTwoLabel) {
        _ageTwoLabel      = [[UILabel alloc] init];
        _ageTwoLabel.font = [UIFont systemFontOfSize:12];
        _ageTwoLabel.textColor       = [UIColor grayColor];
        _ageTwoLabel.textAlignment   = NSTextAlignmentCenter;
        _ageTwoLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.15];
        
        _ageTwoLabel.layer.masksToBounds = YES;
        _ageTwoLabel.layer.cornerRadius  = 2;
        
        _ageTwoLabel.text = @"24岁";
    }
    
    return _ageTwoLabel;
}

- (UICollectionView *)collectionView {

    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize                = CGSizeMake(RELATIVE_WIDTH(IPHONE5?150:IPHONE6_PLUS?210:195),
                                                    RELATIVE_WIDTH(IPHONE5?150:IPHONE6_PLUS?210:195));
        layout.minimumLineSpacing      = 2.5;
        layout.minimumInteritemSpacing = 2.5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:layout];
        _collectionView.delegate        = self;
        _collectionView.dataSource      = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:[HL_PhotoCollectionViewCell class] forCellWithReuseIdentifier:[HL_PhotoCollectionViewCell description]];
    }
    
    return _collectionView;
}

- (NSArray *)dataSources {

    if (!_dataSources) {
        _dataSources = @[];
    }

    return _dataSources;
}

- (void)setCommunityCellDelegate:(id<HL_CommunityCellDelegate>)communityCellDelegate {

    _communityCellDelegate = communityCellDelegate;
    
    _hasDes.HL_CommunityCellDelegate = [self.communityCellDelegate respondsToSelector:@selector(communityCell:)];
}

- (void)setCellType:(CommunityCellType)cellType {

    _cellType = cellType;
    
    switch (cellType) {
        case CommunityCellType_Main:
        {
            self.sexImgView.hidden = YES;
            
            [self addSubview:self.ageTwoLabel];
            
            [self.ageTwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.sexImgView);
                make.bottom.top.equalTo(self.sexImgView);
            }];
        }
            break;
            
        case CommunityCellType_Community:
        {
            self.sexImgView.hidden = NO;
        }
            break;
    }
}

#pragma mark - Dealloc

@end
