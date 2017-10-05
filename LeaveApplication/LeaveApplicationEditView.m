//
//  LeaveApplicationEditView.m
//  LeaveApplication
//
//  Created by Anshad M K on 03/10/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "LeaveApplicationEditView.h"

@interface LeaveApplicationEditView ()

@property (nonatomic, assign) BOOL didLayoutConstraints;
@end

@implementation LeaveApplicationEditView

#pragma mark - Getters

- (UITextField *)dateField{
    if(!_dateField){
        
        _dateField = [UITextField newAutoLayoutView];
        [_dateField autoSetDimension:ALDimensionHeight toSize:32];
        _dateField.layer.cornerRadius = 3;
    }return _dateField;
}

- (UITextView *)reasonView{
    
    if(!_reasonView){
        
        _reasonView = [UITextView newAutoLayoutView];
        [_reasonView autoSetDimension:ALDimensionHeight toSize:150];
        _reasonView.layer.cornerRadius = 3.0f;
    }return _reasonView;
}

+ (BOOL)requiresConstraintBasedLayout{

    return YES;
}

- (void)updateConstraints{
    if(!self.didLayoutConstraints){
        
        [self addSubviews];
        
    }
}

- (void)addSubviews{
    
    [self addSubview:self.dateField];
    [self addSubview:self.reasonView];
    
}
@end
