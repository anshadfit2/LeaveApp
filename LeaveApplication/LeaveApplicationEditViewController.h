//
//  LeaveApplicationEditViewController.h
//  LeaveApplication
//
//  Created by Anshad M K on 03/10/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "GeneralViewController.h"
#import "LeaveEntriesDisplayInteractor.h"

@interface LeaveApplicationEditViewController : GeneralViewController

@property (nonatomic, strong) LeaveEntriesDisplayInteractor *interactor;

@end
