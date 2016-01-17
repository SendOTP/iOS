//
//  ServiceManager.h
//  SendOTPFramework
//
//  Created by Hussain Chhatriwala on 04/01/16.
//  Copyright © 2016 Walkover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ServiceManager : NSObject

+(instancetype) sharedManager;

- (void) startWithApiId:(NSString*)apiId ;
-(void) stopManager;

-(void) showMessageInViewController:(UIViewController *)viewController;

-(BOOL) isManagerRunning;

@end
