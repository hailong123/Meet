//
//  HL_AddPhotoScrollerView.m
//  Meet
//
//  Created by SeaDragon on 2017/9/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_AddPhotoScrollerView.h"

#import "HL_PhotoCollectionViewCell.h"

static NSString * const kPhotoCollectionViewCellIdentifier = @"kPhotoCollectionViewCellIdentifier";

@interface HL_AddPhotoScrollerView ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HL_AddPhotoScrollerView {
    struct {
        unsigned int HL_AddPhotoScrollerViewDelegate : 1;
    }_hasDes;
}

#pragma mark - Private Method

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI {

    //表格视图
    [self addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
}

#pragma mark - Publish Method

#pragma mark - Delegate
//UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoArray.count;
}

//UICollectionViewDataSource
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HL_PhotoCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:kPhotoCollectionViewCellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == self.photoArray.count - 1) {
        collectionViewCell.photoImageView.image = [UIImage imageNamed:@"write-add"];
    } else {
        collectionViewCell.photoImageView.image = self.photoArray[indexPath.row];
    }
    
    return collectionViewCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == self.photoArray.count - 1) {
        if (_hasDes.HL_AddPhotoScrollerViewDelegate) {
            [self.scrollerViewDelegate addPhotoScrollerView:self];
        }
    }
    
}

#pragma mark - Setter And Getter

- (UICollectionView *)collectionView {

    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing          = 2.5;
        flowLayout.minimumInteritemSpacing     = 2.5;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
        
        flowLayout.itemSize = CGSizeMake((RELATIVE_WIDTH(200)) - 10,
                                         (RELATIVE_WIDTH(200)) - 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:flowLayout];
        
        _collectionView.delegate   = self;
        _collectionView.dataSource = self;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:[HL_PhotoCollectionViewCell class]
            forCellWithReuseIdentifier:kPhotoCollectionViewCellIdentifier];
    }
    
    return _collectionView;
}

- (void)setScrollerViewDelegate:(id<HL_AddPhotoScrollerViewDelegate>)scrollerViewDelegate {

    _scrollerViewDelegate = scrollerViewDelegate;
    
    _hasDes.HL_AddPhotoScrollerViewDelegate = [scrollerViewDelegate respondsToSelector:@selector(addPhotoScrollerView:)];
    
}

#pragma Delloc

@end
