//
//  PZWTabbarController.m
//  PZWBlog
//
//  Created by Zhuangwei PENG on 2017/10/2.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "PZWTabbarController.h"
#import "PZWNavigationController.h"
#import "Addition.h"

@interface PZWTabbarController ()

@property (nonatomic, strong) UIButton *composeButton;
@property (nonatomic, strong) NSArray *tabBarIcons;

@end

@implementation PZWTabbarController
- (UIButton *)composeButton{
    if (!_composeButton) {
        _composeButton = [[UIButton alloc] init];
    }
    return _composeButton;
    
}

- (NSArray *)tabBarIcons{
    if (!_tabBarIcons) {
        _tabBarIcons = @[@{@"className": @"PZWHomeController", @"title": @"首页", @"imageName": @"tabbar_home"},
                         @{@"className": @"PZWDiscoverController", @"title": @"发现", @"imageName": @"tabbar_discover"},
                         @{@"className": @"UIViewController"},
                         @{@"className": @"PZWMessageController", @"title": @"消息", @"imageName": @"tabbar_message_center"},
                         @{@"className": @"PZWProfileController", @"title": @"我", @"imageName": @"tabbar_profile"}];
    }
    return _tabBarIcons;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupChildControllers];
    [self setupComposeButton];
    
}

//设置中间的按钮
- (void)setupComposeButton{
    UIImage *image = [UIImage imageNamed:@"tabbar_compose_icon_add"];
    UIImage *bgImage = [UIImage imageNamed:@"tabbar_compose_button"];
    
    [self.composeButton setImage:image forState:UIControlStateNormal];
    [self.composeButton setBackgroundImage:bgImage forState:UIControlStateNormal];
    [self.composeButton sizeToFit];
    
    [self.tabBar addSubview:self.composeButton];
    
    CGFloat w = [UIScreen screenWidth] / self.childViewControllers.count;
    self.composeButton.frame = CGRectInset(self.tabBar.bounds, w * 2, 0);
    
    [self.composeButton addTarget:self action:@selector(composeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
//    UIImage *selectedImage = [UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"];
//    UIImage *selectedBgImage = [UIImage imageNamed:@"tabbar_compose_button_highlighted"];
//    [self.composeButton setImage:selectedImage forState:UIControlStateHighlighted];
//    [self.composeButton setBackgroundImage:selectedBgImage forState:UIControlStateHighlighted];
}

- (void)composeButtonClick{
    NSLog(@"点击按钮");
}

- (void)setupChildControllers{
  
    NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:5];
    
    [self.tabBarIcons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [self controller:obj];
        [mArr addObject: vc];
//        [self addChildViewController:vc];
    }];
    self.viewControllers = mArr;
    
}

- (UIViewController *)controller: (NSDictionary *)dict{
    NSString *title = dict[@"title"];
    NSString *imageName = dict[@"imageName"];
    Class cls = NSClassFromString(dict[@"className"]);
    
    UIViewController *vc = [[UIViewController alloc] init];
    if (title && imageName && cls) {
        vc = [[cls alloc] init];
        
//        [vc.tabBarItem setTitle:title];
        //设置了ViewController的标题，就自动设置了tabBarItem的标题
        vc.title = title;
        [vc.tabBarItem setImage:[UIImage imageNamed:imageName]];
        [vc.tabBarItem setSelectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]]];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]} forState:UIControlStateSelected];
        
        [vc.navigationItem setTitle:title];
    }
    
    PZWNavigationController *nav = [[PZWNavigationController alloc] initWithRootViewController:vc];
    
    return nav;
    
    
//    NSString *namespace = [NSBundle mainBundle].infoDictionary[@"CFBundleName"];
    
//    NSLog(@"%@",[NSClassFromString(@"PZWHomeController") class]);
    

}

@end
