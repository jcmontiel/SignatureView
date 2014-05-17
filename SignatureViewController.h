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
@property (strong, nonatomic) IBOutlet SignatureView *view;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *signButton;
@property (weak, nonatomic) IBOutlet id<SignatureViewControllerDelegate> delegate;

-(void)checkSign;

@end
