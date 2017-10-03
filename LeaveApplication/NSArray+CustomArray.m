//
//  NSArray+CustomArray.m
//  LeaveApplication
//
//  Created by Anshad M K on 27/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "NSArray+CustomArray.h"

@implementation NSArray (CustomArray)

- (id)findFirstByPredicate:(NSPredicate *)predicate{
    if(!predicate) return nil;
    
    for(id obj in self){
        
        if([predicate evaluateWithObject:obj]) return obj;
    }
    return nil;
}

@end
