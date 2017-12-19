//
//  HL_RegisteFinishViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_RegisteFinishViewController.h"

@interface HL_RegisteFinishViewController ()
<
    UITextFieldDelegate
>

@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, strong) UIButton *verifierBtn;

@property (nonatomic, strong) UIButton *buttomBtn;

@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *verifierPasswordTextField;

@property (nonatomic, strong) UILabel *arceLbl;

@end

@implementation HL_RegisteFinishViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
 
    [self createUI];
}

- (void)defaultConfig {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNavNormalTitleWithTitle:@"注册"];
    
}

- (void)createUI {

    [self.view addSubview:self.arceLbl];
    
    [self.arceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(45);
        make.top.equalTo(self.view).offset(125);
        make.left.equalTo(self.view).offset(RELATIVE_X(50));
    }];
    
    UILabel *arceLineLbl        = [[UILabel alloc] init];
    arceLineLbl.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [self.view addSubview:arceLineLbl];
    
    [arceLineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.right.equalTo(self.arceLbl);
        make.left.mas_equalTo(RELATIVE_X(30));
        make.top.equalTo(self.arceLbl.mas_bottom);
    }];
    
    [self.view addSubview:self.verifierBtn];
    
    [self.verifierBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.arceLbl);
        make.height.mas_equalTo(RELATIVE_HEIGHT(100));
        make.width.mas_equalTo(RELATIVE_WIDTH(150));
        make.right.equalTo(self.view).offset(RELATIVE_X(-30));
    }];

    [self.view addSubview:self.phoneTextField];
    
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.arceLbl);
        make.height.equalTo(self.arceLbl);
        make.right.equalTo(self.verifierBtn.mas_left).offset(-25);
        make.left.equalTo(self.arceLbl.mas_right).offset(RELATIVE_X(30));
    }];

    UILabel *phoneLineLbl        = [[UILabel alloc] init];
    phoneLineLbl.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [self.view addSubview:phoneLineLbl];
    
    [phoneLineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(self.phoneTextField);
        make.right.equalTo(self.phoneTextField);
        make.top.equalTo(self.phoneTextField.mas_bottom);
    }];
    
    [self.view addSubview:self.passwordTextField];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.arceLbl);
        make.height.equalTo(self.arceLbl);
        make.right.equalTo(self.verifierBtn);
        make.top.equalTo(self.arceLbl.mas_bottom).offset(RELATIVE_Y(30));
    }];
    
    UILabel *passwordLineLbl        = [[UILabel alloc] init];
    passwordLineLbl.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [self.view addSubview:passwordLineLbl];
    
    [passwordLineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(self.passwordTextField);
        make.right.equalTo(self.passwordTextField);
        make.top.equalTo(self.passwordTextField.mas_bottom);
    }];
    
    [self.view addSubview:self.verifierPasswordTextField];

    [self.verifierPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.arceLbl);
        make.height.equalTo(self.arceLbl);
        make.right.equalTo(self.verifierBtn);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(RELATIVE_Y(30));
    }];
    
    UILabel *verifierPasswordLineLbl        = [[UILabel alloc] init];
    verifierPasswordLineLbl.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [self.view addSubview:verifierPasswordLineLbl];
    
    [verifierPasswordLineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(self.verifierPasswordTextField);
        make.right.equalTo(self.verifierPasswordTextField);
        make.top.equalTo(self.verifierPasswordTextField.mas_bottom);
    }];
    
    [self.view addSubview:self.nextBtn];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.arceLbl);
        make.right.equalTo(self.verifierBtn);
        make.height.mas_equalTo(RELATIVE_HEIGHT(100));
        make.top.equalTo(self.verifierPasswordTextField.mas_bottom).offset(35);
    }];
    
    [self.view addSubview:self.buttomBtn];
    
    [self.buttomBtn sizeToFit];
    [self.buttomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-35);
    }];
}

#pragma mark - Private Method

