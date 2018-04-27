//
//  MTElementModel.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTElementModel.h"

@implementation MTElementModel
#pragma mark - Lifecycle
- (void)dealloc {
//    MTTheme_Log(@"%s", __func__);
}

- (instancetype)initWithSelector:(SEL)selector
                      identifier:(NSString *)identifier
                       extendObj:(id)extendObj
                            view:(UIView *)view
                            type:(MTElementModelType)type {
    self = [super init];
    if (self) {
        self.selector = selector;
        self.identifier = identifier;
        self.extendObj = extendObj;
        self.view = view;
        self.type = type;
    }
    return self;
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance

@end
