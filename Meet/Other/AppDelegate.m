//
//  AppDelegate.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "AppDelegate.h"

#import "HL_UserWarpper.h"
#import "HL_JudgeLoginTool.h"

#import <YTKNetworkConfig.h>

#import "HL_UrlArgumentsFilter.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self judgeLoginStatus];
    
    [self registIM];
    
    [self ytkRequestConfig];
    
    return YES;
}

- (void)judgeLoginStatus {
    
    HL_JudgeLoginTool *loginTool = [[HL_JudgeLoginTool alloc] init];
    
    [HL_UserWarpper sharedInstance].logined = YES;
    
    loginTool.logined            = [HL_UserWarpper sharedInstance].logined;
    
}

- (void)registIM {

    self.window.backgroundColor = [UIColor whiteColor];
    
//    NIMSDKOption *option = [NIMSDKOption optionWithAppKey:@"APPKEY"];
//    
//    option.apnsCername = @"推送证书名称";
//    option.pkCername   = @"推送证书名称";
//    
//    [[NIMSDK sharedSDK] registerWithOption:option];
}

- (void)ytkRequestConfig {

    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl           = @"http://localhost:8880/Meet/public/";
    
    NSDictionary *commonArguments = @{
                                      @"token":@"888888888888",
                                      @"version":[UIDevice currentDevice].systemVersion,
                                      @"plaform":@"iOS_iPhone"
                                      };
    
    HL_UrlArgumentsFilter *urlFilter = [HL_UrlArgumentsFilter filterWithArguments:commonArguments];
    
    [config addUrlFilter:urlFilter];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
