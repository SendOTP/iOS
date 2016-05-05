SendOTP iOS Usage Documentation

Download SendOTPFramework.framework
Import SendOTPFramework.framework in your project.

Go to the project target  -> General -> Embeded Binaries then add the SendOTPFramework in it.



Go to your class which is going to call the SendOTP 

Import the following ->

#import <SendOTPFramework/SendOTP.h>

#import <SendOTPFramework/AuthenticationViewController.h>

Accept the following delegates -  <SendOTPAuthenticationViewControllerDelegate>


Add the Secret key of sendOTP as shown.
[SendOTP sharedManager].secretKey = @"Your own genrated secret key";
(You can genrate App id from :-  http://sendotp.msg91.com/)

Then call the AuthenticationViewController using following code.

NSString *frameworkDirPath = [[NSBundle mainBundle] privateFrameworksPath];

NSString *frameworkBundlePath = [frameworkDirPath stringByAppendingPathComponent:@"SendOTPFramework.framework"];

NSBundle *frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];

AuthenticationViewController *authenticationViewController = [[AuthenticationViewController alloc]initWithNibName:@"AuthenticationViewController" bundle:frameworkBundle];
authenticationViewController.delegate = self;


//set nav bar color

authenticationViewController.navBarColor = [UIColor redColor];


// set company logo

authenticationViewController.companyImage = [UIImage imageNamed:@"MyCompanyLogo"];

[self presentViewController:authenticationViewController animated:YES completion:nil];


Implement following delegate methods-

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


