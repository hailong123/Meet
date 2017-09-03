//
//  HL_RegisterViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_RegisterViewController.h"

#import "HL_RegistUpHeardImgViewController.h"

@interface HL_RegisterViewController ()
<
    UITextFieldDelegate
>

@property (nonatomic, strong) UILabel *lintLbl;
@property (nonatomic, strong) UILabel *titleOneLbl;
@property (nonatomic, strong) UILabel *titleTwoLbl;

@property (nonatomic, strong) UITextField *inputTextField;

@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation HL_RegisterViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    [self defaultConfig];
    
    [self createUI];
}

#pragma mark - Private Method

- (void)defaultConfig {

    [self setNavNormalTitleWithTitle:@"注册"];
    
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)createUI {

    [self.view addSubview:self.titleOneLbl];
    [self.view addSubview:self.titleTwoLbl];
    
    [self.titleOneLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@35);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@35).priorityLow(250);
        make.top.equalTo(self.view).offset(RELATIVE_Y(184));
    }];
    
    [self.titleTwoLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleOneLbl);
        make.width.equalTo(@35).priorityLow(250);
        make.height.equalTo(@25).priorityLow(250);
        make.top.equalTo(self.titleOneLbl.mas_bottom).offset(RELATIVE_Y(30));
    }];

    [self.view addSubview:self.inputTextField];
    
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.titleOneLbl);
        make.centerX.equalTo(self.titleOneLbl);
        make.width.mas_equalTo(self.view.width - (RELATIVE_X(50) * 2));
        make.top.equalTo(self.titleTwoLbl.mas_bottom).offset(RELATIVE_Y(84));
    }];
    
    [self.view addSubview:self.lintLbl];
    
    [self.lintLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.right.equalTo(self.inputTextField);
        make.left.equalTo(self.view).offset(RELATIVE_X(30));
        make.top.equalTo(self.inputTextField.mas_bottom).offset(RELATIVE_Y(15));
    }];
    
    [self.view addSubview:self.nextBtn];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(RELATIVE_HEIGHT(100));
        make.top.equalTo(self.lintLbl.mas_bottom).offset(RELATIVE_Y(100));
        make.width.mas_equalTo(self.view.width - (RELATIVE_WIDTH(30) * 2));
    }];
    
    
}


/*
 **
 */

- (void)clickNextBtn:(UIButton *)nextBtn {

    HL_RegistUpHeardImgViewController *upHeardImgVC = [[HL_RegistUpHeardImgViewController alloc] init];
    
    upHeardImgVC.nickNameTitle = @"Coco";
    
    [self.navigationController pushViewController:upHeardImgVC animated:YES];
    
}

- (void)changeBtnToUse {

    self.nextBtn.backgroundColor        = DEFAULT_COLOR;
    self.nextBtn.userInteractionEnabled = YES;
    
    [self.nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
}

- (void)changeBtnToNoUse {

    self.nextBtn.backgroundColor        = DEFAULT_GRAY_COLOR;
    self.nextBtn.userInteractionEnabled = NO;
    
    [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

#pragma mark - Public Method

#pragma mark - Delegate

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.view endEditing:YES];
    
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {

    NSString *text = [textField.text stringByReplacingCharactersInRange:range
                                                             withString:string];
    
    if (text.length > 0) {
        [self changeBtnToUse];
    } else {
        [self changeBtnToNoUse];
    }
    
    return YES;
}

#pragma mark - Setter And Getter

- (UILabel *)titleTwoLbl {
    
    if (!_titleTwoLbl) {
        _titleTwoLbl           = [[UILabel alloc] init];
        _titleTwoLbl.text      = MEET_REGIST_TITLE_TWO;
        _titleTwoLbl.font      = [UIFont systemFontOfSize:16];
        _titleTwoLbl.textColor = [UIColor colorWithHexString:@"#777777"];
        
    }
    
    return _titleTwoLbl;
}


- (UILabel *)titleOneLbl {

    if (!_titleOneLbl) {
        
        _titleOneLbl               = [[UILabel alloc] init];
        _titleOneLbl.text          = MEET_REGIST_TITLE_ONE;
        _titleOneLbl.font          = [UIFont systemFontOfSize:23];
        _titleOneLbl.textColor     = [UIColor colorWithHexString:@"#333333"];
        _titleOneLbl.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _titleOneLbl;
}

- (UILabel *)lintLbl {
 
    if (!_lintLbl) {
        
        _lintLbl                 = [[UILabel alloc] init];
        _lintLbl.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    }
    
    return _lintLbl;
}

- (UIButton *)nextBtn {

    if (!_nextBtn) {
        
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_nextBtn addTarget:self
                     action:@selector(clickNextBtn:)
           forControlEvents:UIControlEventTouchUpInside];
        
        [_nextBtn setTitle:MEET_REGIST_NEXTBTN_TITILE forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        _nextBtn.titleLabel.font        = [UIFont systemFontOfSize:20 weight:15];
        _nextBtn.backgroundColor        = DEFAULT_GRAY_COLOR;
        _nextBtn.layer.cornerRadius     = 55/2;
        _nextBtn.layer.masksToBounds    = YES;
        _nextBtn.userInteractionEnabled = NO;
    }
    
    return _nextBtn;
}

- (UITextField *)inputTextField {

    if (!_inputTextField) {
        _inputTextField             = [[UITextField alloc] init];
        _inputTextField.delegate    = self;
        _inputTextField.placeholder = MEET_REGIST_TEXTFILE_PLACEHODER;
    }
    
    return _inputTextField;
    
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
