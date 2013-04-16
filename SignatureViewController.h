//
//  SignatureViewController.h
//
//  Created by John Montiel on 5/11/12.
//

#import <UIKit/UIKit.h>
#import "SignatureView.h"

@class SignatureViewController;

@protocol SignatureViewControllerDelegate <NSObject>
- (void) signatureViewController:(SignatureViewController *)viewController didSign:(NSData *)signature;
@end


@interface SignatureViewController : UIViewController

@property (weak, nonatomic) id<SignatureViewControllerDelegate> delegate;

-(void)checkSign;

@end
