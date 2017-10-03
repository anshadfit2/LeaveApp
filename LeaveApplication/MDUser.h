//
//  MDUser.h
//  LeaveApplication
//
//  Created by Anshad M K on 22/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "MDCollectionModelItem.h"
@protocol MDUser <NSObject>
@end

@interface MDUser :MDCollectionModelItem

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *designation;

@end
