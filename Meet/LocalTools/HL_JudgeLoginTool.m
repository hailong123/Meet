//
//  HL_JudgeLoginTool.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_JudgeLoginTool.h"

#import "HL_LoginViewController.h"

#import "HL_BaseNavigationController.h"
#import "HL_BaseTabBarViewController.h"

#import "HL_MainViewController.h"
#import "HL_UserViewController.h"
#import "HL_MessageViewController.h"
#import "HL_CommunityViewController.h"

@interface HL_JudgeLoginTool ()

@property (nonatomic, strong) HL_MainViewController *mainVC;
@property (nonatomic, strong) HL_UserViewController *userVC;
@property (nonatomic, strong) HL_MessageViewController   *messageVC;
@property (nonatomic, strong) HL_CommunityViewController *commVC;

@end

@implementation HL_JudgeLoginTool

#pragma mark - Setter And Getter 
- (void)setLogined:(BOOL)logined {

    _logined = logined;
    
    if (logined) {
        
        HL_LoginViewController *loginVC = [[HL_LoginViewController alloc] init];
        HL_BaseNavigationController *nav    = [[HL_BaseNavigationController alloc] initWithRootViewController:loginVC];
    
        [UIApplication sharedApplication].delegate.window.rootViewController = nav;
        
    } else {
    
        HL_BaseNavigationController *mainNav = [[HL_BaseNavigationController alloc] initWithRootViewController:self.mainVC];
        
        [self createVC:self.mainVC title:@"相遇" imageName:@"nav-ico1"];
        
        HL_BaseNavigationController *userNav = [[HL_BaseNavigationController alloc] initWithRootViewController:self.userVC];
        
        [self createVC:self.userVC title:@"我的" imageName:@"nav-ico4"];
        
        HL_BaseNavigationController *messageNav = [[HL_BaseNavigationController alloc] initWithRootViewController:self.messageVC];
        
        [self createVC:self.messageVC title:@"消息" imageName:@"nav-ico2"];
        
        HL_BaseNavigationController *communityNav   = [[HL_BaseNavigationController alloc] initWithRootViewController:self.commVC];
        
        [self createVC:self.commVC title:@"动态" imageName:@"nav-ico3"];
    
        HL_BaseTabBarViewController *tabbarVC = [[HL_BaseTabBarViewController alloc] init];
        tabbarVC.viewControllers              = @[mainNav,messageNav,communityNav,userNav];
        
        UIView *view         = [[UIView alloc] init];
        view.frame           = tabbarVC.tabBar.bounds;
        view.backgroundColor = [UIColor colorWithHexString:@"#2b2725"];
        [[UITabBar appearance] insertSubview:view atIndex:0];
        
        [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor yellowColor]
                                                             }
                                                 forState:UIControlStateSelected];
        
        [UIApplication sharedApplication].delegate.window.rootViewController = tabbarVC;
    }
}

#pragma mark - Private Method 
- (void)createVC:(UIViewController *)vc
           title:(NSString *)title
       imageName:(NSString *)imageName {

    vc.title = title;
    
    vc.tabBarItem.image   = [UIImage imageNamed:imageName];
    NSString *imageSelect = [NSString stringWithFormat:@"%@-click",imageName];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:imageSelect]
                                   imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

#pragma mark - Getter 
- (HL_MainViewController *)mainVC {

    if (!_mainVC) {
        
        _mainVC       = [[HL_MainViewController alloc] init];
        _mainVC.title = @"相遇";
    }
    
    return _mainVC;
}

- (HL_MessageViewController *)messageVC {

    if (!_messageVC) {
        
        _messageVC       = [[HL_MessageViewController alloc] init];
        _messageVC.title = @"消息";
    }
    
    return _messageVC;
}

- (HL_CommunityViewController *)commVC {

    if (!_commVC) {
        
        _commVC       = [[HL_CommunityViewController alloc] init];
        _commVC.title = @"动态";
    }

    return _commVC;
}

- (HL_UserViewController *)userVC {

    if (!_userVC) {
        
        _userVC       = [[HL_UserViewController alloc] init];
        _userVC.title = @"我的";
    }
    
    return _userVC;
}

@end
