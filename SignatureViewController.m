//
//  SignatureViewController.m
//
//  Created by John Montiel on 5/11/12.
//

#import "SignatureViewController.h"

@interface SignatureViewController ()
@property (strong, nonatomic) IBOutlet SignatureView *signatureView;
@property (strong, nonatomic) IBOutlet UITextField *signatureTextField;
@property (strong, nonatomic) NSData *signature;
- (IBAction)signatureClearTapped:(id)sender;
- (IBAction)signatureSignTapped:(id)sender;

@end

@implementation SignatureViewController
@synthesize delegate;
@synthesize signatureTextField;
@synthesize signatureView;
@synthesize signature;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        self.signatureView = [[SignatureView alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beganSignature:) name:kBeganSignature object:self.signatureView];
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kBeganSignature object:self.signatureView];
    [self setSignatureView:nil];
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
    [self.signatureView erase];
    
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
    if ((self.signature = UIImagePNGRepresentation([self.signatureView getSignatureImage])))
    {
        [self.delegate signatureViewController:self didSign:self.signature];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Signature" message:@"Please sign" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)beganSignature:(NSNotification *)notification
{
    [UIView animateWithDuration:0.6 animations:^
     {
         [self.signatureTextField setAlpha:0.2];
     }];
}


@end
