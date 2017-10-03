//
//  MDUsers.h
//  LeaveApplication
//
//  Created by Anshad M K on 25/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "MDBaseModel.h"
#import "MDUser.h"

@interface MDUsers : MDBaseModel

@property (nonatomic, assign) NSInteger maxId;
@property (nonatomic, strong) NSArray<MDUser> *items;

@end
