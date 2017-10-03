//
//  ViewController.m
//  LeaveApplication
//
//  Created by Anshad M K on 22/09/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewInteractor.h"
#import "SignUpViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) LoginViewInteractor *interactor;

@end

@implementation LoginViewController

- (LoginView *)loginView{
    
    if(!_loginView){
        
        _loginView = [LoginView newAutoLayoutView];
    }return _loginView;
    
}

- (LoginViewInteractor *)interactor{
    
    if(!_interactor){
        
        _interactor = [LoginViewInteractor new];
    }return _interactor;
}

- (UIImageView *)imageView{
    
    if(!_imageView){
        
        UIImage *image = [UIImage imageNamed:@"Login_BackGround"];
        _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }return _imageView;
    
}

- (void)loadView{
    [super loadView];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.loginView];
    [self.imageView autoPinEdgesToSuperviewEdges];
    [self.loginView autoCenterInSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



#pragma mark - Button Events.

- (void)signUpButtonClick:(id)sender{
    
    SignUpViewController *controller  = [SignUpViewController new];
    controller.interactor = self.interactor;
    controller.view.backgroundColor = [UIColor whiteColor];
//    controller.preferredContentSize = CGSizeMake(300, 300);
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:controller];
    
    nc.modalPresentationStyle = UIModalPresentationFormSheet;
    
    [self presentViewController:nc animated:YES completion:nil];
    
}

- (void)signInButtonClick:(id)sender{
    
    MDUser *user = [MDUser new];
    user.userName = self.loginView.userNameField.text;
    user.password = self.loginView.passwordField.text;
    NSError *error;
    if([self.interactor authenticateUser:user error:&error]){
        SignUpViewController *controller = [SignUpViewController new];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:controller animated:YES];
    }else{
        
        if(error){
            [self.loginView clearLoginview];
            [self showAlertWithTitle:@"Warning" message:@"Invalid Username or password"];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
