//
//  PZWTabbarController.m
//  PZWBlog
//
//  Created by Zhuangwei PENG on 2017/10/2.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "PZWTabbarController.h"
#import "PZWNavigationController.h"

@interface PZWTabbarController ()

@end

@implementation PZWTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self setupChildControllers];
    
}

- (void)setupChildControllers{
    NSArray *arr = @[@{@"className": @"PZWHomeController", @"title": @"首页", @"imageName": @"tabbar_home"},
                     @{@"className": @"PZWDiscoverController", @"title": @"发现", @"imageName": @"tabbar_discover"},
                     @{@"className": @"UIViewController"},
                     @{@"className": @"PZWMessageController", @"title": @"消息", @"imageName": @"tabbar_message_center"},
                     @{@"className": @"PZWProfileController", @"title": @"我", @"imageName": @"tabbar_profile"}];

    NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:5];
    
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [self controller:obj];
        [mArr addObject: vc];
        [self addChildViewController:vc];
    }];
    
}

- (UIViewController *)controller: (NSDictionary *)dict{
    if (!dict[@"title"] || !dict[@"imageName"]) {
        return [[UIViewController alloc] init];
    }
    
    NSString *title = dict[@"title"];
    NSString *imageName = dict[@"imageName"];
    Class cls = NSClassFromString(dict[@"className"]);
    
    UIViewController *vc = [[cls alloc] init];
    
    [vc.tabBarItem setTitle:title];
    [vc.tabBarItem setImage:[UIImage imageNamed:imageName]];
    [vc.tabBarItem setSelectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]]];
    
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]} forState:UIControlStateHighlighted];
    
    PZWNavigationController *nav = [[PZWNavigationController alloc] initWithRootViewController:vc];
    return nav;
    
    
//    NSString *namespace = [NSBundle mainBundle].infoDictionary[@"CFBundleName"];
    
//    NSLog(@"%@",[NSClassFromString(@"PZWHomeController") class]);
    

}

@end
