//
//  DataManager.h
//  LeaveApplication
//
//  Created by Anshad M K on 25/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManagerContext.h"

@interface DataManager : NSObject<DataManagerContext>

+ (instancetype) defaultManager;

@end
