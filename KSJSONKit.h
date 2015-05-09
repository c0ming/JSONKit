//
//  KSJSONKit.h
//
//  Created by c0ming on 14-5-15.
//  Copyright (c) 2014年 c0ming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KSJSONKit)

- (NSString *)ks_JSONString;
- (NSString *)ks_JSONStringWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error;
- (NSData *)ks_JSONData;
- (NSData *)ks_JSONDataWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error;

@end

@interface NSString (KSJSONKit)

- (id)ks_objectFromJSONString;
- (id)ks_mutableObjectFromJSONString;
- (id)ks_objectFromJSONStringWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error;

@end

@interface NSData (KSJSONKit)

- (id)ks_objectFromJSONData;
- (id)ks_mutableObjectFromJSONData;
- (id)ks_objectFromJSONDataWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error;

@end
