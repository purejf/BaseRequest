//
//  CYUserInfoRequest.m
//  NET
//
//  Created by Charles on 2017/3/14.
//  Copyright © 2017年 Charles. All rights reserved.
//

#import "CYUserInfoRequest.h"

@implementation CYUserInfoRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.url = @"www.baidu.com"; // 请求需要的链接
    }
    return self;
}

@end
