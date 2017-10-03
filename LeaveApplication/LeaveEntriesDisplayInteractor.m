//
//  LeaveEntriesDisplayInteractor.m
//  LeaveApplication
//
//  Created by Anshad M K on 03/10/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "LeaveEntriesDisplayInteractor.h"

@interface LeaveEntriesDisplayInteractor ()


@end

@implementation LeaveEntriesDisplayInteractor

#pragma mark - Getters

- (MDUser *)currentUser{
    
    if(!_currentUser){
        
        _currentUser = [self.userManager currentLoginUser];
    }return _currentUser;
}

- (NSArray *)employeeLeaveEntries{
    
    if(!_employeeLeaveEntries){
        
        EmployeeLeaveInfo *leaveInfo = [self.dataManager leaveEntriesForEmployee:self.currentUser];
        _employeeLeaveEntries = leaveInfo.leaveEntries;
    }return _employeeLeaveEntries;
}


@end
