//
//  ViewController.m
//  NET
//
//  Created by Charles on 2017/3/14.
//  Copyright © 2017年 Charles. All rights reserved.
//

#import "ViewController.h"
#import "CYBaseRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 创建请求
    CYBaseRequest *request = [CYBaseRequest new];
    request.url = @"www.baidu.com";
    
    // 2. 发送请求
    [request sendRequestWithCompletionHandle:^(BOOL success, id response, NSString *message) {
        
    }];
}


@end
