//
//  LoginView.m
//  LeaveApplication
//
//  Created by Anshad M K on 26/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()

@property (nonatomic, assign) BOOL didLayoutConstraints;

@end

@implementation LoginView


#pragma mark - Getters


- (UITextField *)userNameField{
    if(!_userNameField){
        
        _userNameField = [self templateTextField];
        _userNameField.placeholder = @"Username";
    }return _userNameField;
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

- (UIButton *)signInButton{
    
    if(!_signInButton){
        
        _signInButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _signInButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_signInButton setTitle:@" SignIn " forState:UIControlStateNormal];
        _signInButton.titleLabel.textColor = [UIColor whiteColor];
        _signInButton.backgroundColor = [UIColor greenColor];
        _signInButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        _signInButton.layer.cornerRadius = 3;
        [_signInButton autoSetDimension:ALDimensionHeight toSize:25];
        [_signInButton autoSetDimension:ALDimensionWidth toSize:50];
        [_signInButton addTarget:nil action:@selector(signInButtonClick:)
                forControlEvents:UIControlEventTouchUpInside];
        
    }return _signInButton;
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
        NSDictionary *views = @{@"user":self.userNameField,
                                @"pass":self.passwordField,
                                @"confirm":self.confirmTextField,
                                @"signIn":self.signInButton,
                                @"signUp":self.signUpButton
                                };
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[user]-5-[pass]-5-[confirm]-10-[signIn]-10-|"
                                                options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[user]-20-|"
                                                                     options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[pass]-20-|"
                                                                     options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[confirm]-20-|"
                                                                     options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[signIn]-20-[signUp]"
                                                                     options:0 metrics:nil views:views]];
        [self.signUpButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.signInButton];
        self.backgroundColor = [UIColor clearColor];
        self.didLayoutConstraints = YES;
    }[super updateConstraints];
}

- (void)addSubviews{
    
    [self addSubview:self.userNameField];
    [self addSubview:self.passwordField];
    [self addSubview:self.confirmTextField];
    [self addSubview:self.signInButton];
    [self addSubview:self.signUpButton];
    
}

- (void)clearLoginview{
    
    self.userNameField.text = @"";
    self.passwordField.text = @"";
}

@end
