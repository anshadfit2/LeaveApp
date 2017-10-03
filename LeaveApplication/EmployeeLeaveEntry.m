//
//  EmployeeLeaveEntry.m
//  LeaveApplication
//
//  Created by Anshad M K on 28/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "EmployeeLeaveEntry.h"

@implementation EmployeeLeaveEntry

+ (NSDictionary *)mappingDictionary{
    
    static NSDictionary *mapping;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSMutableDictionary *map = [[super mappingDictionary] mutableCopy];
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"Reason",@"reason",@"Date",@"date",nil];
        [map addEntriesFromDictionary:dict];
        mapping = map.copy;
    });return mapping;
}

@end
