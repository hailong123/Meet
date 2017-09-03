//
//  HL_CommunityCell.h
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HL_CommunityCell;

NS_ASSUME_NONNULL_BEGIN

@protocol HL_CommunityCellDelegate <NSObject>

- (void)communityCell:(HL_CommunityCell *)communityCell;

@end

@class HL_CommunityModel;

@interface HL_CommunityCell : UITableViewCell

@property (nonatomic, strong) HL_CommunityModel *communityModel;

@property (nonatomic, assign) id <HL_CommunityCellDelegate> communityCellDelegate;

@end

NS_ASSUME_NONNULL_END
