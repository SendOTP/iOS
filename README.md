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


        // set navbar title color
        authenticationViewController.navBarTitleColor = [UIColor blackColor];

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


In Case if you face any problem while submitting the app to store:-
You need to add a run script in your project:-
APP_PATH="${TARGET_BUILD_DIR}/${WRAPPER_NAME}"

# This script loops through the frameworks embedded in the application and
# removes unused architectures.
find "$APP_PATH" -name '*.framework' -type d | while read -r FRAMEWORK
do
    FRAMEWORK_EXECUTABLE_NAME=$(defaults read "$FRAMEWORK/Info.plist" CFBundleExecutable)
    FRAMEWORK_EXECUTABLE_PATH="$FRAMEWORK/$FRAMEWORK_EXECUTABLE_NAME"
    echo "Executable is $FRAMEWORK_EXECUTABLE_PATH"

    EXTRACTED_ARCHS=()

    for ARCH in $ARCHS
    do
        echo "Extracting $ARCH from $FRAMEWORK_EXECUTABLE_NAME"
        lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
        EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
    done

    echo "Merging extracted architectures: ${ARCHS}"
    lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
    rm "${EXTRACTED_ARCHS[@]}"

    echo "Replacing original executable with thinned version"
    rm "$FRAMEWORK_EXECUTABLE_PATH"
    mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"

done
Note:- Go in the build phase section of your project and Click on the Plus button and then select new run script and then paste the above script.
This will remove the unwanted architecture from Dynamic Libraries.

