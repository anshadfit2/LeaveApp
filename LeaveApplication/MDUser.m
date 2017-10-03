//
//  MDUser.m
//  LeaveApplication
//
//  Created by Anshad M K on 22/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "MDUser.h"

@implementation MDUser

+ (NSDictionary *)mappingDictionary{
    
    static NSDictionary *mapping = nil;
    static dispatch_once_t once_Token;
    
    dispatch_once(&once_Token, ^{
        NSMutableDictionary *dict = [[super mappingDictionary] mutableCopy];
        NSDictionary *map = [NSDictionary dictionaryWithObjectsAndKeys:@"FirstName",@"firstName",@"LastName",@"lastName",
                                                                    @"Designation",@"designation",@"UserName",@"userName",
                                                                    @"Password",@"password", nil];
        [dict addEntriesFromDictionary:map];
        mapping = dict;
    });return mapping;
}



@end
