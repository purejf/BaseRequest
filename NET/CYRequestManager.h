//
//  CYRequestManager.h
//  NET
//
//  Created by Charles on 2017/3/14.
//  Copyright © 2017年 Charles. All rights reserved.
//

#import "AFNetworking.h"
#import "CYRequestConstant.h"

// 请求成功回调
typedef void(^CYRequestManagerSuccessHandle)(NSURLSessionTask *task, id response);

// 请求失败回调
typedef void(^CYRequestManagerFailureHandle)(NSURLSessionTask *task, NSError *error);

@interface CYRequestManager : NSObject

/**
 request By NSURLSession
 
 @param URLString 请求链接
 @param params 请求参数
 @param methodType 请求方式
 @param serializerType 数据解析类型
 @param successHandle 请求成功回调
 @param failureHandle 请求失败回调
 */
+ (void)requestWithURLString:(NSString *)URLString
                      params:(NSDictionary *)params
                  methodType:(CYRequestMethodType)methodType
              serializerType:(CYResponseSeializerType)serializerType
               successHandle:(CYRequestManagerSuccessHandle)successHandle
               failureHandle:(CYRequestManagerFailureHandle)failureHandle;

/**
 a multipart `POST` request By NSURLSession
 
 @param URLString 请求链接
 @param params 请求参数
 @param serializerType 数据解析类型
 @param constructingBody 添加请求体
 @param successHandle 请求成功回调
 @param failureHandle 请求失败回调
 */
+ (void)POSTWithURLString:(NSString *)URLString
                   params:(NSDictionary *)params
            serializerType:(CYResponseSeializerType)serializerType
         constructingBody:(void (^)(id<AFMultipartFormData> formData))constructingBody
            successHandle:(CYRequestManagerSuccessHandle)successHandle
            failureHandle:(CYRequestManagerFailureHandle)failureHandle;

@end
