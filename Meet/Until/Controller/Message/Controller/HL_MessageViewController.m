//
//  HL_MessageViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_MessageViewController.h"

@interface HL_MessageViewController ()

@end

@implementation HL_MessageViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self defaultConfig];
}

#pragma mark - Private Method

- (void)defaultConfig {

    self.view.backgroundColor = [UIColor purpleColor];

}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

#pragma mark - Dealloc


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
