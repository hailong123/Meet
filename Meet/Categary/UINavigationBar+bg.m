//
//  UINavigationBar+bg.m
//  Meet
//
//  Created by SeaDragon on 2017/8/13.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "UINavigationBar+bg.h"

#import <objc/runtime.h>

//static NSString * const kBgViewKey = @"kBgViewKey";

@implementation UINavigationBar (bg)
/*
- (void)setBgView:(UIView *)bgView {
    objc_setAssociatedObject(self, &kBgViewKey, bgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)bgView {

    return objc_getAssociatedObject(self, &kBgViewKey);
    
}

- (void)setNavigationBarBackgroundColor:(UIColor *)color {

    if (!self.bgView) {
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.shadowImage = [UIImage new];
        
        self.bgView      = [[UIView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth,
                                                               CGRectGetHeight(self.bounds) + 20)];
        
        self.bgView.userInteractionEnabled = NO;
        
        self.bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
//        [self insertSubview:self.bgView atIndex:0];
        
    }
    
    self.bgView.backgroundColor = color;
    
}
 */

static char overlayKey;



- (UIView *)overlay

{
    
    return objc_getAssociatedObject(self, &overlayKey);
    
}



- (void)setOverlay:(UIView *)overlay

{
    
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}



- (void)lt_setBackgroundColor:(UIColor *)backgroundColor

{
    
    if (!self.overlay) {
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        
        self.overlay.userInteractionEnabled = NO;
        
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        [self insertSubview:self.overlay atIndex:0];
        
    }
    
    self.overlay.backgroundColor = backgroundColor;
    
}



- (void)lt_setTranslationY:(CGFloat)translationY

{
    
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
    
}

- (void)lt_setElementsAlpha:(CGFloat)alpha

{
    
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        
        view.alpha = alpha;
        
    }];
    
    
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        
        view.alpha = alpha;
        
    }];
    
    
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    
    titleView.alpha = alpha;
    
    //    when viewController first load, the titleView maybe nil
    
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            
            obj.alpha = alpha;
            
            *stop = YES;
            
        }
        
    }];
    
}

- (void)lt_reset

{
    
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self.overlay removeFromSuperview];
    
    self.overlay = nil;
    
}

@end
