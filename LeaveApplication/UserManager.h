//
//  UserManager.h
//  LeaveApplication
//
//  Created by Anshad M K on 27/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserManagerContext.h"

@interface UserManager : NSObject<UserManagerContext>

+ (instancetype)defaultManager;

@end
