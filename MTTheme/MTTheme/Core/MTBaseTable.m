//
//  MTBaseTable.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTBaseTable.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTElementModel.h"

@implementation MTBaseTable
#pragma mark - Lifecycle


#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public
- (void)addElementModel:(MTElementModel *)elementModel {
    NSAssert(NO, @"MTBaseTable 子类必须重写 %s", __func__);
}

- (void)checkElementModels {
    NSAssert(NO, @"MTBaseTable 子类必须重写 %s", __func__);
}

- (void)executeElementWithElementModels:(NSMutableArray<MTElementModel *>*)elementModels handler:(void(^)(MTElementModel *element))handler {
    NSMutableArray<MTElementModel *> *cleanElements = [[NSMutableArray alloc] init];
    for (MTElementModel *element in elementModels) {
        if (element.view == nil) {
            [cleanElements addObject:element];
            continue;
        }
        if (handler != nil) {
            handler(element);
        }
    }
    [elementModels removeObjectsInArray:cleanElements];
}
#pragma mark - Private


#pragma mark - Protocol conformance

@end
