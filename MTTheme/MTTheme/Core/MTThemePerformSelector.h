//
//  MTThemePerformSelector.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 用于performselector
 */
@interface MTThemePerformSelector : NSObject

/**
 执行view的selector方法

 @param aSelector aSelector
 @param view view
 @param object 参数1
 @param extendObj 参数2，可为空
 */
+ (void)performSelector:(nonnull SEL)aSelector view:(nonnull UIView *)view object:(nonnull id)object extendObj:(nullable id)extendObj;
@end
