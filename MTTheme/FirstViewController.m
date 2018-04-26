//
//  ViewController.m
//  MTTheme
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "FirstViewController.h"
#import "MTTheme.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *colorBtn;
@property (weak, nonatomic) IBOutlet UIView *bgColorView;
@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UIButton *bgImageBtn;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FirstViewController
#pragma mark - Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.text = @"jaksldfjkas哈哈";
    
    [self setupFont];
    [self setupTheme];
}

#pragma mark - Custom Accessors


#pragma mark - IBActions

- (IBAction)theme1BtnClick:(UIButton *)btn {
    [self themeBtnClick:btn];
}

- (IBAction)theme2BtnClick:(UIButton *)btn {
    [self themeBtnClick:btn];
}

- (IBAction)theme3BtnClick:(UIButton *)btn {
    [self themeBtnClick:btn];
}
- (IBAction)font1BtnClick:(UIButton *)btn {
    [self fontBtnClick:btn];
}
- (IBAction)font2BtnClick:(UIButton *)btn {
    [self fontBtnClick:btn];
}

#pragma mark - Public


#pragma mark - Private
- (void)themeBtnClick:(UIButton *)btn {
    NSString *path = [NSBundle mainBundle].bundlePath;
    path = [path stringByAppendingPathComponent:@"Theme"];
    path = [path stringByAppendingPathComponent:[btn titleForState:UIControlStateNormal]];
    [MTThemeManager.manager setThemePath:path];
}

- (void)fontBtnClick:(UIButton *)btn {
    NSString *path = [NSBundle mainBundle].bundlePath;
    path = [path stringByAppendingPathComponent:@"Font"];
    path = [path stringByAppendingPathComponent:[btn titleForState:UIControlStateNormal]];
    [MTFontManager.manager setFontPath:path];
}

- (void)setupFont {
    
    CFAbsoluteTime fontStartTime = CFAbsoluteTimeGetCurrent();
    [self.label theme_setTextIdentifier:@"FirstViewController.title.text" moduleName:@"homepage"];
    [self.colorBtn theme_setTitleIdentifier:@"FirstViewController.colorBtn.text.normal" forState:UIControlStateNormal moduleName:@"homepage"];
    [self.colorBtn theme_setTitleIdentifier:@"FirstViewController.colorBtn.text.highlighted" forState:UIControlStateHighlighted moduleName:@"homepage"];
    CFAbsoluteTime fontEndTime = CFAbsoluteTimeGetCurrent();
    MTTheme_Log(@"[During]字体设置事件 during in %f seconds.", (fontStartTime - fontEndTime));
}

- (void)setupTheme {
    [self.label theme_setBackgroundColorIdentifier:@"label.background"
                                        moduleName:@"homepage"];
    [self.label theme_setTextColorIdentifier:@"label.text"
                                  moduleName:@"homepage"];
    
    [self.colorBtn theme_setTitleColorIdentifier:@"colorBtn.title.normal"
                                        forState:UIControlStateNormal
                                      moduleName:@"homepage"];
    [self.colorBtn theme_setTitleColorIdentifier:@"colorBtn.title.highlighted"
                                        forState:UIControlStateHighlighted
                                      moduleName:@"homepage"];
    //    [self.colorBtn theme_setBackgroundColorIdentifier:@"colorBtn.background" moduleName:@"homepage"];
    
    [self.bgColorView theme_setBackgroundColorIdentifier:@"bgColorView.background"
                                              moduleName:@"homepage"];
    
    [self.imageBtn theme_setImageIdentifier:@"icon_homepage_image"
                                   forState:UIControlStateNormal
                                 moduleName:@"homepage"];
    
    [self.bgImageBtn theme_setBackgroundImageIdentifier:@"icon_homepage_image"
                                               forState:UIControlStateNormal
                                             moduleName:@"homepage"];
    
    [self.textField theme_setTextColorIdentifier:@"textField.textColor"
                                      moduleName:@"homepage"];
    
    [self.imageView theme_setImageIdentifier:@"icon_homepage_image"
                                  moduleName:@"homepage"];
}
#pragma mark - Protocol conformance



@end
