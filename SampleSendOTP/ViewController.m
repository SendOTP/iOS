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
    //Set app id
    [SendOTP sharedManager].sendOTPApiId = @"m8CAcVwaPcrxMDy2hl7zo42z6H0FdofX5oWZBqV1FPcCEgsK6o75AEqOsIJLKSUlo0GMhA6np5JNaka4jVYip7ilvN7WvvQ4u2qz3ZzK_s34h-aCOF1zDDv8CAzbOgUS0AF_0T-OKgaJWBbbDMx10g==";
    NSString *frameworkDirPath = [[NSBundle mainBundle] privateFrameworksPath];
    NSString *frameworkBundlePath = [frameworkDirPath stringByAppendingPathComponent:@"SendOTPFramework.framework"];
    NSBundle *frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    AuthenticationViewController *authenticationViewController = [[AuthenticationViewController alloc]initWithNibName:@"AuthenticationViewController" bundle:frameworkBundle];
    authenticationViewController.delegate = self;
    //set nav bar color
    authenticationViewController.navBarColor = [UIColor colorWithRed:30/255.0f green:118/255.0f blue:186/255.0f alpha:1];
    // set company logo
    authenticationViewController.companyImage = [UIImage imageNamed:@"MyCompanyLogo"];
    [self presentViewController:authenticationViewController animated:YES completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark SendOTPAuthenticationViewControllerDelegate
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

- (IBAction)callSendOTPButtonAction:(id)sender {
    [self callSendOTP];

}
@end
