//
//  UITextView+MTTheme.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (MTTheme)
- (void)theme_setTextColorIdentifier:(nonnull NSString *)identifier
                          moduleName:(nonnull NSString *)moduleName;
- (void)theme_setTextIdentifier:(nonnull NSString *)identifier
                     moduleName:(nonnull NSString *)moduleName;
@end
