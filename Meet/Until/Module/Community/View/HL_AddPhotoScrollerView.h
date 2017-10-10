//
//  HL_AddPhotoScrollerView.h
//  Meet
//
//  Created by SeaDragon on 2017/9/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HL_AddPhotoScrollerView;

NS_ASSUME_NONNULL_BEGIN

@protocol HL_AddPhotoScrollerViewDelegate  <NSObject>

- (void)addPhotoScrollerView:(HL_AddPhotoScrollerView *)scrollerView;

@end

@interface HL_AddPhotoScrollerView : UIView

//相册
@property (nonatomic, strong) NSMutableArray *photoArray;
@property (nonatomic, strong, readonly) UICollectionView *collectionView;
@property (nonatomic, assign) id <HL_AddPhotoScrollerViewDelegate> scrollerViewDelegate;

@end

NS_ASSUME_NONNULL_END
