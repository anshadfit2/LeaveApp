//
//  LoginViewInteractor.h
//  LeaveApplication
//
//  Created by Anshad M K on 25/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDUser.h"
#import "BaseInteractor.h"

@interface LoginViewInteractor : BaseInteractor

@property (nonatomic, strong) MDUser *currentUser;


- (BOOL)authenticateUser:(MDUser *)user error:(NSError **)error;

- (BOOL)saveUser:(MDUser *)user error:(NSError *__autoreleasing *)error;

@end
