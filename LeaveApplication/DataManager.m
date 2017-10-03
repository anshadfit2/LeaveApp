//
//  DataManager.m
//  LeaveApplication
//
//  Created by Anshad M K on 25/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "DataManager.h"
#import "MDUsers.h"

@interface DataManager ()

@property (nonatomic, strong) NSArray *allEmployeeLeaveEntries;
@property (nonatomic, strong) NSURL *fileUrl;

@end

@implementation DataManager

+ (instancetype)defaultManager{
    
    static DataManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedManager = [self new];
    });return sharedManager;
}

- (NSURL *)fileUrl{
    if(!_fileUrl){
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                            NSUserDomainMask,
                                                            YES);
        NSString *fullPath = [[paths lastObject] stringByAppendingPathComponent:@"LeaveEntries"];
        
        if(![[NSFileManager defaultManager] fileExistsAtPath:fullPath]){
            
            [[NSFileManager defaultManager] createFileAtPath:fullPath contents:nil
                                                  attributes:nil];
        }
        _fileUrl = [NSURL URLWithString:fullPath];
    }return _fileUrl;
}

- (NSArray *)allEmployeeLeaveEntries{
    if(!_allEmployeeLeaveEntries){
        _allEmployeeLeaveEntries = [NSArray new];
        NSData *jsonData = [NSData dataWithContentsOfFile:[self.fileUrl path]];
        
        if(jsonData){
            NSError *error;
            NSArray *jsonAllEmployeesLeaveEntries = (NSArray *)[NSJSONSerialization JSONObjectWithData:jsonData
                                                                                               options:NSJSONReadingMutableContainers
                                                                                                 error:nil];
            _allEmployeeLeaveEntries = [JSONModel arrayOfModelsFromDictionaries:jsonAllEmployeesLeaveEntries error:nil];
        }
    }
    return _allEmployeeLeaveEntries;
}

- (EmployeeLeaveInfo *)leaveEntriesForEmployee:(MDUser *)employee{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userName == [cd] %@",employee.userName];
    EmployeeLeaveInfo *employeeLeaveInfo = [self.allEmployeeLeaveEntries findFirstByPredicate:predicate];
    return employeeLeaveInfo;
}

@end
