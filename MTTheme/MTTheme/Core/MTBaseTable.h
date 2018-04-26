//
//  MTBaseTable.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MTElementModel;

/**
 保存elementModel的基类
 */
@interface MTBaseTable : NSObject

/**
 添加元素对象
 
 @param elementModel 元素对象
 */
- (void)addElementModel:(nonnull MTElementModel *)elementModel;

/**
 检验元素对象列表中空的view对象
 */
- (void)checkElementModels;

/**
 执行elementModels中view不为为nil的对象，触发handler
 
 @param elementModels elementModels
 @param handler handler
 */
- (void)executeElementWithElementModels:(NSMutableArray<MTElementModel *>*)elementModels handler:(void(^)(MTElementModel *element))handler;
@end
