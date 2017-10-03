//
//  NSError+CustomError.h
//  LeaveApplication
//
//  Created by Anshad M K on 27/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (CustomError)

+ (NSError *)errorWithMessage:(NSString *)message;

@end
