//
//  HL_EditViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_EditViewController.h"

#import "HL_TextView.h"

@interface HL_EditViewController ()

@property (nonatomic, strong) HL_TextView *textView;

@end

@implementation HL_EditViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
    
    [self createUI];
}

#pragma mark - Private Method

- (void)defaultConfig {

    [self navConfig];
    
}

- (void)navConfig {
    
    NSString *title = nil;

    switch (_type) {
        case EditViewTypeMarriage:
        {
            title = @"发布征婚";
            self.textView.placeholder = @"个人简介, 不少于三张照片, 对另一半的想法.";
        }
            break;
            
        case EditViewTypeCommunity:
        {
            title = @"发布动态";
            self.textView.placeholder = @"发布动态";
        }
            break;
    }
    self.title = title;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNavLeftBarItemWithTitle:@"取消"];
    [self setNavRightBarItemWithTittle:@"发布"];
    
}

- (void)createUI {

    [self.view addSubview:self.textView];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view).offset(RELATIVE_X(30));
        make.right.equalTo(self.view).offset(RELATIVE_X(-30));
        make.height.mas_equalTo(kScreenHeight).multipliedBy(0.5);
    }];
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (HL_TextView *)textView {

    if (!_textView) {
        
        _textView = [[HL_TextView alloc] init];
        
    }
    
    return _textView;
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
