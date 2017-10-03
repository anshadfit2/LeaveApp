//
//  UserManager.m
//  LeaveApplication
//
//  Created by Anshad M K on 27/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "UserManager.h"

@interface UserManager ()

@property (nonatomic, strong) MDUsers *users;
@property (nonatomic, strong) NSURL *fileUrl;
@property (nonatomic, strong) MDUser *currentUser;

@end

@implementation UserManager

+ (instancetype)defaultManager{
    
    static UserManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedManager = [self new];
    });return sharedManager;
}


- (MDUsers *)users{
    
    if(!_users){
        
        _users = [MDUsers new];
        _users = [self allUsers];
        
    }return _users;
}

- (MDUser *)currentUser{
    if(!_currentUser){
        
        _currentUser = [MDUser new];
    }return _currentUser;
}

- (NSURL *)fileUrl{
    
    if(!_fileUrl){
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,
                                                             YES);
        NSString *fullPath = [[paths lastObject] stringByAppendingPathComponent:@"Users"];
        
        if(![[NSFileManager defaultManager] fileExistsAtPath:fullPath]){
            
            [[NSFileManager defaultManager] createFileAtPath:fullPath contents:nil attributes:nil];
            
        }
        _fileUrl = [NSURL URLWithString:fullPath];
    }return _fileUrl;
}

#pragma mark - user Manager

- (MDUsers *)allUsers{
    
    MDUsers *allUsers = [MDUsers new];
    NSData *jsonData = [NSData dataWithContentsOfFile:[self.fileUrl path]];
    if(jsonData){
        NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:jsonData
                                                                             options:NSJSONReadingMutableContainers
                                                                                   error:nil];
        allUsers = [[MDUsers alloc] initWithDictionary:dict error:nil];
    }
    return allUsers;
}

- (BOOL)saveUser:(MDUser *)user error:(NSError *__autoreleasing *)error{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userName == [cd]%@",user.userName];
    id obj = [self.users.items findFirstByPredicate:predicate];
    if(obj){
        
        *error = [NSError errorWithMessage:@"UserName Name already Exists"];
        return NO;
    }else{
        
        NSMutableArray *userItems = [self.users.items mutableCopy];
        [userItems addObject:user];
        [self.users setItems:userItems.copy];
        NSDictionary *jsonDict = [self.users toDictionary];
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:error];
        [jsonData writeToFile:[self.fileUrl path] atomically:YES];
        return YES;
    }
}

- (MDUser *)authenticateUser:(MDUser *)user error:(NSError **)error{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userName == [cd]%@",user.userName];
    id obj = [self.users.items findFirstByPredicate:predicate];
    if(obj){
        
        self.currentUser = (MDUser *)obj;
    }else{
        self.currentUser = nil;
        *error = [NSError errorWithMessage:@"Invalid User"];
    }
    return (MDUser *)obj;
}

- (MDUser *)currentLoginUser{
    
    return self.currentUser;
}
@end
