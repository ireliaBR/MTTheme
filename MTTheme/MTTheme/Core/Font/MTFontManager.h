//
//  MTFontManager.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MTThemeDefinition.h"

@interface MTFontManager : NSObject
@property (nonatomic, strong, class, readonly) MTFontManager *manager;

/**
 初始化manager对象
 
 @param fontPath fontPath
 */
+ (void)initializeWithDefaultFontPath:(nonnull NSString *)fontPath;

/**
 设置修改主题路径，并刷新页面
 
 @param fontPath 主题路径
 */
- (void)setFontPath:(nonnull NSString *)fontPath;

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
 通过moduleName和identifier获取text
 
 @param moduleName moduleName
 @param identifier identifier
 @return text
 */
- (NSString *)getTextWithModuleName:(nonnull NSString *)moduleName
                         identifier:(nonnull NSString *)identifier;
@end
