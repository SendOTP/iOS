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
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openSendOtp(_ sender: AnyObject) {
        let frameworkBundle = Bundle(identifier: "com.walkover.SendOTPFramework")
        let authViewControler :AuthenticationViewController = AuthenticationViewController.init(nibName: "AuthenticationViewController", bundle: frameworkBundle)
        authViewControler.delegate = self
        authViewControler.navBarColor = UIColor.blue
        
        // set navbar title color
        authViewControler.navBarTitleColor = UIColor.white
        
        //Set your auth key here
        authViewControler.authkey = "xxxxxxxxxxxxxxxx"
        
        // set company logo
        authViewControler.companyImage = #imageLiteral(resourceName: "defaultLogo.png")
        
        // set custom message here with ##OTP##
        authViewControler.customMessage = "Your verification code is ##OTP##."
        
        // set the sender id here
        authViewControler.senderId = "OTPSMS"
        
        // set access type here
        authViewControler.accessTypeShouldBeHTTP = false // sets https by default
        
        self.present(authViewControler, animated: true, completion: nil)
    }
    
    func authenticationisSuccessful(forMobileNumber mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Success")
    }
    
    func authenticationisFailed(forMobileNumber mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Failure")
    }
    
    func canceledAuthentication() {
        print("Failure")
    }
    
}

