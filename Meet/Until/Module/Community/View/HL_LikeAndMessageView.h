//
//  HL_LikeAndMessageView.h
//  Meet
//
//  Created by SeaDragon on 2017/9/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HL_LikeAndMessageView;

typedef NS_ENUM(NSInteger, ViewType) {
    ViewType_Like = 0,
    ViewType_Message
};

@protocol HL_LikeAndMessageViewDelegate <NSObject>

- (void)likeAndMessageView:(HL_LikeAndMessageView *_Nullable)view;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HL_LikeAndMessageView : UIView

@property (nonatomic, assign) ViewType type;

@property (nonatomic, copy) NSString *count;

@property (nonatomic, assign) id <HL_LikeAndMessageViewDelegate> messageViewDelegate;

@end

NS_ASSUME_NONNULL_END
