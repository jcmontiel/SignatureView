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
- (void) didNotSignInSignatureViewController:(SignatureViewController *)viewController;
@end


@interface SignatureViewController : UIViewController
@property (strong, nonatomic) IBOutlet SignatureView *view;
@property (strong, nonatomic) IBOutlet UITextField *signatureTextField;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (strong, nonatomic) IBOutlet UIButton *signButton;
@property (weak, nonatomic) IBOutlet id<SignatureViewControllerDelegate> delegate;
- (IBAction)signatureClearTapped:(id)sender;
- (IBAction)signatureSignTapped:(id)sender;
- (void)checkSign;

@end
