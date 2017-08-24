//
//  HL_PhoneLoginViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_PhoneLoginViewController.h"

#import "HL_RegisterViewController.h"

#import "HL_JudgeLoginTool.h"

#import "HL_LoginInputView.h"

@interface HL_PhoneLoginViewController ()
<
    HL_LoginInputViewDelegate
>

@property (nonatomic, strong) HL_LoginInputView *passwordView;
@property (nonatomic, strong) HL_LoginInputView *phoneLoginView;

@property (nonatomic, strong) UIButton *logionBtn;
@property (nonatomic, strong) UIButton *forgetBtn;
@property (nonatomic, strong) UIButton *registBtn;

@end

@implementation HL_PhoneLoginViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
    
    [self createUI];
}

#pragma mark - Private Method

- (void)defaultConfig {

    [self setNavNormalTitleWithTitle:@"手机登录"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)createUI {
 
    [self.view addSubview:self.phoneLoginView];
    
    [self.phoneLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(115);
        make.height.mas_equalTo(RELATIVE_HEIGHT(100));
        make.width.mas_equalTo(self.view.width - RELATIVE_X(30)*2);
        make.left.equalTo(self.view).offset(RELATIVE_X(30));
    }];
    
    [self.view addSubview:self.passwordView];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneLoginView);
        make.width.equalTo(self.phoneLoginView);
        make.height.equalTo(self.phoneLoginView);
        make.top.equalTo(self.phoneLoginView.mas_bottom).offset(RELATIVE_Y(60));
    }];
    
    [self.view addSubview:self.logionBtn];
    
    [self.logionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneLoginView);
        make.width.equalTo(self.phoneLoginView);
        make.height.mas_equalTo(RELATIVE_HEIGHT(100));
        make.top.equalTo(self.passwordView.mas_bottom).offset(RELATIVE_Y(100));
    }];
    
    [self.view addSubview:self.forgetBtn];
    [self.forgetBtn sizeToFit];
    
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.logionBtn);
        make.top.equalTo(self.logionBtn.mas_bottom).offset(RELATIVE_Y(30));
    }];
    
    
    [self.view addSubview:self.registBtn];
    [self.registBtn sizeToFit];
    
    [self.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.logionBtn);
        make.centerY.equalTo(self.forgetBtn);
    }];
}

- (void)clickBtn:(UIButton *)btn {

    switch (btn.tag) {
        case 100:
        {
            HL_JudgeLoginTool *loginTool = [[HL_JudgeLoginTool alloc] init];
            
            loginTool.logined = NO;
            
        }
            break;
            
        case 200:
        {
        
        }
            break;
        case 300:
        {
            HL_RegisterViewController *registVC = [[HL_RegisterViewController alloc] init];
            
            [self.navigationController pushViewController:registVC animated:YES];
        }
            break;
    }
    
}

#pragma mark - Public Method

#pragma mark - Delegate

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.view endEditing:YES];
    
}

#pragma mark - Setter And Getter

- (HL_LoginInputView *)phoneLoginView {
 
    if (!_phoneLoginView) {
        
        _phoneLoginView        = [[HL_LoginInputView alloc] init];
        _phoneLoginView.tag    = 400;
        _phoneLoginView.imgStr = @"";
        _phoneLoginView.placeholderStr    = MEET_LOGIN_PHONE_TEXTFIELD_TEXT;
        _phoneLoginView.loginViewDelegate = self;
        
    }
    
    return _phoneLoginView;
}

- (HL_LoginInputView *)passwordView {

    if (!_passwordView) {
        _passwordView        = [[HL_LoginInputView alloc] init];
        _passwordView.tag    = 500;
        _passwordView.imgStr = @"edit-ico4";
        _passwordView.inputType         = InputViewType_Password;
        _passwordView.placeholderStr    = MEET_LOGIN_PASSWORD_TEXTFIELD_TEXT;
        _passwordView.loginViewDelegate = self;
    }
    
    return _passwordView;
}

- (UIButton *)logionBtn {

    if (!_logionBtn) {
        
        _logionBtn     = [UIButton buttonWithType:UIButtonTypeCustom];
        _logionBtn.tag = 100;
        
        [_logionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logionBtn setTitle:MEET_LOGIN_LOGIN_BTN_TITLE forState:UIControlStateNormal];
        [_logionBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        _logionBtn.backgroundColor = [UIColor colorWithHexString:@"#BABBBC"];
        _logionBtn.titleLabel.font = [UIFont systemFontOfSize:20 weight:15];
        
        _logionBtn.layer.masksToBounds = YES;
        _logionBtn.layer.cornerRadius  = 55/2;
        
        [_logionBtn addTarget:self
                       action:@selector(clickBtn:)
             forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _logionBtn;
}

- (UIButton *)forgetBtn {

    if (!_forgetBtn) {
        
        _forgetBtn                 = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetBtn.tag             = 200;
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:13.5];
        
        [_forgetBtn setTitleColor:[UIColor colorWithHexString:@"#777777"] forState:UIControlStateNormal];
        [_forgetBtn setTitle:MEET_LOGIN_FORGET_BTN_TITLE forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:[UIColor grayColor]
                         forState:UIControlStateHighlighted];
        
        
        [_forgetBtn addTarget:self
                       action:@selector(clickBtn:)
             forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _forgetBtn;
}

- (UIButton *)registBtn {

    if (!_registBtn) {
        
        _registBtn                 = [UIButton buttonWithType:UIButtonTypeCustom];
        _registBtn.tag             = 300;
        _registBtn.titleLabel.font          = [UIFont systemFontOfSize:13.5];
        _registBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [_registBtn setTitleColor:[UIColor colorWithHexString:@"#5b84dd"]
                         forState:UIControlStateNormal];
        [_registBtn setTitle:MEET_LOGIN_REGIST_BTN_TITLE forState:UIControlStateNormal];
        [_registBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        [_registBtn addTarget:self
                       action:@selector(clickBtn:)
             forControlEvents:UIControlEventTouchUpInside];
    }

    return _registBtn;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

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
