//
//  MasterViewController.h
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 2/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullRefreshTableViewController.h"

@interface NewsViewController : PullRefreshTableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
