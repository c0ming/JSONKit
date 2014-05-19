//
//  JSONKit.m
//
//  Created by c0ming on 14-5-15.
//  Copyright (c) 2014年 c0ming. All rights reserved.
//

#import "JSONKit.h"

#pragma mark - Foundation objects to JSON

static NSString *const NSJSONKitErrorDomain = @"me.c0ming.JSONKit";

@implementation NSObject (JSONKit)

- (NSString *)JSONString {
    // If that option is not set, the most compact possible JSON will be generated.
    // or NSJSONWritingPrettyPrinted option will generate JSON with whitespace designed to make the output more readable
    return [self JSONStringWithOptions:0 error:NULL];
}

- (NSString *)JSONStringWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error {
    NSString *JSONString = nil;
    NSData *JSONData = [self JSONDataWithOptions:opt error:error];
    if (JSONData != nil) {
        JSONString = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    }

    return JSONString;
}

- (NSData *)JSONData {
    return [self JSONDataWithOptions:0 error:NULL];
}

- (NSData *)JSONDataWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error {
    NSData *JSONData = nil;

    // If obj will not produce valid JSON, an exception is thrown.
    // This exception is thrown prior to parsing and represents a programming error, not an internal error.
    if ([NSJSONSerialization isValidJSONObject:self]) {
        JSONData = [NSJSONSerialization dataWithJSONObject:self options:opt error:error];
    } else {
        if (error) {
            *error = [NSError errorWithDomain:NSJSONKitErrorDomain
                                         code:-1
                                     userInfo:@{ NSLocalizedFailureReasonErrorKey:@"This is not a valid JSONObject" }];
        }
    }

    return JSONData;
}

@end

#pragma mark - JSON to Foundation objects

@implementation NSString (JSONKit)

- (id)objectFromJSONString {
    return [self objectFromJSONStringWithOptions:0 error:NULL];
}

- (id)mutableObjectFromJSONString {
    return [self objectFromJSONStringWithOptions:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:NULL];
}

- (id)objectFromJSONStringWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data objectFromJSONDataWithOptions:opt error:error];
}

@end

@implementation NSData (JSONKit)

- (id)objectFromJSONData {
    return [self objectFromJSONDataWithOptions:0 error:NULL];
}

- (id)mutableObjectFromJSONData {
    return [self objectFromJSONDataWithOptions:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:NULL];
}

- (id)objectFromJSONDataWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error {
    return [NSJSONSerialization JSONObjectWithData:self options:opt error:error];
}

@end
