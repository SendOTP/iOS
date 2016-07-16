//
//  ViewController.m
//  SampleSendOTP
//
//  Created by Hussain Chhatriwala on 14/01/16.
//  Copyright © 2016 Walkover. All rights reserved.
//

#import "ViewController.h"
#import <SendOTPFramework/SendOTP.h>
#import <SendOTPFramework/AuthenticationViewController.h>
@interface ViewController ()<SendOTPAuthenticationViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIView *callSendOTPAction;
- (IBAction)callSendOTPButtonAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
}

-(void)callSendOTP{
    //Set your secrect key here
    [SendOTP sharedManager].secretKey = @"Your own genrated secret key";
    NSString *frameworkDirPath = [[NSBundle mainBundle] privateFrameworksPath];
    NSString *frameworkBundlePath = [frameworkDirPath stringByAppendingPathComponent:@"SendOTPFramework.framework"];
    NSBundle *frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    AuthenticationViewController *authenticationViewController = [[AuthenticationViewController alloc]initWithNibName:@"AuthenticationViewController" bundle:frameworkBundle];
    authenticationViewController.delegate = self;
    //set nav bar color
    authenticationViewController.navBarColor = [UIColor colorWithRed:30/255.0f green:118/255.0f blue:186/255.0f alpha:1];
    // set navbar title color
   authenticationViewController.navBarTitleColor = [UIColor whiteColor];
    // set company logo
    authenticationViewController.companyImage = [UIImage imageNamed:@"MyCompanyLogo"];
    [self presentViewController:authenticationViewController animated:YES completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark SendOTPAuthenticationViewControllerDelegate

// Called when authentication is successfull.
-(void)authenticationisSuccessfulForMobileNumber:(NSString *)mobNo withCountryCode:(NSString *)countryCode{
    NSLog(@"Success");
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Success!!" message:@"Number verified sucessfully." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

// Called when authentication is Failed.

-(void)authenticationisFailedForMobileNumber:(NSString *)mobNo withCountryCode:(NSString *)countryCode{
    NSLog(@"Failed");
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Failure!!" message:@"Number verification Failed." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

// Called when authentication is Cancelled.

-(void)canceledAuthentication{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Failure!!" message:@"Authentication canceled" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

//Call Send OTP
- (IBAction)callSendOTPButtonAction:(id)sender {
    [self callSendOTP];

}
@end
