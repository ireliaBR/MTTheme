//
//  UITextField+MTTheme.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "UITextField+MTTheme.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTThemeBlock.h"

@implementation UITextField (MTTheme)
- (void)theme_setTextColorIdentifier:(NSString *)identifier
                          moduleName:(NSString *)moduleName {
    [MTThemeBlock colorPickerWithView:self selector:@selector(setTextColor:) moduleName:moduleName identifier:identifier extendObj:nil];
}

- (void)theme_setTextIdentifier:(NSString *)identifier
                     moduleName:(NSString *)moduleName {
    [MTThemeBlock textPickerWithView:self selector:@selector(setText:) moduleName:moduleName identifier:identifier extendObj:nil];
}

- (void)theme_setPlaceholderIdentifier:(NSString *)identifier
                            moduleName:(NSString *)moduleName {
    [MTThemeBlock textPickerWithView:self selector:@selector(setPlaceholder:) moduleName:moduleName identifier:identifier extendObj:nil];
}
@end
