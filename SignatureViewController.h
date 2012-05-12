//
//  SignatureViewController.h
//  SupportingFamilySuccess
//
//  Created by John Montiel on 5/11/12.
//  Copyright (c) 2012 Em Sevn, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignatureView.h"

@class SignatureViewController;

@protocol SignatureViewControllerDelegate <NSObject>
- (void) signatureViewController:(SignatureViewController *)viewController didSign:(NSData *)signature;
@end


@interface SignatureViewController : UIViewController

@property (assign, nonatomic) id<SignatureViewControllerDelegate> delegate;

@end
