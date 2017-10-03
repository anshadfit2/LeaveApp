//
//  BaseInteractor.h
//  LeaveApplication
//
//  Created by Anshad M K on 26/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"
#import "UserManager.h"

@interface BaseInteractor : NSObject

@property (nonatomic, strong) DataManager *dataManager;
@property (nonatomic, strong) UserManager *userManager;


@end
