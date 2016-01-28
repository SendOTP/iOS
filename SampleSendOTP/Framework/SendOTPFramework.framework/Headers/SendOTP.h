//
//  SendOTP.h
//  SendOTPFramework
//
//  Created by Hussain Chhatriwala on 05/01/16.
//  Copyright © 2016 Walkover. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SendOTP : NSObject
@property (strong, nonatomic) NSString * secretKey;

+(instancetype) sharedManager;
- (void) startWithApiId:(NSString*)secretKey ;

@end
