//
//  PZWBaseViewController.m
//  PZWBlog
//
//  Created by Zhuangwei PENG on 2017/10/2.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "PZWBaseViewController.h"
#import "Addition.h"

@interface PZWBaseViewController ()
@property (nonatomic, strong) UINavigationBar *statuebar;
@end

@implementation PZWBaseViewController
- (UINavigationBar *)statuebar{
    if (!_statuebar) {
        _statuebar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen screenWidth], 20)];
    }
    return _statuebar;
}

- (UINavigationBar *)navBar{
    if (!_navBar) {
        _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, [UIScreen screenWidth], 44)];
    }
    return _navBar;
}

- (UINavigationItem *)navItem{
    if (!_navItem) {
        _navItem = [[UINavigationItem alloc] init];
    }
    return _navItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    // Do any additional setup after loading the view.
}

- (void)setTitle:(NSString *)title{
    [super setTitle:title];
    
    self.navItem.title = title;
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor randomColor];
    
    [self.view addSubview:self.statuebar];
    [self.view addSubview:self.navBar];
    self.navBar.barTintColor = [UIColor colorWithHex:0xF6f6f6];
    self.statuebar.barTintColor = [UIColor colorWithHex:0xF6f6f6];
    
    self.navBar.items = @[self.navItem];
//    self.navItem.title = self.tabBarItem.title;
    
}


@end
