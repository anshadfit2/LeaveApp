//
//  SignUpView.m
//  LeaveApplication
//
//  Created by Anshad M K on 26/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "SignUpView.h"

@interface SignUpView ()

@property (nonatomic, assign) BOOL didLayoutConstraints;

@end

@implementation SignUpView

#pragma mark - Getters

- (UITextField *)userNameField{
    if(!_userNameField){
        
        _userNameField = [self templateTextField];
        _userNameField.placeholder = @"Username";
    }return _userNameField;
}

- (UITextField *)firstNameField{
    if(!_firstNameField){
        
        _firstNameField = [self templateTextField];
        _firstNameField.placeholder = @"First Name";
        [_firstNameField autoSetDimension:ALDimensionWidth toSize:95];
    }return _firstNameField;
}

- (UITextField *)lastNameField{
    if(!_lastNameField){
        
        _lastNameField = [self templateTextField];
        _lastNameField.placeholder = @"First Name";
        [_lastNameField autoSetDimension:ALDimensionWidth toSize:95];
    }return _lastNameField;
}

- (UITextField *)designationField{
    if(!_designationField){
        
        _designationField = [self templateTextField];
        _designationField.placeholder = @"Designation";
    }return _designationField;
}

- (UITextField *)passwordField{
    
    if(!_passwordField){
        
        _passwordField = [self templateTextField];
        _passwordField.secureTextEntry = YES;
        _passwordField.placeholder = @"Password";
    }return _passwordField;
}

- (UITextField *)confirmTextField{
    
    if(!_confirmTextField){
        
        _confirmTextField = [self templateTextField];
        _confirmTextField.secureTextEntry = YES;
        _confirmTextField.placeholder = @"Confirm Password";
        _confirmTextField.hidden = YES;
    }return _confirmTextField;
}

- (UITextField *)templateTextField{
    
    UITextField *textField = [UITextField newAutoLayoutView];
    textField.layer.cornerRadius = 3.0f;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [textField autoSetDimension:ALDimensionHeight toSize:32];
    [textField autoSetDimension:ALDimensionWidth toSize:200];
    textField.font = [UIFont systemFontOfSize:14];
    return textField;
}

- (UIButton *)cancelButton{
    
    if(!_cancelButton){
        
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_cancelButton setTitle:@"Cancel " forState:UIControlStateNormal];
        _cancelButton.titleLabel.textColor = [UIColor whiteColor];
        _cancelButton.backgroundColor = [UIColor greenColor];
        _cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        _cancelButton.layer.cornerRadius = 3;
        [_cancelButton autoSetDimension:ALDimensionHeight toSize:25];
        [_cancelButton autoSetDimension:ALDimensionWidth toSize:50];
        [_cancelButton addTarget:nil action:@selector(cancelButtonClick:)
                forControlEvents:UIControlEventTouchUpInside];
        
    }return _cancelButton;
}

- (UIButton *)signUpButton{
    
    if(!_signUpButton){
        
        _signUpButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _signUpButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_signUpButton setTitle:@" SignUp " forState:UIControlStateNormal];
        _signUpButton.titleLabel.textColor = [UIColor whiteColor];
        _signUpButton.backgroundColor = [UIColor greenColor];
        _signUpButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        _signUpButton.layer.cornerRadius = 3.0f;
        [_signUpButton autoSetDimension:ALDimensionHeight toSize:25];
        [_signUpButton autoSetDimension:ALDimensionWidth toSize:50];
        [_signUpButton addTarget:nil action:@selector(signUpButtonClick:)
                forControlEvents:UIControlEventTouchUpInside];
        
    }return _signUpButton;
    
}

#pragma mark - Constraints

+ (BOOL)requiresConstraintBasedLayout{
    
    return YES;
}

- (void)updateConstraints{
    
    if(!_didLayoutConstraints){
        [self addSubviews];
        NSDictionary *views = @{@"first":self.firstNameField,
                                @"last":self.lastNameField,
                                @"desig":self.designationField,
                                @"user":self.userNameField,
                                @"pass":self.passwordField,
                                @"confirm":self.confirmTextField,
                                @"cancel":self.cancelButton,
                                @"signUp":self.signUpButton
                                };
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[first]-5-[desig]-5-[user]-5-[pass]-5-[confirm]-10-[signUp]-10-|"
                                                                     options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[first]-10-[last]-20-|"
                                                                     options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[desig]-20-|"
                                                                     options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[user]-20-|"
                                                                     options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[pass]-20-|"
                                                                     options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[confirm]-20-|"
                                                                     options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[cancel]-20-[signUp]"
                                                                     options:0 metrics:nil views:views]];
        [self.signUpButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.cancelButton];
        [self.lastNameField autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.firstNameField];
        
        self.backgroundColor = [UIColor clearColor];
        self.didLayoutConstraints = YES;
    }[super updateConstraints];
}

- (void)addSubviews{
    [self addSubview:self.firstNameField];
    [self addSubview:self.lastNameField];
    [self addSubview:self.designationField];
    [self addSubview:self.userNameField];
    [self addSubview:self.passwordField];
    [self addSubview:self.confirmTextField];
    [self addSubview:self.cancelButton];
    [self addSubview:self.signUpButton];
    
}


@end
