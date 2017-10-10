//
//  HL_MessageViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_MessageViewController.h"

@interface HL_MessageViewController ()

@property (nonatomic, strong) UILabel *messageLbl;

@end

@implementation HL_MessageViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self defaultConfig];
}

#pragma mark - Private Method

- (void)defaultConfig {
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.messageLbl];

    [self.messageLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@35);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.equalTo(@20).priorityLow(250);
    }];
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (UILabel *)messageLbl {

    if (!_messageLbl) {
        _messageLbl           = [[UILabel alloc] init];
        _messageLbl.text      = @"暂无消息";
        _messageLbl.font      = [UIFont systemFontOfSize:16];
        _messageLbl.textColor = [UIColor grayColor];
    }
    
    return _messageLbl;
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
