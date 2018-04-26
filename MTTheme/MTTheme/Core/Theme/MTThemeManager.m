//
//  MTThemeManager.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTThemeManager.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTThemeTable.h"
#import "MTElementModel.h"

#define kColorPlistFileName @"color.plist"

static MTThemeManager *manager;

@interface MTThemeManager()
/**
 模块的主题字典
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, MTThemeTable *> *moduleTableDict;

/**
 主题路径
 */
@property (nonatomic, copy) NSString *currentThemePath;
@property (nonatomic, strong) NSDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *colorDict;
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> *imageDict;


/**
 定时器用于定时清空moduleFontDict中MTFontTable的elementModel
 */
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation MTThemeManager
#pragma mark - Lifecycle
- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - Custom Accessors
- (NSMutableDictionary<NSString *,MTThemeTable *> *)moduleTableDict {
    if (!_moduleTableDict) {
        _moduleTableDict = [[NSMutableDictionary alloc] init];
    }
    return _moduleTableDict;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:MTTheme_clean_time target:self selector:@selector(cleanModuleTable) userInfo:nil repeats:YES];
    }
    return _timer;
}

#pragma mark - IBActions


#pragma mark - Public
+ (MTThemeManager *)manager {
    NSAssert(manager != nil, @"MTThemeManager 未初始化");
    return manager;
}

+ (void)initializeWithDefaultThemePath:(NSString *)themePath {
    NSAssert(manager == nil, @"MTThemeManager 已经初始化");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [MTThemeManager new];
    });

    [manager setThemePath:themePath];
    
    [[NSRunLoop currentRunLoop] addTimer:manager.timer forMode:NSDefaultRunLoopMode];
}



- (void)setThemePath:(NSString *)themePath {
    
    if ([themePath isEqualToString:self.currentThemePath]) {
        return;
    }
    
    //判断theme路径是否存在
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:themePath isDirectory:nil]) {
        NSLog(@"%@ 路径不存在", themePath);
        return;
    }
    self.currentThemePath = themePath;
    
    //解析模块
    NSArray<NSString *> *directories = [fileManager contentsOfDirectoryAtPath:themePath error:nil];
    NSMutableDictionary<NSString *, NSArray<NSString *> *> *imageDict = [[NSMutableDictionary alloc] init];
    NSMutableDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *colorDict = [[NSMutableDictionary alloc] init];
    
    for (NSString *directory in directories) {
        [self parseModuleTheme:colorDict directory:directory fileManager:fileManager imageDict:imageDict themePath:themePath];
    }
    self.colorDict = [colorDict copy];
    self.imageDict = [imageDict copy];
    
//    MTTheme_Log(@"\nTheme文件夹解析结果: ");
//    MTTheme_Log(@"%@", self.colorDict);
//    MTTheme_Log(@"%@", self.imageDict);
    
    //遍历moduleTableDict， 传入imageDict 和 colorDict
    [self refreshModuleTableDict];
}

- (void)addView:(UIView *)view
     identifier:(NSString *)identifier
      extendObj:(nullable id)extendObj
       selector:(SEL)selector
           type:(MTElementModelType)type
     moduleName:(NSString *)moduleName {
    MTThemeTable *table = self.moduleTableDict[moduleName];
    if (table == nil) {
        table = [MTThemeTable new];
        self.moduleTableDict[moduleName] = table;
    }
    MTElementModel *model = [[MTElementModel alloc] initWithSelector:selector identifier:identifier extendObj:extendObj view:view type:type];
    [table addElementModel:model];
}

- (UIColor *)getColorWithModuleName:(NSString *)moduleName
                         identifier:(NSString *)identifier {
    NSDictionary<NSString *, NSString *> *moduleColorDict = self.colorDict[moduleName];
    if (moduleColorDict == nil) {
        return nil;
    }

    NSString *colorStr = moduleColorDict[identifier];
    if (colorStr == nil) {
        return nil;
    }
    int color;
    sscanf(colorStr.UTF8String, "%i", &color);
    return MTTheme_UIColorFromRGB(color);
}

- (UIImage *)getImageWithModuleName:(NSString *)moduleName
                         identifier:(NSString *)identifier {
    NSArray<NSString *> *imageFiles = self.imageDict[moduleName];
    if (imageFiles == nil) {
        return nil;
    }
    
    NSString *imagePath = [moduleName stringByAppendingPathComponent:identifier];
    UIImage *image = [UIImage imageNamed:imagePath inBundle:[NSBundle bundleWithPath:self.currentThemePath] compatibleWithTraitCollection:nil];
    return image;
}

#pragma mark - Private

/**
 解析模块主题，颜色和图片

 @param colorDict colorDict
 @param directory 模块名
 @param fileManager fileManager
 @param imageDict imageDict
 @param themePath themePath
 */
- (void)parseModuleTheme:(NSMutableDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *)colorDict directory:(NSString *)directory fileManager:(NSFileManager *)fileManager imageDict:(NSMutableDictionary<NSString *,NSArray<NSString *> *> *)imageDict themePath:(NSString * _Nonnull)themePath {
    
    NSString *imagePath = [self.currentThemePath stringByAppendingPathComponent:directory];
    NSArray<NSString *> *files = [fileManager contentsOfDirectoryAtPath:imagePath error:nil];
    NSMutableArray<NSString *> *fileFilters = [[NSMutableArray alloc] initWithCapacity:files.count/2];
    
    for (NSString *file in files) {
        if ([file isEqualToString:kColorPlistFileName]) {
            //解析color.plist
            NSString *colorPlistPath = [themePath stringByAppendingPathComponent:directory];
            colorPlistPath = [colorPlistPath stringByAppendingPathComponent:kColorPlistFileName];
            if (![fileManager fileExistsAtPath:colorPlistPath]) {
                NSLog(@"%@ colorPlist路径不存在", colorPlistPath);
                return;
            }
            NSDictionary<NSString *, NSString *> *dict = [[NSDictionary alloc] initWithContentsOfFile:colorPlistPath];
            colorDict[directory] = dict;
            continue;
        }
        
        //解析图片
        NSRange range = [file rangeOfString:@"(?<=^).*?(?=@)" options:NSRegularExpressionSearch];
        if (range.location == NSNotFound) {
            continue;
        }
        NSString *fileStr = [file substringWithRange:range];
        if ([fileFilters containsObject:fileStr]) {
            continue;
        }
        [fileFilters addObject:fileStr];
    }
    imageDict[directory] = [fileFilters copy];
}

/**
 通过imageDict，colorDict刷新moduleTableDict
 */
- (void)refreshModuleTableDict {
    for (NSString *moduleName in self.moduleTableDict.allKeys) {
        NSDictionary<NSString *, NSString *> *colorDict = self.colorDict[moduleName];
        NSArray<NSString *> *imageFiles = self.imageDict[moduleName];
        MTThemeTable *themeTable = self.moduleTableDict[moduleName];

        [themeTable refreshElementModelColorWithColorDict:colorDict];
        [themeTable refreshElementModelImageWithImageStrs:imageFiles bundlePath:self.currentThemePath moduleName:moduleName];
    }
}

/**
 清空ModuleTable中elementModel中view为nil的对象
 */
- (void)cleanModuleTable {
    for (MTThemeTable *table in self.moduleTableDict.allValues) {
        [table checkElementModels];
    }
}

#pragma mark - Protocol conformance

@end
