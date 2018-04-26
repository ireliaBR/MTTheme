//
//  MTThemePerformSelector.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTThemePerformSelector.h"



@implementation MTThemePerformSelector
#pragma mark - Lifecycle


#pragma mark - Custom Accessors

#pragma mark - IBActions


#pragma mark - Public
+ (void)performSelector:(SEL)aSelector view:(UIView *)view object:(id)object extendObj:(id)extendObj {
    if (extendObj == nil) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if ([view respondsToSelector:aSelector]) {
            [view performSelector:aSelector withObject:object];
        }
#pragma clang diagnostic pop
        return;
    }
    NSString *aSelectorStr = NSStringFromSelector(aSelector);
    
    NSString *titleColorSelector = NSStringFromSelector(@selector(setTitleColor:forState:));
    if ([aSelectorStr isEqualToString:titleColorSelector]) {
        UIButton *btn = (UIButton *)view;
        [btn setTitleColor:object forState:[extendObj integerValue]];
        return;
    }
    
    NSString *imageSelector = NSStringFromSelector(@selector(setImage:forState:));
    if ([aSelectorStr isEqualToString:imageSelector]) {
        UIButton *btn = (UIButton *)view;
        [btn setImage:object forState:[extendObj integerValue]];
        return;
    }
    
    NSString *backgroundImageSelector = NSStringFromSelector(@selector(setBackgroundImage:forState:));
    if ([aSelectorStr isEqualToString:backgroundImageSelector]) {
        UIButton *btn = (UIButton *)view;
        [btn setBackgroundImage:object forState:[extendObj integerValue]];
        return;
    }
    
    NSString *titleSelector = NSStringFromSelector(@selector(setTitle:forState:));
    if ([aSelectorStr isEqualToString:titleSelector]) {
        UIButton *btn = (UIButton *)view;
        [btn setTitle:object forState:[extendObj integerValue]];
        return;
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([view respondsToSelector:aSelector]) {
        [view performSelector:aSelector withObject:object];
    }
#pragma clang diagnostic pop
}


#pragma mark - Private


#pragma mark - Protocol conformance

@end
