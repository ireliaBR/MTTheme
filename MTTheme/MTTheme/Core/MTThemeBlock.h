//
//  MTThemeBlock.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



/**
 view设置的block
 */
@interface MTThemeBlock : NSObject
/**
 视图的color设置

 @param view view
 @param identifier identifier
 @param selector selector
 @param moduleName moduleName
 */
+ (void)colorPickerWithView:(nonnull UIView *)view
                   selector:(nonnull SEL)selector
                 moduleName:(nonnull NSString *)moduleName
                 identifier:(nonnull NSString *)identifier
                  extendObj:(nullable id)extendObj;


/**
 视图的image设置
 
 @param view view
 @param identifier identifier
 @param selector selector
 @param moduleName moduleName
 */
+ (void)imagePickerWithView:(nonnull UIView *)view
                   selector:(nonnull SEL)selector
                 moduleName:(nonnull NSString *)moduleName
                 identifier:(nonnull NSString *)identifier
                  extendObj:(nullable id)extendObj;


/**
 视图的text设置

 @param view view
 @param selector selector
 @param moduleName moduleName
 @param identifier identifier
 */
+ (void)textPickerWithView:(nonnull UIView *)view
                   selector:(nonnull SEL)selector
                 moduleName:(nonnull NSString *)moduleName
                 identifier:(nonnull NSString *)identifier
                 extendObj:(nullable id)extendObj;
@end
