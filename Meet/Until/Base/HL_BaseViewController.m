//
//  HL_BaseViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_BaseViewController.h"

#import "UINavigationBar+bg.h"

@interface HL_BaseViewController ()

@end

@implementation HL_BaseViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
}

#pragma mark - Private Method

- (void)defaultConfig {
//    //方法一：
//    UINavigationBar *navigationBar = self.navigationController.navigationBar;
//    //设置透明的背景图，便于识别底部线条有没有被隐藏
//    [navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor yellowColor]]
//                       forBarPosition:UIBarPositionAny
//                           barMetrics:UIBarMetricsDefault];
//    //此处使底部线条失效
//    [navigationBar setShadowImage:[UIImage new]];
}

#pragma mark - Public Method

/*
 **
 */

- (void)setNavNormalTitleWithTitle:(NSString *)title {

    self.title = title;
    
    UIButton *leftBtn = [self createButtonWithTitle:title
                                            imgName:nil
                                     withoutBackBtn:NO];
    
    [leftBtn addTarget:self
                action:@selector(clickLeftBtnEvent:)
      forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

/*
 **
 */

- (void)setNavLeftBarItemWithTitle:(NSString *)title {

    UIButton *leftBtn = [self createButtonWithTitle:title
                                            imgName:nil
                                     withoutBackBtn:YES];
    
    [leftBtn addTarget:self
                 action:@selector(clickLeftBtnEvent:)
       forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitleColor:DEFAULT_GRAY_COLOR forState:UIControlStateHighlighted];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

/*
 **
 */

- (void)setNavRightBarItemWithTittle:(NSString *)title {

    UIButton *rightBtn = [self createButtonWithTitle:title
                                             imgName:nil
                                      withoutBackBtn:YES];
    
    [rightBtn addTarget:self
                 action:@selector(clickRightBtnEvent:)
       forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitleColor:DEFAULT_GRAY_COLOR forState:UIControlStateHighlighted];
   
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

/*
 **
 */

- (void)setNavLeftBarItemWithImg:(NSString *)imgName {

    UIButton *leftBtn = [self createButtonWithTitle:nil
                                            imgName:imgName
                                     withoutBackBtn:YES];
    
    [leftBtn addTarget:self
                action:@selector(clickLeftBtnEvent:)
      forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

/*
 **
 */

- (void)setNavRightBarItemWithImg:(NSString *)imgName {

    UIButton *rightBtn = [self createButtonWithTitle:nil
                                             imgName:imgName
                                      withoutBackBtn:YES];
    
    [rightBtn addTarget:self
                action:@selector(clickRightBtnEvent:)
      forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    self.navigationItem.rightBarButtonItem = rightItem;

}

/*
 **
 */

- (void)clickLeftBtnEvent:(UIButton *)leftBtn {

    if (self.navigationController.viewControllers.count > 0) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}


/*
 **
 */

- (void)clickRightBtnEvent:(UIButton *)rightBtn {

}

- (UIButton *)createButtonWithTitle:(NSString *)title
                            imgName:(NSString *)imgName
                     withoutBackBtn:(BOOL)without {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title) {
        
        if (!without) {
            [btn setImage:[UIImage imageNamed:@"head-return"]
                 forState:UIControlStateNormal];
            
            btn.frame = CGRectMake(0, 0, 10, 17);
            
        } else {
            
            [btn setTitle:title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [btn sizeToFit];
        }
    }
    
    if (imgName) {
        [btn setBackgroundImage:[UIImage imageNamed:imgName]
                       forState:UIControlStateNormal];
        
        btn.frame = CGRectMake(0, 0, 20, 20);
    }
    
    return btn;
}

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
