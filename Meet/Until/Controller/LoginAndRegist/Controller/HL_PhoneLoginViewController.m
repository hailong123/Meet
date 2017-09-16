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
    HL_LoginInputViewDelegate,
    UITextFieldDelegate
>

@property (nonatomic, strong) HL_LoginInputView *passwordView;
@property (nonatomic, strong) HL_LoginInputView *phoneLoginView;

@property (nonatomic, strong) UIButton *logionBtn;
@property (nonatomic, strong) UIButton *forgetBtn;
@property (nonatomic, strong) UIButton *registBtn;

@property (nonatomic, assign) BOOL phoneSwitch;
@property (nonatomic, assign) BOOL passwordSwitch;

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
        case 600:
        {
            HL_JudgeLoginTool *loginTool = [[HL_JudgeLoginTool alloc] init];
            
            loginTool.logined = NO;
            
        }
            break;
            
        case 700:
        {
        
        }
            break;
        case 800:
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

#pragma mark UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {

    NSString *textFieldStr = [textField.text stringByReplacingCharactersInRange:range
                                                                     withString:string];
    
    
    if (self.passwordSwitch && self.phoneSwitch) {
        self.logionBtn.backgroundColor        = DEFAULT_COLOR;
        self.logionBtn.userInteractionEnabled = YES;
        [self.logionBtn setTitleColor:[UIColor blackColor]
                             forState:UIControlStateNormal];
    }
    
    switch (textField.tag) {
        case 100:
        {
            self.phoneSwitch = textFieldStr.length >= 11;
            
            return !(textFieldStr.length > 11);
        }
            break;
            
        case 200:
        {
            self.passwordSwitch = textFieldStr.length >= 8;
            
            return !(textFieldStr.length > 18);
        }
            break;
    }
    
    return YES;
}

#pragma mark - Setter And Getter

- (HL_LoginInputView *)phoneLoginView {
 
    if (!_phoneLoginView) {
        
        _phoneLoginView        = [[HL_LoginInputView alloc] init];
        _phoneLoginView.tag    = 400;
        _phoneLoginView.imgStr = @"phone-ico1";
        _phoneLoginView.placeholderStr          = MEET_LOGIN_PHONE_TEXTFIELD_TEXT;
        _phoneLoginView.inputTextField.tag      = 100;
        _phoneLoginView.loginViewDelegate       = self;
        _phoneLoginView.inputTextField.delegate = self;
        
    }
    
    return _phoneLoginView;
}

- (HL_LoginInputView *)passwordView {

    if (!_passwordView) {
        _passwordView        = [[HL_LoginInputView alloc] init];
        _passwordView.tag    = 500;
        _passwordView.imgStr = @"phone-ico2";
        _passwordView.inputType         = InputViewType_Password;
        _passwordView.placeholderStr    = MEET_LOGIN_PASSWORD_TEXTFIELD_TEXT;
        _passwordView.inputTextField.tag      = 200;
        _passwordView.loginViewDelegate       = self;
        _passwordView.inputTextField.delegate = self;
        
    }
    
    return _passwordView;
}

- (UIButton *)logionBtn {

    if (!_logionBtn) {
        
        _logionBtn     = [UIButton buttonWithType:UIButtonTypeCustom];
        _logionBtn.tag = 600;
        
        [_logionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logionBtn setTitle:MEET_LOGIN_LOGIN_BTN_TITLE forState:UIControlStateNormal];
        [_logionBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        _logionBtn.backgroundColor        = DEFAULT_GRAY_COLOR;
        _logionBtn.titleLabel.font        = [UIFont systemFontOfSize:20 weight:13];
//        _logionBtn.userInteractionEnabled = NO;
        
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
        _forgetBtn.tag             = 700;
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
        _registBtn.tag             = 800;
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
