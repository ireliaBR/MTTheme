//
//  MTFontTable.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTBaseTable.h"
@class MTElementModel;

@interface MTFontTable : MTBaseTable

/**
 通过textDict刷新textElement列表中view的色值
 
 @param textDict textDict
 */
- (void)refreshElementModelTextWithTextDict:(nonnull NSDictionary<NSString *, NSString *> *)textDict;
@end
