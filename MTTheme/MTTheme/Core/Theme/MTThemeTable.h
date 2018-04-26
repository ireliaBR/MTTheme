//
//  MTThemeTable.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTBaseTable.h"

@interface MTThemeTable : MTBaseTable

/**
 通过colorDict刷新colorElement列表中view的色值

 @param colorDict colorDict
 */
- (void)refreshElementModelColorWithColorDict:(nonnull NSDictionary<NSString *, NSString *> *)colorDict;

/**
 通过imageDict刷新imageElement列表中view的图片

 @param imageStrs imageStrs
 @param bundlePath bundle地址
 @param moduleName 模块名字
 */
- (void)refreshElementModelImageWithImageStrs:(nonnull NSArray<NSString *> *)imageStrs
                                   bundlePath:(NSString *)bundlePath
                                   moduleName:(NSString *)moduleName;
@end
