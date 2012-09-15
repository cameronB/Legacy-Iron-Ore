//
//  UIViewController+ModalViewController.h
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 19/08/12.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (ModalViewController)

- (void) presentModalViewController:(UIViewController *)modalViewController withPushDirection: (NSString *) direction;
- (void) dismissModalViewControllerWithPushDirection:(NSString *) direction;

@end
