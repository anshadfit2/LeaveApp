//
//  UserManagerContext.h
//  LeaveApplication
//
//  Created by Anshad M K on 27/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//
#import "MDUsers.h"

@protocol UserManagerContext <NSObject>

@required

- (MDUsers *)allUsers;

- (BOOL)saveUser:(MDUser *)user error:(NSError **)error;

- (MDUser *)authenticateUser:(MDUser *)user error:(NSError **)error;

- (MDUser *)currentLoginUser;

@end
