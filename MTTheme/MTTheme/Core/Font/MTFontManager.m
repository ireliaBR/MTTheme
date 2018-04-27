//
//  MTFontManager.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/25.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTFontManager.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTFontTable.h"
#import "MTElementModel.h"

static MTFontManager *manager;

@interface MTFontManager()
/**
 模块的font字典
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, MTFontTable *> *moduleFontDict;

/**
 font路径
 */
@property (nonatomic, copy) NSString *currentFontPath;

/**
 解析的字典
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *fontDict;


/**
 定时器用于定时清空moduleFontDict中MTFontTable的elementModel
 */
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation MTFontManager
#pragma mark - Lifecycle
- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - Custom Accessors
- (NSMutableDictionary<NSString *,MTFontTable *> *)moduleFontDict {
    if (!_moduleFontDict) {
        _moduleFontDict = [[NSMutableDictionary alloc] init];
    }
    return _moduleFontDict;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:MTTheme_clean_time target:self selector:@selector(cleanModuleTable) userInfo:nil repeats:YES];
    }
    return _timer;
}

#pragma mark - IBActions


#pragma mark - Public
+ (MTFontManager *)manager {
    NSAssert(manager != nil, @"MTFontManager 未初始化");
    return manager;
}

+ (void)initializeWithDefaultFontPath:(NSString *)fontPath {
    NSAssert(manager == nil, @"MTFontManager 已经初始化");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [MTFontManager new];
    });
    
    [manager setFontPath:fontPath];
    
    [[NSRunLoop currentRunLoop] addTimer:manager.timer forMode:NSDefaultRunLoopMode];
}

- (void)setFontPath:(NSString *)fontPath {
    if ([fontPath isEqualToString:self.currentFontPath]) {
        return;
    }
    
    //判断font路径是否存在
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fontPath isDirectory:nil]) {
        NSLog(@"%@ 路径不存在", fontPath);
        return;
    }
    self.currentFontPath = fontPath;
    
    //解析模块
    NSArray<NSString *> *files = [fileManager contentsOfDirectoryAtPath:fontPath error:nil];
    NSMutableDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *fontDict = [[NSMutableDictionary alloc] init];
    
    for (NSString *file in files) {
        if (![file hasSuffix:@".plist"]) {
            continue;
        }
        
        NSString *fontPlistPath = [self.currentFontPath stringByAppendingPathComponent:file];
        if (![fileManager fileExistsAtPath:fontPlistPath]) {
            NSLog(@"%@ fontPlist路径不存在", fontPlistPath);
            return;
        }
        NSDictionary<NSString *, NSString *> *dict = [[NSDictionary alloc] initWithContentsOfFile:fontPlistPath];
        NSString *key = [file stringByDeletingPathExtension];
        fontDict[key] = dict;
    }
    
    self.fontDict = [fontDict copy];
    
//    MTTheme_Log(@"\nFont文件夹解析结果: ");
//    MTTheme_Log(@"%@", self.fontDict);
    
    //遍历moduleFontDict， 传入fontDict
    [self refreshModuleFontDict];
}

- (void)addView:(UIView *)view
     identifier:(NSString *)identifier
      extendObj:(nullable id)extendObj
       selector:(SEL)selector
           type:(MTElementModelType)type
     moduleName:(NSString *)moduleName {
    
    MTFontTable *table = self.moduleFontDict[moduleName];
    if (table == nil) {
        table = [MTFontTable new];
        self.moduleFontDict[moduleName] = table;
    }
    MTElementModel *model = [[MTElementModel alloc] initWithSelector:selector identifier:identifier extendObj:extendObj view:view type:type];
    [table addElementModel:model];
}

- (NSString *)getTextWithModuleName:(NSString *)moduleName
                        identifier:(NSString *)identifier {
    NSDictionary<NSString *, NSString *> *moduleFontDict = self.fontDict[moduleName];
    if (moduleFontDict == nil) {
        return nil;
    }
    
    NSString *text = moduleFontDict[identifier];
    return text;
}
#pragma mark - Private

/**
 遍历moduleFontDict， 传入fontDict
 */
- (void)refreshModuleFontDict {
    for (NSString *moduleName in self.moduleFontDict.allKeys) {
        NSDictionary<NSString *, NSString *> *fontDict = self.fontDict[moduleName];
        MTFontTable *fontTable = self.moduleFontDict[moduleName];
        
        [fontTable refreshElementModelTextWithTextDict:fontDict];
    }
}

/**
 清空ModuleTable中elementModel中view为nil的对象
 */
- (void)cleanModuleTable {
    for (MTFontTable *table in self.moduleFontDict.allValues) {
        [table checkElementModels];
    }
}
#pragma mark - Protocol conformance

@end
