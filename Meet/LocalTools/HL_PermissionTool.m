//
//  HL_PermissionTool.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_PermissionTool.h"

#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@implementation HL_PermissionTool

/*
 **相机权限
 */

+ (BOOL)hasPermissionGetCamera {

    BOOL hasCameraPermission = YES;
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    
    if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied) {
        hasCameraPermission = NO;
    }
    
    return hasCameraPermission;
}

/*
 **相册权限
 */

+ (BOOL)hasPermissionGetPhoto {
    
    BOOL hasPhotoPermission = YES;
    
    hasPhotoPermission = [ALAssetsLibrary authorizationStatus];
    
    return hasPhotoPermission;
}

@end
