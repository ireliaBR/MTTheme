//
//  MTThemeTable.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTThemeTable.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTElementModel.h"
#import "MTThemePerformSelector.h"

@interface MTThemeTable()

/**
 颜色element对象列表
 */
@property (nonatomic, strong) NSMutableArray<MTElementModel *> *colorElements;
/**
 图片element对象列表
 */
@property (nonatomic, strong) NSMutableArray<MTElementModel *> *imageElements;

@end

@implementation MTThemeTable
#pragma mark - Lifecycle


#pragma mark - Custom Accessors
- (NSMutableArray<MTElementModel *> *)colorElements {
    if (!_colorElements) {
        _colorElements = [[NSMutableArray alloc] init];
    }
    return _colorElements;
}

- (NSMutableArray<MTElementModel *> *)imageElements {
    if (!_imageElements) {
        _imageElements = [[NSMutableArray alloc] init];
    }
    return _imageElements;
}

#pragma mark - IBActions


#pragma mark - Public
- (void)addElementModel:(MTElementModel *)elementModel {
    if (elementModel == nil) {
        return;
    }
    
    switch (elementModel.type) {
        case MTElementModelTypeColor:
            [self.colorElements addObject:elementModel];
            break;
        case MTElementModelTypeImage:
            [self.imageElements addObject:elementModel];
            break;
            
        default:
            break;
    }
}

- (void)checkElementModels {
    [self executeElementWithElementModels:self.colorElements handler:nil];
    [self executeElementWithElementModels:self.imageElements handler:nil];
}

- (void)refreshElementModelColorWithColorDict:(NSDictionary<NSString *,NSString *> *)colorDict {
//    [UIView animateKeyframesWithDuration:MTTheme_animatedDuration delay:0 options:MTTheme_UIViewKeyframeAnimationOption animations:^{
        [self executeElementWithElementModels:self.colorElements handler:^(MTElementModel *element) {
            NSString *colorValue = colorDict[element.identifier];
            if (colorValue == nil) {
                return;
            }
            int color;
            sscanf(colorValue.UTF8String, "%i", &color);
            
            [MTThemePerformSelector performSelector:element.selector view:element.view object:MTTheme_UIColorFromRGB(color) extendObj:element.extendObj];
        }];
//    } completion:nil];
}

- (void)refreshElementModelImageWithImageStrs:(NSArray<NSString *> *)imageStrs
                                   bundlePath:(NSString *)bundlePath
                                   moduleName:(NSString *)moduleName {
//    [UIView animateKeyframesWithDuration:MTTheme_animatedDuration delay:0 options:MTTheme_UIViewKeyframeAnimationOption animations:^{
        [self executeElementWithElementModels:self.imageElements handler:^(MTElementModel *element) {
            if (![imageStrs containsObject:element.identifier]) {
                return;
            }
            NSString *imagePath = [moduleName stringByAppendingPathComponent:element.identifier];
            UIImage *image = [UIImage imageNamed:imagePath inBundle:[NSBundle bundleWithPath:bundlePath] compatibleWithTraitCollection:nil];
            
            [MTThemePerformSelector performSelector:element.selector view:element.view object:image extendObj:element.extendObj];
        }];
//    } completion:nil];
}

#pragma mark - Private

#pragma mark - Protocol conformance

@end
