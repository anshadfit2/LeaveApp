//
//  MDUsers.m
//  LeaveApplication
//
//  Created by Anshad M K on 25/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "MDUsers.h"

@implementation MDUsers

+ (NSDictionary *)mappingDictionary{
    static NSDictionary *mapping;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        mapping = [NSDictionary dictionaryWithObjectsAndKeys:@"MaxId",@"maxId",@"Items",@"items",nil];
    });return mapping;
}


- (void)MaxIdWithString:(NSString *)string{
    
    _maxId = string.length?string.integerValue:0;
    
}

- (NSArray<MDUser> *)items{
    
    if(!_items){
        _items = [NSArray<MDUser> new];
    }return _items;
}

@end
