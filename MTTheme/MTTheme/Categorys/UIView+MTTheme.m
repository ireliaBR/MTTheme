//
//  UIView+MTTheme.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "UIView+MTTheme.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTThemeBlock.h"

@implementation UIView (MTTheme)
- (void)theme_setTintColorIdentifier:(NSString *)identifier
                          moduleName:(NSString *)moduleName {
    [MTThemeBlock colorPickerWithView:self selector:@selector(setTintColor:) moduleName:moduleName identifier:identifier extendObj:nil];
}

- (void)theme_setBackgroundColorIdentifier:(NSString *)identifier
                                moduleName:(NSString *)moduleName {
    [MTThemeBlock colorPickerWithView:self selector:@selector(setBackgroundColor:) moduleName:moduleName identifier:identifier extendObj:nil];
}
@end
