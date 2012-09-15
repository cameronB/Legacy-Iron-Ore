//
//  UITableViewController+ModalViewController.h
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 22/08/12.
//
//

#import <UIKit/UIKit.h>

@interface UITableViewController (ModalViewController)

- (void) presentModalViewController:(UIViewController *)modalViewController withPushDirection: (NSString *) direction;
- (void) dismissModalViewControllerWithPushDirection:(NSString *) direction;

@end
