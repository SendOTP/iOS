//
//  ViewController.m
//  SendOtpTest
//
//  Created by Hussain Chhatriwala on 04/01/16.
//  Copyright © 2016 Walkover. All rights reserved.
//

#import "ViewController.h"
#import <SendOTPFramework/AuthenticationViewController.h>
@interface ViewController ()<SendOTPAuthenticationViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)callSendOtp:(id)sender {
    NSString *frameworkDirPath = [[NSBundle mainBundle] privateFrameworksPath];
    NSString *frameworkBundlePath = [frameworkDirPath stringByAppendingPathComponent:@"SendOTPFramework.framework"];
    NSBundle *frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    AuthenticationViewController *authenticationViewController = [[AuthenticationViewController alloc]initWithNibName:@"AuthenticationViewController" bundle:frameworkBundle];
    
    // Mandatory auth key......
    authenticationViewController.authkey = @"xxxxxxxxxxxxxx";
    
    authenticationViewController.navBarColor = [UIColor blueColor];
    
    authenticationViewController.navBarColor = [UIColor colorWithRed:30/255.0f green:118/255.0f blue:186/255.0f alpha:1];
    
    // set navbar title color
    authenticationViewController.navBarTitleColor = [UIColor whiteColor];
    
    // set company logo
    authenticationViewController.companyImage = [UIImage imageNamed:@"defaultLogo"];
    
    // set custom message here with ##OTP##
    authenticationViewController.customMessage = @"Your verification code is ##OTP##.";
    
    // set the sender id here
    authenticationViewController.senderId = @"OTPSMS";
    
    // set access type here
    authenticationViewController.accessTypeShouldBeHTTP = false; // sets https by default
    [self presentViewController:authenticationViewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)authenticationisSuccessfulForMobileNumber:(NSString *)mobNo withCountryCode:(NSString *)countryCode{
    NSLog(@"Success");
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Success!!" message:@"Number verified sucessfully." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
-(void)authenticationisFailedForMobileNumber:(NSString *)mobNo withCountryCode:(NSString *)countryCode{
    NSLog(@"Failed");
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Failure!!" message:@"Number verification Failed." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)canceledAuthentication{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Failure!!" message:@"Authentication canceled" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end

