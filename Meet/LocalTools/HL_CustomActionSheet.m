//
//  HL_CustomActionSheet.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_CustomActionSheet.h"

typedef void(^completion)(UIImage *img);
typedef void(^showControllerBlock)(id controller);

@interface HL_CustomActionSheet ()
<
    UIActionSheetDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
>

@property (nonatomic, strong) UIActionSheet *actionSheet;

@property (nonatomic, copy) completion completionBlock;
@property (nonatomic, copy) showControllerBlock controllerBock;

@end

@implementation HL_CustomActionSheet

#pragma mark - publc Method

- (void)showInView:(UIView *)view titles:(NSArray<NSString *> *)titlesArray
        controller:(nonnull void (^)(id _Nonnull))controller
        completion:(nonnull void (^)(UIImage * _Nonnull))completion {
    
    self.actionSheet = [[UIActionSheet alloc] initWithTitle:MEET_REGIST_PHOTO_SHEET_TITLE
                                                   delegate:self
                                          cancelButtonTitle:MEET_REGIST_PHOTO_CANCEL_TITLE
                                     destructiveButtonTitle:nil
                                          otherButtonTitles:MEET_REGIST_PHOTO_CANMAR_TITLE,
                                                            MEET_REGIST_PHOTO_ASSETS_TITLE, nil];
    
    _completionBlock = completion;
    _controllerBock  = controller;
    
    [self.actionSheet showInView:view];
}

#pragma mark - ActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    UIImagePickerController *pickerController   = [[UIImagePickerController alloc] init];
    pickerController.delegate      = self;
    pickerController.allowsEditing = YES;
    
    switch (buttonIndex) {
        case 0:
        {
            sourceType = UIImagePickerControllerSourceTypeCamera;
        }
            
            break;
        case 1:
        {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
            break;
    }
    
    pickerController.sourceType = sourceType;
    
    if (_controllerBock) {
        _controllerBock(pickerController);
    }
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    UIImage *imageTwo = info[UIImagePickerControllerEditedImage];
    
    if (imageTwo) {
        if (self.completionBlock) {
            self.completionBlock(imageTwo);
        }
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
