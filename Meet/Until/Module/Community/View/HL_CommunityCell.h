//
//  HL_CommunityCell.h
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HL_CommunityCell;

typedef NS_ENUM(NSInteger, CommunityCellType) {

    CommunityCellType_Main = 0,//首页
    CommunityCellType_Community
    
};

NS_ASSUME_NONNULL_BEGIN

@protocol HL_CommunityCellDelegate <NSObject>

- (void)communityCell:(HL_CommunityCell *)communityCell;

@end

@class HL_CommunityModel;

@interface HL_CommunityCell : UITableViewCell

@property (nonatomic, strong) HL_CommunityModel *communityModel;

@property (nonatomic, assign) id <HL_CommunityCellDelegate> communityCellDelegate;

@property (nonatomic, assign) CommunityCellType cellType;

@end

NS_ASSUME_NONNULL_END
