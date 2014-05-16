//
//  JSONKit.h
//
//  Created by c0ming on 14-5-15.
//  Copyright (c) 2014年 c0ming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONKit)

- (NSString *)JSONString;
- (NSString *)JSONStringWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error;
- (NSData *)JSONData;
- (NSData *)JSONDataWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error;

@end

@interface NSString (JSONKit)

- (id)objectFromJSONString;
- (id)mutableObjectFromJSONString;
- (id)objectFromJSONStringWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error;

@end

@interface NSData (JSONKit)

- (id)objectFromJSONData;
- (id)mutableObjectFromJSONData;
- (id)objectFromJSONDataWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error;

@end
