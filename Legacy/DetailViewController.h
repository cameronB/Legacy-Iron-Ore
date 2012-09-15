//
//  DetailViewController.h
//  Legacy
//
//  Created by Cameron Bradley on 15/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
