//
//  AuthenticationViewController.h
//  SendOTPFramework
//
//  Created by Hussain Chhatriwala on 05/01/16.
//  Copyright © 2016 Walkover. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SendOTPAuthenticationViewControllerDelegate
-(void)canceledAuthentication;
-(void)authenticationisSuccessfulForMobileNumber:(NSString*)mobNo withCountryCode:(NSString*)countryCode;
-(void)authenticationisFailedForMobileNumber:(NSString*)mobNo withCountryCode:(NSString*)countryCode;
@end
@interface AuthenticationViewController : UIViewController
@property (strong, nonatomic) UIColor *navBarColor;
@property (weak, nonatomic) IBOutlet UIImageView *imgCompany;
@property (strong, nonatomic) UIImage *companyImage;
@property (weak, nonatomic) IBOutlet UIButton *countryCodeBtn;
@property (strong, nonatomic) id <SendOTPAuthenticationViewControllerDelegate> delegate;
@end
