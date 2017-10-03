//
//  LoginViewInteractor.m
//  LeaveApplication
//
//  Created by Anshad M K on 25/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "LoginViewInteractor.h"
#import "MDUsers.h"

@interface LoginViewInteractor ()

@property (nonatomic, strong) MDUsers *users;

@end

@implementation LoginViewInteractor

- (MDUser *)currentUser{
    
    if(!_currentUser){
        
        _currentUser  = [MDUser new];
    }return _currentUser;
}


- (BOOL)authenticateUser:(MDUser *)user error:(NSError **)error{
    
    MDUser *validUser =  [self.userManager authenticateUser:user error:error];
    if(validUser){
        
        self.currentUser = validUser;
        return YES;
    }
    return NO;
}

- (BOOL)saveUser:(MDUser *)user error:(NSError *__autoreleasing *)error{
    
    BOOL isSaved = [self.userManager saveUser:user error:error];
    return isSaved;
}
@end
