//
//  SignUpViewController.m
//  LeaveApplication
//
//  Created by Anshad M K on 26/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "SignUpViewController.h"
#import "SignUpView.h"

@interface SignUpViewController ()

@property (nonatomic, strong) SignUpView *signUpView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SignUpViewController

- (void)loadView{
    [super loadView];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.signUpView];
    [self.imageView autoPinEdgesToSuperviewEdges];
    [self.signUpView autoCenterInSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getters
     
 - (SignUpView *)signUpView{
     
     if(!_signUpView){
         _signUpView = [SignUpView newAutoLayoutView];
     }return _signUpView;
 }

- (UIImageView *)imageView{
    
    if(!_imageView){
        
        UIImage *image = [UIImage imageNamed:@"Login_BackGround"];
        _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }return _imageView;
}

#pragma mark - Button events

- (void)cancelButtonClick:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signUpButtonClick:(id)sender{
    
    MDUser *user = [MDUser new];
    user.firstName = self.signUpView.firstNameField.text;
    user.lastName = self.signUpView.lastNameField.text;
    user.userName = self.signUpView.userNameField.text;
    user.password = self.signUpView.passwordField.text;
    user.designation = self.signUpView.designationField.text;
    NSError *error = nil;
    [self.interactor saveUser:user error:&error];
    if(error){
        
        NSLog(@"%@",error.localizedDescription);
    }else{
        [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"Thank you %@ %@",user.firstName,user.lastName]];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
