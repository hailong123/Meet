//
//  HL_CustomActionSheet.h
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HL_CustomActionSheet : NSObject

- (void)showInView:(UIView *)view
            titles:(nullable NSArray<NSString *>*)titlesArray
        controller:(void(^)(id controller))controller
        completion:(void(^)(UIImage* img))completion;

@end

NS_ASSUME_NONNULL_END
