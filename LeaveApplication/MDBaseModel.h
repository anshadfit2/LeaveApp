//
//  MDBaseModel.h
//  LeaveApplication
//
//  Created by Anshad M K on 22/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSONModel.h"

@interface MDBaseModel : JSONModel

+ (JSONKeyMapper *)keyMapper;

+ (NSDictionary *)mappingDictionary;

- (NSDictionary *)toDictionary;
    

@end
