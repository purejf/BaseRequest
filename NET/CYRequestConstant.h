//
//  CYRequestConstant.h
//  NET
//
//  Created by Charles on 2017/3/14.
//  Copyright © 2017年 Charles. All rights reserved.
//

#ifndef CYRequestConstant_h
#define CYRequestConstant_h


#import <Foundation/Foundation.h>

// 数据解析类型
typedef enum : NSUInteger {
    
    // 默认类型 JSON  如果使用这个响应解析器类型,那么请求返回的数据将会是JSON格式
    CYResponseSeializerTypeDefault,
    
    // JSON类型 如果使用这个响应解析器类型,那么请求返回的数据将会是JSON格式
    CYResponseSeializerTypeJSON,
    
    // XML类型 如果使用这个响应解析器类型,那么请求返回的数据将会是XML格式
    CYResponseSeializerTypeXML,
    
    // Plist类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Plist格式
    CYResponseSeializerTypePlist,
    
    // Compound类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Compound格式
    CYResponseSeializerTypeCompound,
    
    // Image类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Image格式
    CYResponseSeializerTypeImage,
    
    // Data类型 如果使用这个响应解析器类型,那么请求返回的数据将会是二进制格式
    CYResponseSeializerTypeData
    
}  CYResponseSeializerType;

// 请求方式
typedef enum : NSUInteger {
    
    // GET请求
    CYRequestMethodTypeGET,
    
    // POST请求
    CYRequestMethodTypePOST,
    
    // PUT请求
    CYRequestMethodTypePUT,
    
    // DELETE请求
    CYRequestMethodTypeDELETE,
    
    // PATCH请求
    CYRequestMethodTypePATCH,
    
    // HEAD请求
    CYRequestMethodTypeHEAD
    
} CYRequestMethodType;


#endif /* CYRequestConstant_h */
