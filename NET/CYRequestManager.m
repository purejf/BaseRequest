//
//  CYRequestManager.m
//  NET
//
//  Created by Charles on 2017/3/14.
//  Copyright © 2017年 Charles. All rights reserved.
//

#import "CYRequestManager.h"
#import "AFNetworking.h"

@interface AFHTTPSessionManager (Shared)

+ (instancetype)sharedManager;

@end

@implementation AFHTTPSessionManager (Shared)

+ (instancetype)sharedManager {
    static AFHTTPSessionManager *_singleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [AFHTTPSessionManager manager];
        _singleton.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return _singleton;
}

@end

@implementation CYRequestManager

+ (void)requestWithURLString:(NSString *)URLString
                      params:(NSDictionary *)params
                  methodType:(CYRequestMethodType)methodType
              serializerType:(CYResponseSeializerType)serializerType
               successHandle:(CYRequestManagerSuccessHandle)successHandle
               failureHandle:(CYRequestManagerFailureHandle)failureHandle {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    manager.responseSerializer = [self responseSearalizerWithSerilizerType:serializerType];
    
    switch (methodType) {
        case CYRequestMethodTypeGET: [manager GET:URLString parameters:params progress:nil success:successHandle failure:failureHandle]; break;
        case CYRequestMethodTypePOST: [manager POST:URLString parameters:params progress:nil success:successHandle failure:failureHandle]; break;
        case CYRequestMethodTypePUT: [manager PUT:URLString parameters:params success:successHandle failure:failureHandle]; break;
        case CYRequestMethodTypePATCH: [manager PATCH:URLString parameters:params success:successHandle failure:failureHandle]; break;
        case CYRequestMethodTypeDELETE: [manager DELETE:URLString parameters:params success:successHandle failure:failureHandle]; break;
        case CYRequestMethodTypeHEAD: [manager HEAD:URLString parameters:params success:^(NSURLSessionDataTask * _Nonnull task) {
            !successHandle ?: successHandle(task, nil);
        } failure:failureHandle]; break;
    }
    
}

+ (void)POSTWithURLString:(NSString *)URLString
                   params:(NSDictionary *)params
           serializerType:(CYResponseSeializerType)serializerType
         constructingBody:(void (^)(id<AFMultipartFormData> formData))constructingBody
            successHandle:(CYRequestManagerSuccessHandle)successHandle
            failureHandle:(CYRequestManagerFailureHandle)failureHandle {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    manager.responseSerializer = [self responseSearalizerWithSerilizerType:serializerType];
    
    [manager POST:URLString parameters:params constructingBodyWithBlock:constructingBody progress:nil success:successHandle failure:failureHandle];
}

+ (AFHTTPResponseSerializer *)responseSearalizerWithSerilizerType:(CYResponseSeializerType)serilizerType {
    switch (serilizerType) {
        case CYResponseSeializerTypeDefault: return [AFJSONResponseSerializer serializer]; break;
        case CYResponseSeializerTypeJSON: return [AFJSONResponseSerializer serializer]; break;
        case CYResponseSeializerTypeXML: return [AFXMLParserResponseSerializer serializer]; break;
        case CYResponseSeializerTypePlist: return [AFPropertyListResponseSerializer serializer]; break;
        case CYResponseSeializerTypeCompound: return [AFCompoundResponseSerializer serializer]; break;
        case CYResponseSeializerTypeImage: return [AFImageResponseSerializer serializer]; break;
        case CYResponseSeializerTypeData: return [AFHTTPResponseSerializer serializer]; break;
        default: return [AFJSONResponseSerializer serializer]; break;
    }
}

@end
