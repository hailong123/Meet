//
//  HL_CertificationView.m
//  Meet
//
//  Created by SeaDragon on 2017/9/16.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_CertificationView.h"

@interface HL_CertificationView ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation HL_CertificationView

#pragma mark - Life Cycle

#pragma mark - Private Method

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI {

    for (NSInteger i = 0; i < 2; i++) {
        
        UIButton *btn       = [[UIButton alloc] init];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [btn setImage:[UIImage imageNamed:self.dataSource[0][i]]
             forState:UIControlStateNormal];
        
        [btn setTitle:self.dataSource[1][i]
             forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor blackColor]
                  forState:UIControlStateNormal];
        
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.currentImage.size.height,
                                                 -btn.currentImage.size.width, 0, 0)];
        
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(i*80+15);
            make.top.equalTo(self).offset(15);
            make.size.mas_equalTo(CGSizeMake(RELATIVE_WIDTH(100), RELATIVE_HEIGHT(100)));
        }];
    }
    
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (NSArray *)dataSource {

    if (!_dataSource) {
        _dataSource = @[@[@"my-img1-no",@"my-img2-no"],@[@"实名认证",@"车辆认证"]];
    }
    
    return _dataSource;
}

#pragma Delloc

@end
