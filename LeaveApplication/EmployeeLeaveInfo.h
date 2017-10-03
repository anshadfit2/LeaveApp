//
//  EmployeeLeaveEntries.h
//  LeaveApplication
//
//  Created by Anshad M K on 28/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "MDBaseModel.h"
#import "EmployeeLeaveEntry.h"

@interface EmployeeLeaveInfo : MDBaseModel

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSArray<EmployeeLeaveEntry> *leaveEntries;

@end
