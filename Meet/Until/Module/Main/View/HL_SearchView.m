//
//  HL_SearchView.m
//  Meet
//
//  Created by SeaDragon on 2017/9/16.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_SearchView.h"

@interface HL_SearchView ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIButton *searchButton;

@end

@implementation HL_SearchView {

    struct {
        unsigned int SearchViewDelegate : 1;
    }_hasDes;
    
}

#pragma mark - Private Method

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        [self createSearchUI];
    }
    
    return self;
}

- (void)createSearchUI {

    //背景
    [self addSubview:self.bgImageView];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(RELATIVE_X(30));
        make.right.equalTo(self).offset(RELATIVE_X(-30));
    }];
    
    //输入框
    [self.bgImageView addSubview:self.textField];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.bgImageView);
        make.centerY.equalTo(self.bgImageView);
        make.right.equalTo(self.bgImageView).offset(-80);
        make.left.equalTo(self.bgImageView).offset(RELATIVE_X(40));
    }];
    
    //按钮
    [self.bgImageView addSubview:self.searchButton];
    
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImageView);
        make.right.equalTo(self.bgImageView).offset(-30);
        make.size.mas_equalTo(CGSizeMake(RELATIVE_HEIGHT(35), RELATIVE_WIDTH(35)));
    }];
    
}

- (void)clickSearchButton:(UIButton *)searchBtn {
    if (_hasDes.SearchViewDelegate) {
        [self.delegate searchViewDelegate:self
                                searchStr:self.textField.text];
    }
}


#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (UITextField *)textField {

    if (!_textField) {
        
        _textField = [[UITextField alloc] init];
        _textField.textColor = [UIColor whiteColor];
        NSString *holderText = @"请输入MEET相遇ID或者昵称";
        
        NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
        [placeholder addAttribute:NSForegroundColorAttributeName
                            value:[UIColor whiteColor]
                            range:NSMakeRange(0, holderText.length)];
        
        [placeholder addAttribute:NSFontAttributeName
                            value:[UIFont boldSystemFontOfSize:15]
                            range:NSMakeRange(0, holderText.length)];
        
        _textField.attributedPlaceholder = placeholder;

    }
    
    return _textField;
}

- (UIImageView *)bgImageView {

    if (!_bgImageView) {
        _bgImageView       = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:@"search-input"];
        _bgImageView.userInteractionEnabled = YES;
    }
    
    return _bgImageView;
}

- (UIButton *)searchButton {

    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchButton setBackgroundImage:[UIImage imageNamed:@"search-ico"]
                                 forState:UIControlStateNormal];
        [_searchButton addTarget:self
                          action:@selector(clickSearchButton:)
                forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _searchButton;
}

- (void)setDelegate:(id<SearchViewDelegate>)delegate {

    _delegate = delegate;
    
    _hasDes.SearchViewDelegate = [self.delegate respondsToSelector:@selector(searchViewDelegate:searchStr:)];
}

#pragma Delloc

@end
