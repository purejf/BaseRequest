//
//  ViewController.m
//  NET
//
//  Created by Charles on 2017/3/14.
//  Copyright © 2017年 Charles. All rights reserved.
//

#import "ViewController.h"
#import "CYBaseRequest.h"
#import "CYUserInfoRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 创建请求
    CYUserInfoRequest *userInfoR = [CYUserInfoRequest new];
    userInfoR.userId = 1;
    // 在.m中可以设置
    // userInfoR.url = @"www.baidu.com";
    // 可选
    // userInfoR.extraParams = @{
    //                              @"username" : @"xxx"
    //                              };
    
    // 2. 设置请求方式
    userInfoR.methodType = CYRequestMethodTypePOST;
    
    // 3. 发送请求
    [userInfoR sendRequestWithCompletionHandle:^(BOOL success, id response, NSString *message) {
        
    }];
    
}


@end
