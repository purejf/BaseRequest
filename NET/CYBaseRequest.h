//
//  CYBaseRequest.h
//  NET
//
//  Created by Charles on 2017/3/14.
//  Copyright © 2017年 Charles. All rights reserved.
//

#import "CYRequestConstant.h"

typedef void(^CYBaseRequestCompletionHandle)(BOOL success, id response, NSString *message);

@interface CYBaseRequest : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) CYRequestMethodType methodType;

@property (nonatomic, strong) NSDictionary *extraParams;

- (void)sendRequestWithCompletionHandle:(CYBaseRequestCompletionHandle)completionHandle;

@end
