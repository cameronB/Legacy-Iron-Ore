//
//  ProjectsViewController.h
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 22/08/12.
//
//

#import "PullRefreshTableViewController.h"

@interface ProjectsViewController : PullRefreshTableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
