//
//  DataManagerContext.h
//  LeaveApplication
//
//  Created by Anshad M K on 26/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "MDUser.h"
#import "EmployeeLeaveInfo.h"

@protocol DataManagerContext <NSObject>

- (EmployeeLeaveInfo *)leaveEntriesForEmployee:(MDUser *)employee;

- (BOOL)saveLeaveEntry:(EmployeeLeaveInfo *)employeeLeaveInfo;

@required

@end
