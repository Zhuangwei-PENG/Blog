//
//  PZWBaseViewController.h
//  PZWBlog
//
//  Created by Zhuangwei PENG on 2017/10/2.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PZWBaseViewController : UIViewController

@property (nonatomic, strong) UINavigationBar *navBar;
@property (nonatomic, strong) UINavigationItem *navItem;

- (void)setupUI;

@end
