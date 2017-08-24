//
//  HL_PhotoManager.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_PhotoManager.h"

#import "HL_PermissionTool.h"

#import "HL_CustomActionSheet.h"

typedef void(^completion)(UIImage *img);

@interface HL_PhotoManager ()

@property (nonatomic, strong) HL_CustomActionSheet *actionSheet;

@property (nonatomic, copy) completion completionBlock;

@end

@implementation HL_PhotoManager

- (void)choosePhotoWithController:(UIViewController *)viewController
                       completion:(nonnull void (^)(UIImage * _Nonnull))completion {
    
    _completionBlock = completion;
    
    [self.actionSheet showInView:[UIApplication sharedApplication].keyWindow.viewController.view
                          titles:nil
                      controller:^(id  _Nonnull controller) {
                        
                          [viewController presentViewController:controller animated:YES completion:nil];
                          
                      } completion:^(UIImage * _Nonnull img) {
                          
                          if (self.completionBlock) {
                              self.completionBlock(img);
                          }
                          
                      }];
}

- (HL_CustomActionSheet *)actionSheet {
    
    if (!_actionSheet) {
        _actionSheet = [[HL_CustomActionSheet alloc] init];
    }
    
    return _actionSheet;
}

@end
