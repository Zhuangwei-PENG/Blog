//
//  PZWHomeController.m
//  PZWBlog
//
//  Created by Zhuangwei PENG on 2017/10/2.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "PZWHomeController.h"
#import "DemoViewController.h"

@interface PZWHomeController ()

@end

@implementation PZWHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"好友" style:UIBarButtonItemStylePlain target:self action:@selector(showFriends)];
}
- (void)setupUI{
    [super setupUI];
//    self.navItem.title = self.tabBarItem.title;
    
}
- (void)showFriends{
    DemoViewController *dvc = [[DemoViewController alloc] init];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
