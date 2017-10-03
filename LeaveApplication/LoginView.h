//
//  LoginView.h
//  LeaveApplication
//
//  Created by Anshad M K on 26/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property (nonatomic, strong) UITextField *userNameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *confirmTextField;

@property (nonatomic, strong) UIButton *signInButton;
@property (nonatomic, strong) UIButton *signUpButton;

- (void)clearLoginview;

@end
