//
//  NSError+CustomError.m
//  LeaveApplication
//
//  Created by Anshad M K on 27/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "NSError+CustomError.h"

@implementation NSError (CustomError)

+ (NSError *)errorWithMessage:(NSString *)message{
    
    return [NSError errorWithDomain:@"com.leaveApplication.ios"
                               code:0
                           userInfo:
            @{NSLocalizedDescriptionKey:message}];
    
}


@end
