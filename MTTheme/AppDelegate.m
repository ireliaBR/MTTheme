//
//  AppDelegate.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "AppDelegate.h"
#import "MTTheme.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //主题模块初始化
    CFAbsoluteTime themeStartTime = CFAbsoluteTimeGetCurrent();
    NSString *path = [NSBundle mainBundle].bundlePath;
    NSString *themePath = [path stringByAppendingPathComponent:@"Theme/Theme2"];
    [MTThemeManager initializeWithDefaultThemePath:themePath];
    CFAbsoluteTime themeEndTime = CFAbsoluteTimeGetCurrent();
    MTTheme_Log(@"[During]主题注册事件 during in %f seconds.", (themeStartTime - themeEndTime));
    
    //字体模块初始化
    CFAbsoluteTime fontStartTime = CFAbsoluteTimeGetCurrent();
    NSString *fontPath = [path stringByAppendingPathComponent:@"Font/Font2"];
    [MTFontManager initializeWithDefaultFontPath:fontPath];
    CFAbsoluteTime fontEndTime = CFAbsoluteTimeGetCurrent();
    MTTheme_Log(@"[During]字体注册事件 during in %f seconds.", (fontStartTime - fontEndTime));
    
    return YES;
}

@end
