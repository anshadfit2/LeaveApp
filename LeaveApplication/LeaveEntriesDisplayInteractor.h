//
//  LeaveEntriesDisplayInteractor.h
//  LeaveApplication
//
//  Created by Anshad M K on 03/10/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "BaseInteractor.h"

@interface LeaveEntriesDisplayInteractor : BaseInteractor

@property (nonatomic, strong) MDUser *currentUser;
@property (nonatomic, strong) NSArray *employeeLeaveEntries;

- (EmployeeLeaveInfo *)leaveEntriesForEmployee:(MDUser *)employee;

@end
