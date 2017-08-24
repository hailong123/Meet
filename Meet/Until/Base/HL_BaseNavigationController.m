//
//  HL_BaseNavigationController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_BaseNavigationController.h"

#import "UINavigationBar+bg.h"

@interface HL_BaseNavigationController ()

@end

@implementation HL_BaseNavigationController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
    
}

#pragma mark - Private Method

- (void)defaultConfig {
    
    self.navigationBar.barTintColor = DEFAULT_COLOR;
    //此处使底部线条失效
    [self.navigationBar setShadowImage:[UIImage new]];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];
}

#pragma mark - Publish Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

#pragma Delloc

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
