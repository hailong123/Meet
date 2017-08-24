//
//  HL_TextView.m
//  Meet
//
//  Created by SeaDragon on 2017/8/24.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_TextView.h"

@interface HL_TextView ()
<
    UITextViewDelegate
>

@property (nonatomic, strong) UITextView *textView;

@end

@implementation HL_TextView

#pragma mark - Life Cycle

#pragma mark - Private Method

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI {

    [self addSubview:self.textView];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self);
        make.top.equalTo(self).offset(RELATIVE_Y(10));
    }];
    
}

#pragma mark - Publish Method

#pragma mark - Delegate

#pragma mark UITextViewDelegte
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    _textView.text      = @"";
    _textView.textColor = [UIColor blackColor];
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {

    NSString *textStr = [textView.text stringByReplacingCharactersInRange:range
                                                               withString:text];
    
    if ([textStr isEqualToString:@""]) {
        
        _textView.text      = self.placeholder;
        _textView.textColor = [UIColor grayColor];
        
        [_textView resignFirstResponder];
        
    } else {
        
        textView.textColor = [UIColor blackColor];
    }

    
    return YES;
}

#pragma mark - Setter And Getter

- (UITextView *)textView {

    if (!_textView) {
        
        _textView           = [[UITextView alloc] init];
        _textView.font      = [UIFont systemFontOfSize:15];
        _textView.delegate  = self;
        _textView.textColor = [UIColor grayColor];
    }
    
    return _textView;
}

- (void)setPlaceholder:(NSString *)placeholder {

    _placeholder       = placeholder;

    self.textView.text = placeholder;
}


#pragma Delloc

@end
