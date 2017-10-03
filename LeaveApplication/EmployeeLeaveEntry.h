//
//  EmployeeLeaveEntry.h
//  LeaveApplication
//
//  Created by Anshad M K on 28/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "MDBaseModel.h"
#import "MDCollectionModelItem.h"

@protocol EmployeeLeaveEntry <NSObject>
@end

@interface EmployeeLeaveEntry :MDCollectionModelItem

@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSString *date;

@end
