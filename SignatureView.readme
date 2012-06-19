// One example of how to implement the SignatureViewController and it's signature view into your own viewControllers
// 
// self.signature is a UIView reference to an IBOutlet (from xib), that is the placeholder for the signature view to be placed into
//
// self.signatureViewController will be instantiated in your viewDidLoad
//
//NOTE: You must add the OpenGLES.framework and QuartzCore.framework to the project

- (void)viewDidLoad
{
    [super viewDidLoad];

	// …
    
    self.signatureController = [[[SignatureViewController alloc] initWithNibName:@"SignatureView" bundle:nil] autorelease];
    self.signatureController.delegate = self;
    
    self.signatureController.view.frame = self.signatureView.frame;
    [self.view insertSubview:self.signatureController.view belowSubview:self.signatureView];
    [self.signatureView removeFromSuperview];
    self.signatureView = self.signatureController.view;
    
}

#pragma mark SignatureViewController delegate method

- (void) signatureViewController:(SignatureViewController *)viewController didSign:(NSData *)signature;
{
    NSData *thisSignature = signature;
    // 
    // Do something with thisSignature, like save it to a file or a database as binary data.
    //
}

