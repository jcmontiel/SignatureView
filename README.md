README
======

This is a simple iOS signature view and controller to capture a PNG image from a finger drawn signature. It is based on Apple Inc's example code.

HOW TO USE IT
-------------

This repository has two branches; master and SampleProject. The master branch is intended to be used as a git submodule in your project and only contains the necessary components. The SampleProject branch is, simply put, a sample implementation and should not be used as a git submodule, but cloned as a standalone project.

You must add the OpenGLES.framework and QuartzCore.framework to the Xcode project.

EXAMPLE
-------

Here is an example of how to implement the SignatureViewController and it's signature view into your own viewControllers.

self.signature is a UIView reference to an IBOutlet (from xib), that is the placeholder for the signature view

self.signatureViewController will be instantiated in your viewDidLoad to control the signatureView, then the signatureViewController.view replaces the self.signature view and is put under control of your viewController.

	//
	- (void)viewDidLoad
	{
		[super viewDidLoad];
  
		self.signatureController = [[[SignatureViewController alloc] initWithNibName:@"SignatureView" bundle:nil] autorelease];
		self.signatureController.delegate = self;
  
		self.signatureController.view.frame = self.signatureView.frame;
		[self.view insertSubview:self.signatureController.view belowSubview:self.signatureView];
		[self.signatureView removeFromSuperview];
		self.signatureView = self.signatureController.view;
	}


	- (void) signatureViewController:(SignatureViewController *)viewController didSign:(NSData *)signature;
	{
		NSData *thisSignature = signature;
		// 
		// Do something with thisSignature, like save it to a file or a database as binary data.
		//
	}

LICENSE
-------

Copyright (C) 2012 by Em Sevn, LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
