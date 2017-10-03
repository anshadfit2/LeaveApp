//
//  LeaveItemCell.h
//  LeaveApplication
//
//  Created by Anshad M K on 03/10/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeLeaveEntry.h"

@interface LeaveItemCell : UITableViewCell

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *reasonLabel;
@property (nonatomic, strong) EmployeeLeaveEntry *viewModel;

- (void)reloadData;

@end
