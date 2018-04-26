//
//  MTFontTable.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTFontTable.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTElementModel.h"
#import "MTThemePerformSelector.h"

@interface MTFontTable()

/**
 内容element对象列表
 */
@property (nonatomic, strong) NSMutableArray<MTElementModel *> *textElements;

@end

@implementation MTFontTable
#pragma mark - Lifecycle


#pragma mark - Custom Accessors
- (NSMutableArray<MTElementModel *> *)textElements {
    if (!_textElements) {
        _textElements = [[NSMutableArray alloc] init];
    }
    return _textElements;
}

#pragma mark - IBActions


#pragma mark - Public
- (void)addElementModel:(MTElementModel *)elementModel {
    if (elementModel == nil) {
        return;
    }
    
    switch (elementModel.type) {
        case MTElementModelTypeText:
            [self.textElements addObject:elementModel];
            break;
            
        default:
            break;
    }
}

- (void)checkElementModels {
    [self executeElementWithElementModels:self.textElements handler:nil];
}

- (void)refreshElementModelTextWithTextDict:(NSDictionary<NSString *,NSString *> *)textDict {
//    [UIView animateKeyframesWithDuration:MTTheme_animatedDuration delay:0 options:MTTheme_UIViewKeyframeAnimationOption animations:^{
        [self executeElementWithElementModels:self.textElements handler:^(MTElementModel *element) {
            NSString *textValue = textDict[element.identifier];
            if (textValue == nil) {
                return;
            }
            
            [MTThemePerformSelector performSelector:element.selector view:element.view object:textValue extendObj:element.extendObj];
        }];
//    } completion:nil];
}

#pragma mark - Private

#pragma mark - Protocol conformance

@end
