//
//  HL_SearchView.h
//  Meet
//
//  Created by SeaDragon on 2017/9/16.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HL_SearchView;

@protocol SearchViewDelegate <NSObject>

- (void)searchViewDelegate:(HL_SearchView *_Nullable)searchView searchStr:(NSString *)searchStr;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HL_SearchView : UIView

@property (nonatomic, assign) id<SearchViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
