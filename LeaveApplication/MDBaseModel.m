//
//  MDBaseModel.m
//  LeaveApplication
//
//  Created by Anshad M K on 22/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "MDBaseModel.h"

@implementation MDBaseModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    
    return YES;
}

+ (JSONKeyMapper *)keyMapper{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:[self.class mappingDictionary]];
}

+ (NSDictionary *)mappingDictionary{
    static NSDictionary *mapping = nil;
    static dispatch_once_t once_Token;
    dispatch_once(&once_Token, ^{
        mapping = [NSDictionary dictionaryWithObjectsAndKeys:@"LastUpdated",@"lastUpdated",nil];
        });return mapping;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError **)error{
    
    self = [super initWithDictionary:dict error:error];
    return self;
}

- (NSDictionary *)toDictionary {
    
   return [self toDictionaryWithKeys:[[self.class mappingDictionary] allKeys]];
}


@end
