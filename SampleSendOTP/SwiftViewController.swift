//
//  SwiftViewController.swift
//  SendOTPFramework
//
//  Created by Hussain on 12/07/16.
//  Copyright © 2016 Walkover. All rights reserved.
//

import UIKit
import SendOTPFramework
class SwiftViewController: UIViewController,SendOTPAuthenticationViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func openSendOtp(sender: AnyObject) {
        SendOTP.sharedManager().secretKey  = "HussainTest";
        //Get SendOTP framework bundle
        let frameworkBundle = NSBundle(identifier: "com.walkover.SendOTPFramework")
        let authViewControler :AuthenticationViewController = AuthenticationViewController.init(nibName: "AuthenticationViewController", bundle: frameworkBundle)
        authViewControler.delegate = self
        //set nav bar color
        authViewControler.navBarColor = UIColor.blueColor()
        //Set nav bar title color
        authViewControler.navBarTitleColor = UIColor.whiteColor()
        // set company logo
        authViewControler.companyImage = UIImage(named: "MyCompanyLogo")
        self.presentViewController(authViewControler, animated: true, completion: nil)
    
    }
    
    func authenticationisSuccessfulForMobileNumber(mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Success")
        let alert = UIAlertView()
        alert.title = "Success"
        alert.message = "Authentication is Successful."
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
    
    func authenticationisFailedForMobileNumber(mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Failure")
        let alert = UIAlertView()
        alert.title = "Failure"
        alert.message = "Authentication is Failed."
        alert.addButtonWithTitle("Ok")
        alert.show()
        
    }
    
    func canceledAuthentication() {
        print("Failure")
        let alert = UIAlertView()
        alert.title = "Failure"
        alert.message = "Authentication is Canceled."
        alert.addButtonWithTitle("Ok")
        alert.show()
        
    }
    
}
