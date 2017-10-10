//
//  HL_PhotoCollectionViewCell.m
//  Meet
//
//  Created by SeaDragon on 2017/8/26.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_PhotoCollectionViewCell.h"

@implementation HL_PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self defaultConfig];
    }
    
    return self;
}

- (void)defaultConfig {

    [self.contentView addSubview:self.photoImageView];
    
    [self.photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
    }];
}

- (UIImageView *)photoImageView {

    if (!_photoImageView) {
        _photoImageView = [[UIImageView alloc] init];
    }
    
    return _photoImageView;
}

@end
