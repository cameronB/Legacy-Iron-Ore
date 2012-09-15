//
//  ProjectsViewController.m
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 22/08/12.
//
//

#import "ProjectsViewController.h"

#import "NewsViewController.h"
#import "MenuViewController.h"
#import "UITableViewController+ModalViewController.h"

@implementation ProjectsViewController


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //set the title for the default news view controller
    self.navigationItem.title = @"Legacy Iron Ore";
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    //color for navigation bar
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:00.0/255.0
                                                                          green:00.0/255.0
                                                                           blue:000.0/255.0
                                                                          alpha:1.0]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    /*UIImage *image = [UIImage imageNamed: @"topHeader.png"];
     UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
     imageView.frame = CGRectMake(0, 0, 200, 30);
     self.navigationItem.titleView = imageView;
     [imageView release];*/
    
    //setup a custom image menu bar item on the top left of the navigation bar.
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"ButtonMenu.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loadMenuView) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 32, 32)];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = menuButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) loadMenuView {
    NSLog(@"load menu view button clicked");
    
    MenuViewController *menuViewController = [[MenuViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: menuViewController];
    
    [self presentModalViewController:navigationController withPushDirection:kCATransitionFromLeft];

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}

//table view cell styles.
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //set the background image for the cell.
    cell.backgroundColor = [UIColor whiteColor];
    
    //textLabel styles.
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    cell.textLabel.textColor = [UIColor blueColor];
    
    //detailTextLabel styles.
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10.0];
    cell.detailTextLabel.textColor = [UIColor blueColor];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)refresh {
    [self performSelector:@selector(refreshItems) withObject:nil afterDelay:2.0];
}

- (void)refreshItems {
    NSLog(@"Refresh Items");
    
    //reload the table view.
    [self.tableView reloadData];
    
    [self stopLoading];
}

@end
