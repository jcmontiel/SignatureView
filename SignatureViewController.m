//
//  SignatureViewController.m
//
//  Created by John Montiel on 5/11/12.
//

#import "SignatureViewController.h"

@interface SignatureViewController ()
@property (strong, nonatomic) NSData *signature;

@end

@implementation SignatureViewController
@dynamic view;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beganSignature:) name:kBeganSignature object:self.view];
    [self signatureClearTapped:nil];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beganSignature:) name:kBeganSignature object:self.view];
    [self signatureClearTapped:nil];
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kBeganSignature object:self.view];
    [self setView:nil];
    [self setSignatureTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)signatureClearTapped:(id)sender 
{
    [self.view erase];
    
    [UIView animateWithDuration:0.6 animations:^
     {
         [self.signatureTextField setAlpha:1.0];
     }];
}

- (IBAction)signatureSignTapped:(id)sender 
{
    [self checkSign];
}

-(void)checkSign
{
    if ((self.signature = UIImagePNGRepresentation([self.view getSignatureImage]))) {
        
        [_delegate signatureViewController:self didSign:self.signature];
    }
    else {
        
        [_delegate didNotSignInSignatureViewController:self];
    }
}

- (void)beganSignature:(NSNotification *)notification
{
    if ([notification object] == self.view)
    {
        [UIView animateWithDuration:0.6 animations:^
         {
             [_signatureTextField setAlpha:0.2];
         }];
    }
}


@end