- (void)clickBtn:(UIButton *)btn {

    switch (btn.tag) {
        case 100:
        {
        
        }
            break;
            
        case 200:
        {
        
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

- (UILabel *)arceLbl {

    if (!_arceLbl) {
        _arceLbl                 = [[UILabel alloc] init];
        _arceLbl.text            = @"+86";
        _arceLbl.textColor       = [UIColor colorWithHexString:@"#bbbbbb"];
        _arceLbl.textAlignment   = NSTextAlignmentCenter;

    }
    
    return _arceLbl;
}

- (UIButton *)verifierBtn {

    if (!_verifierBtn) {
        
        _verifierBtn     = [UIButton buttonWithType:UIButtonTypeCustom];
        _verifierBtn.tag = 200;
        _verifierBtn.titleLabel.font     = [UIFont systemFontOfSize:17 weight:13];
        _verifierBtn.layer.masksToBounds = YES;
        _verifierBtn.layer.cornerRadius  = RELATIVE_HEIGHT(100)/2;
        
        [_verifierBtn setTitle:MEET_REGIST_VERSIT_TITLE
                      forState:UIControlStateNormal];
        
        [_verifierBtn setTitleColor:[UIColor whiteColor]
                           forState:UIControlStateNormal];
        [_verifierBtn setTitleColor:[UIColor grayColor]
                           forState:UIControlStateHighlighted];
        
        [_verifierBtn addTarget:self
                         action:@selector(clickBtn:)
               forControlEvents:UIControlEventTouchUpInside];
        
        _verifierBtn.backgroundColor = DEFAULT_GRAY_COLOR;
    }
    
    return _verifierBtn;
}

- (UITextField *)passwordTextField {

    if (!_passwordTextField) {
     
        _passwordTextField             = [[UITextField alloc] init];
        _passwordTextField.tag         = 300;
        _passwordTextField.delegate    = self;
        _passwordTextField.placeholder = MEET_REGIST_VERISTPASSWORD_TEXTFIELD_PLACEHODER;
    }

    return _passwordTextField;
}

- (UITextField *)verifierPasswordTextField {

    if (!_verifierPasswordTextField) {
        _verifierPasswordTextField             = [[UITextField alloc] init];
        _verifierPasswordTextField.tag         = 400;
        _verifierPasswordTextField.delegate    = self;
        _verifierPasswordTextField.placeholder = MEET_REGIST_PASSWORD_TEXTFIELD_PLACEHODER;
    }
    
    return _verifierPasswordTextField;
}

- (UITextField *)phoneTextField {

    if (!_phoneTextField) {
        
        _phoneTextField             = [[UITextField alloc] init];
        _phoneTextField.tag         = 500;
        _phoneTextField.delegate    = self;
        _phoneTextField.placeholder = MEET_REGIST_PHONE_TEXTFIELD_PLACEHODER;
    }

    return _phoneTextField;
}

- (UIButton *)nextBtn {
    
    if (!_nextBtn) {
        
        _nextBtn       = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.tag   = 100;
        
        _nextBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:13];
        _nextBtn.backgroundColor = DEFAULT_GRAY_COLOR;
        
        _nextBtn.layer.masksToBounds = YES;
        _nextBtn.layer.cornerRadius  = 55/2;
        
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn setTitle:MEET_REGIST_FINISH_TITLE forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        [_nextBtn addTarget:self
                     action:@selector(clickBtn:)
           forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _nextBtn;
}

- (UIButton *)buttomBtn {

    if (!_buttomBtn) {
        
        _buttomBtn = [UIButton buttonWithType:UIButtonTypeCustom];

        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:MEET_REGIST_BUTTOM_TITLE];
        
        [attributedStr addAttribute:NSForegroundColorAttributeName
                              value:[UIColor colorWithHexString:@"#0F92BC"]
                              range:NSMakeRange(5, 12)];
        [attributedStr addAttribute:NSForegroundColorAttributeName
                              value:DEFAULT_GRAY_COLOR
                              range:NSMakeRange(0, 5)];
        [attributedStr addAttribute:NSFontAttributeName
                              value:[UIFont systemFontOfSize:12 weight:10]
                              range:NSMakeRange(0, 17)];
        
        [_buttomBtn setAttributedTitle:attributedStr forState:UIControlStateNormal];
        
    }
    
    return _buttomBtn;
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
