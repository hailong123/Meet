//
//  HL_LoginViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_LoginViewController.h"

#import "HL_RegisterViewController.h"
#import "HL_PhoneLoginViewController.h"

@interface HL_LoginViewController ()

@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registeBtn;

@end

@implementation HL_LoginViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self createUI];
    
    [self setBgView];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setHidden:NO];
}

#pragma mark - Private Method

/*
 **
 */

- (void)createUI {

    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registeBtn];
    
    [self.registeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(RELATIVE_HEIGHT(100));
        make.width.mas_equalTo(self.view.width - (RELATIVE_WIDTH(30) * 2));
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-(RELATIVE_Y(120)));
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.registeBtn);
        make.width.equalTo(self.registeBtn);
        make.height.equalTo(self.registeBtn);
        make.bottom.equalTo(self.registeBtn.mas_top).offset(-RELATIVE_Y(35));
    }];
}

/*
 **
 */

- (void)clickBtnEvent:(UIButton *)btn {

    switch (btn.tag) {
        case 100:
        {
        
            HL_PhoneLoginViewController *phoneLoginVC = [[HL_PhoneLoginViewController alloc] init];
            
            [self.navigationController pushViewController:phoneLoginVC animated:YES];
        }
            break;
            
        case 200:
        {
            HL_RegisterViewController *registVC = [[HL_RegisterViewController alloc] init];
            
            [self.navigationController pushViewController:registVC animated:YES];
        
        }
            break;
    }
    
}

- (void)setBgView {

    CGImageRef ref = [UIImage imageNamed:@"login-bg"].CGImage;
    
    self.view.layer.contents = (__bridge id _Nullable)(ref);
    
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (UIButton *)loginBtn {

    if (!_loginBtn) {
        
        _loginBtn     = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.tag = 100;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius  = 55/2;
        _loginBtn.backgroundColor     = DEFAULT_COLOR;
        
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_loginBtn addTarget:self
                      action:@selector(clickBtnEvent:)
            forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _loginBtn;
}


- (UIButton *)registeBtn {

    if (!_registeBtn) {
        
        _registeBtn     = [UIButton buttonWithType:UIButtonTypeCustom];
        _registeBtn.tag = 200;
        _registeBtn.layer.masksToBounds = YES;
        _registeBtn.layer.cornerRadius  = 55/2;
        _registeBtn.backgroundColor     = [UIColor whiteColor];
        
        [_registeBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_registeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_registeBtn addTarget:self
                        action:@selector(clickBtnEvent:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _registeBtn;
}

#pragma mark - Dealloc

@end
