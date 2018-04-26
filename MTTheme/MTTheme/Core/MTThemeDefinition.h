//
//  MTThemeDefinition.h
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#ifndef MTThemeDefinition_h
#define MTThemeDefinition_h

//ElementModel的类型
typedef NS_ENUM(NSUInteger, MTElementModelType) {
    MTElementModelTypeText,  //内容
    MTElementModelTypeFont,      //字体, 后续拓展
    MTElementModelTypeColor,     //颜色
    MTElementModelTypeImage      //图片
};

/**定义颜色的宏*/
#define MTTheme_UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//动画时间
#define MTTheme_animatedDuration 0.2

//动画类型
#define MTTheme_UIViewKeyframeAnimationOption UIViewKeyframeAnimationOptionCalculationModeLinear

//定时清空ElementModel的时间
#define MTTheme_clean_time 10

//debug模式
#ifdef DEBUG
#define MTTheme_Log(...) NSLog(__VA_ARGS__);

#else
#define MTTheme_Log(...)

#endif

#endif /* MTThemeDefinition_h */
