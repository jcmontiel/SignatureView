README
======

This is a simple iOS signature view and controller to capture a PNG image from a finger drawn signature. It is based on Apple Inc's example code.

HOW TO USE IT
-------------

You must add the OpenGLES.framework and QuartzCore.framework to the Xcode project. Implement this repository as git sub module to your iOS project.

Look at https://github.com/jcmontiel/SignatureViewExample.git for an example of how to implement.

EXAMPLE
-------

Here is an example of how to implement the SignatureViewController and it's signature view into your own viewControllers.

    //
    - (void)viewDidLoad {
        [super viewDidLoad];
        if (self.signatureController)
            [self addChildViewController:self.signatureController];

        if (self.signatureController2)
            [self addChildViewController:self.signatureController2];
    }

    - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
    {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)  {
            return (interfaceOrientation != UIInterfaceOrientationPortrait);
        }
        else {
            return YES;
        }
    }

    - (void) signatureViewController:(SignatureViewController *)viewController didSign:(NSData *)signatureData {
    
        NSLog(@"handle signature in signatureData: %@",signatureData.description);
    }

    - (void) didNotSignatureViewController:(SignatureViewController *)viewController {
    
        NSLog(@"handle tapping sign with no signature");
    }

LICENSE
-------

Copyright (C) 2012-2016 by Montiel Mobile, LLC

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
