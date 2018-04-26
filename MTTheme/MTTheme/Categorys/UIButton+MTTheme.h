//
//  UIButton+MTTheme.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MTTheme)
- (void)theme_setTitleColorIdentifier:(nonnull NSString *)identifier
                             forState:(UIControlState)state
                           moduleName:(nonnull NSString *)moduleName;
- (void)theme_setBackgroundImageIdentifier:(nonnull NSString *)identifier
                                  forState:(UIControlState)state
                                moduleName:(nonnull NSString *)moduleName;
- (void)theme_setImageIdentifier:(nonnull NSString *)identifier
                        forState:(UIControlState)state
                      moduleName:(nonnull NSString *)moduleName;
- (void)theme_setTitleIdentifier:(nonnull NSString *)identifier
                  forState:(UIControlState)state
                moduleName:(nonnull NSString *)moduleName;
@end
