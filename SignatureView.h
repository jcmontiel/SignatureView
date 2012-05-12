//
//  SignatureView.h
//  HelpConnect
//
//  Created by John Montiel on 3/12/12.
//  Copyright (c) 2012 Em Sevn, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBeganSignature @"SignatureViewBeganSignature"

@interface SignatureView : UIView
@property(nonatomic, readonly) BOOL drawnSignature;

- (void)erase;
- (void)setBrushColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
- (UIImage *) getSignatureImage;


@end
