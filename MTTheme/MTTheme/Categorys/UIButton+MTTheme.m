//
//  UIButton+MTTheme.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "UIButton+MTTheme.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTThemeBlock.h"

@implementation UIButton (MTTheme)
- (void)theme_setTitleColorIdentifier:(NSString *)identifier
                             forState:(UIControlState)state
                           moduleName:(NSString *)moduleName {
    [MTThemeBlock colorPickerWithView:self selector:@selector(setTitleColor:forState:) moduleName:moduleName identifier:identifier extendObj:@(state)];
}

- (void)theme_setBackgroundImageIdentifier:(NSString *)identifier
                                  forState:(UIControlState)state
                                moduleName:(NSString *)moduleName {
    [MTThemeBlock imagePickerWithView:self selector:@selector(setBackgroundImage:forState:) moduleName:moduleName identifier:identifier extendObj:@(state)];
}

- (void)theme_setImageIdentifier:(NSString *)identifier
                        forState:(UIControlState)state
                      moduleName:(NSString *)moduleName {
    [MTThemeBlock imagePickerWithView:self selector:@selector(setImage:forState:) moduleName:moduleName identifier:identifier extendObj:@(state)];
}

- (void)theme_setTitleIdentifier:(NSString *)identifier
                        forState:(UIControlState)state
                      moduleName:(NSString *)moduleName {
    [MTThemeBlock textPickerWithView:self selector:@selector(setTitle:forState:) moduleName:moduleName identifier:identifier extendObj:@(state)];
}
@end
