//
//  BaseInteractor.m
//  LeaveApplication
//
//  Created by Anshad M K on 26/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "BaseInteractor.h"

@implementation BaseInteractor

- (instancetype)init{
    
    self = [super init];
    if(self){
        self.dataManager = [DataManager defaultManager];
        self.userManager = [UserManager defaultManager];
    }
    return self;
}

@end
