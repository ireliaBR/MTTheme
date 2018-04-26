//
//  UIView+MTTheme.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MTTheme)
- (void)theme_setTintColorIdentifier:(nonnull NSString *)identifier
                          moduleName:(nonnull NSString *)moduleName;
- (void)theme_setBackgroundColorIdentifier:(nonnull NSString *)identifier
                                moduleName:(nonnull NSString *)moduleName;
@end
