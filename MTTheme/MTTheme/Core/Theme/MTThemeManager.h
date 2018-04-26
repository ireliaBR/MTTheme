//
//  MTThemeManager.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MTThemeDefinition.h"

@interface MTThemeManager : NSObject
@property (nonatomic, strong, class, readonly) MTThemeManager *manager;

/**
 初始化manager对象

 @param themePath themePath
 */
+ (void)initializeWithDefaultThemePath:(nonnull NSString *)themePath;

/**
 设置修改主题路径，并刷新页面

 @param themePath 主题路径
 */
- (void)setThemePath:(nonnull NSString *)themePath;

/**
 添加需要切换主题的视图

 @param view 视图
 @param identifier 标识符
 @param extendObj 扩展对象
 @param selector 方法
 @param type 类型
 */
- (void)addView:(nonnull UIView *)view
     identifier:(nonnull NSString *)identifier
      extendObj:(nullable id)extendObj
       selector:(nonnull SEL)selector
           type:(MTElementModelType)type
     moduleName:(nonnull NSString *)moduleName;

/**
 通过moduleName和identifier获取颜色

 @param moduleName moduleName
 @param identifier identifier
 @return 颜色
 */
- (UIColor *)getColorWithModuleName:(nonnull NSString *)moduleName
                    identifier:(nonnull NSString *)identifier;

/**
 通过moduleName和identifier获取图片

 @param moduleName moduleName
 @param identifier identifier
 @return 图片
 */
- (UIImage *)getImageWithModuleName:(nonnull NSString *)moduleName
                       identifier:(nonnull NSString *)identifier;
@end
