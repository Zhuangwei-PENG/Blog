//
//  UIScreen+Addition.m
//  PZWBlog
//
//  Created by Zhuangwei PENG on 2017/10/5.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "UIScreen+Addition.h"

@implementation UIScreen (Addition)

+ (CGFloat)screenWidth{
    return [self mainScreen].bounds.size.width;
}

+ (CGFloat)screenHight{
    return [self mainScreen].bounds.size.height;
}

+ (CGFloat)screenScale{
    return [self mainScreen].scale;
}

@end
