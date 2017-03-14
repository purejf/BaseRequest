//
//  CYBaseRequest.m
//  NET
//
//  Created by Charles on 2017/3/14.
//  Copyright © 2017年 Charles. All rights reserved.
//

#import "CYBaseRequest.h"
#import "YYModel.h"
#import "CYRequestManager.h"

@implementation CYBaseRequest

- (void)sendRequestWithCompletionHandle:(CYBaseRequestCompletionHandle)completionHandle {
    if (!_url || !_url.length) return;
    [CYRequestManager requestWithURLString:_url
                                    params:[self params]
                                methodType:self.methodType
                            serializerType:CYResponseSeializerTypeJSON
                             successHandle:^(NSURLSessionTask *task, id response) {
                                 !completionHandle ?: completionHandle(YES, response, nil);
                             } failureHandle:^(NSURLSessionTask *task, NSError *error) {
                                 !completionHandle ?: completionHandle(NO, nil, error.description);
                             }];
}

- (NSDictionary *)params {
    NSDictionary *json = self.yy_modelToJSONObject;
    if ([json isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *params = [(NSDictionary *)json mutableCopy];
        [params addEntriesFromDictionary:self.extraParams];
        for (NSString *delKey in @[@"url", @"methodType, extraParams"]) {
            if ([params.allKeys containsObject:delKey]) {
                [params removeObjectForKey:delKey];
            }
        }
        for (id key in params.allKeys) {
            id obj = [params objectForKey:key];
            if (!obj || [obj isKindOfClass:[NSNull class]] || obj == (id)kCFNull) {
                [params removeObjectForKey:key];
            }
        }
        return params;
    }
    return self.extraParams;
}

@end
