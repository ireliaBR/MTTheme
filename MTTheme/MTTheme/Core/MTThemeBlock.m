//
//  MTThemeBlock.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTThemeBlock.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTThemeManager.h"
#import "MTFontManager.h"
#import "MTThemePerformSelector.h"

@implementation MTThemeBlock
#pragma mark - Lifecycle


#pragma mark - Custom Accessors

#pragma mark - IBActions


#pragma mark - Public

+ (void)colorPickerWithView:(UIView *)view
                   selector:(SEL)selector
                 moduleName:(NSString *)moduleName
                 identifier:(NSString *)identifier
                  extendObj:(id)extendObj {
    NSAssert([view respondsToSelector:selector], @"%@ 无法响应 %@, 设置theme color失败", view, NSStringFromSelector(selector));
    
    UIColor *color = [MTThemeManager.manager getColorWithModuleName:moduleName
                                                         identifier:identifier];
    [self initializeThemeViewWithObj:color extendObj:extendObj identifier:identifier moduleName:moduleName selector:selector view:view type:MTElementModelTypeColor];
}

+ (void)imagePickerWithView:(UIView *)view
                   selector:(SEL)selector
                 moduleName:(NSString *)moduleName
                 identifier:(NSString *)identifier
                  extendObj:(id)extendObj {
    NSAssert([view respondsToSelector:selector], @"%@ 无法响应 %@, 设置theme image失败", view, NSStringFromSelector(selector));
    
    UIImage *image = [MTThemeManager.manager getImageWithModuleName:moduleName
                                                         identifier:identifier];
    [self initializeThemeViewWithObj:image extendObj:extendObj identifier:identifier moduleName:moduleName selector:selector view:view type:MTElementModelTypeImage];
}

+ (void)textPickerWithView:(UIView *)view
                  selector:(SEL)selector
                moduleName:(NSString *)moduleName
                identifier:(NSString *)identifier
                 extendObj:(nullable id)extendObj{
    NSString *text = [MTFontManager.manager getTextWithModuleName:moduleName identifier:identifier];
    [MTThemePerformSelector performSelector:selector view:view object:text extendObj:extendObj];
    [MTFontManager.manager addView:view
                         identifier:identifier
                          extendObj:extendObj
                           selector:selector
                               type:MTElementModelTypeText
                         moduleName:moduleName];
}

#pragma mark - Private


/**
 初始化视图内容，并添加到监听者对象中

 @param obj 参数1
 @param extendObj 参数2
 @param identifier identifier
 @param moduleName moduleName
 @param selector selector
 @param view view
 */
+ (void)initializeThemeViewWithObj:(NSObject * _Nonnull)obj
                    extendObj:(id _Nullable)extendObj
                   identifier:(NSString * _Nonnull)identifier
                   moduleName:(NSString * _Nonnull)moduleName
                     selector:(SEL _Nonnull)selector
                         view:(UIView * _Nonnull)view
                         type:(MTElementModelType)type {
    [MTThemePerformSelector performSelector:selector view:view object:obj extendObj:extendObj];
    [MTThemeManager.manager addView:view
                         identifier:identifier
                          extendObj:extendObj
                           selector:selector
                               type:type
                         moduleName:moduleName];
}

#pragma mark - Protocol conformance

@end
