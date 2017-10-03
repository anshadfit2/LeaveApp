//
//  EmployeeLeaveEntries.m
//  LeaveApplication
//
//  Created by Anshad M K on 28/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "EmployeeLeaveInfo.h"

@implementation EmployeeLeaveInfo

+ (NSDictionary *)mappingDictionary{
    
    static NSDictionary *mapping;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableDictionary *map = [[super mappingDictionary] mutableCopy];
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"UserName",@"userName",@"UserId",@"userId",
                                                                        @"LeaveEntries",@"leaveEntries",nil];
        [map addEntriesFromDictionary:dict];
        mapping = map.copy;
    });return mapping;
}


- (NSArray<EmployeeLeaveEntry> *)leaveEntries{
    if(!_leaveEntries){
        
        _leaveEntries = [NSArray<EmployeeLeaveEntry> new];
    }return _leaveEntries;
}

@end
