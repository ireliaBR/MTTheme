//
//  MTElementModel.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MTThemeDefinition.h"

/**
 UI元素对象
 */
@interface MTElementModel : NSObject
/**
 方法
 */
@property (nonatomic, assign) SEL selector;
/**
 标识符
 */
@property (nonatomic, copy) NSString *identifier;

/**
 扩展对象，用于存放，如UIControlStateNormal
 */
@property (nonatomic, strong) id extendObj;
/**
 需要管理主题的视图
 */
@property (nonatomic, weak) UIView *view;
/**
 元素设置内容的类型
 */
@property (nonatomic, assign) MTElementModelType type;

- (instancetype)initWithSelector:(SEL)selector
                      identifier:(NSString *)identifier
                       extendObj:(id)extendObj
                            view:(UIView *)view
                            type:(MTElementModelType)type;
@end
