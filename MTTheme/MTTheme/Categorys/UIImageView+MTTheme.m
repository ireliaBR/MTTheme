//
//  UIImageView+MTTheme.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "UIImageView+MTTheme.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTThemeBlock.h"

@implementation UIImageView (MTTheme)
- (void)theme_setImageIdentifier:(NSString *)identifier
                      moduleName:(NSString *)moduleName {
    [MTThemeBlock imagePickerWithView:self selector:@selector(setImage:) moduleName:moduleName identifier:identifier extendObj:nil];
}
@end
