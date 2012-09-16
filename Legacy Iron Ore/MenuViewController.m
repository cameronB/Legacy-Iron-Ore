//
//  MenuViewController.m
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 14/08/12.
//
//

#import "MenuViewController.h"
#import "NewsViewController.h"
#import "ProjectsViewController.h"
#import "CorporateViewController.h"
#import "MyHoldingsViewController.h"
#import "ContactUsViewController.h"
#import "UIViewController+ModalViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation MenuViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //Add gradient background
    CAGradientLayer *bgLayer = [BackgroundLayer blueGradient];
	bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
}

//initilize view programmatically
- (void) loadView {
    
    //allocate view
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen
                                                  mainScreen].applicationFrame];
    
    self.view = view;
    
    //Display Home Button
    btnHome = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnHome addTarget:self
                       action:@selector(navigateHome)
             forControlEvents:UIControlEventTouchUpInside];
    
    [btnHome setTitle:@"Home" forState:UIControlStateNormal];
    btnHome.frame = CGRectMake(10.0, 80.0, 300.0, 35.0);
    //Add Home button to the subview
    [view addSubview:btnHome];
    
    //Display Projects Button
    btnProjects = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnProjects addTarget:self
                action:@selector(navigateProjects)
      forControlEvents:UIControlEventTouchUpInside];
    
    [btnProjects setTitle:@"Projects" forState:UIControlStateNormal];
    btnProjects.frame = CGRectMake(10.0, 125.0, 300.0, 35.0);
    //Add Home button to the subview
    [view addSubview:btnProjects];
    
    //Display Corporate Button
    btnCorporate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnCorporate addTarget:self
                    action:@selector(navigateCorporate)
          forControlEvents:UIControlEventTouchUpInside];
    
    [btnCorporate setTitle:@"Corporate" forState:UIControlStateNormal];
    btnCorporate.frame = CGRectMake(10.0, 170.0, 300.0, 35.0);
    //Add Home button to the subview
    [view addSubview:btnCorporate];
    
    //Display My Holdings button
    btnMyHoldings= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnMyHoldings addTarget:self
                     action:@selector(navigateMyHoldings)
           forControlEvents:UIControlEventTouchUpInside];
    
    [btnMyHoldings setTitle:@"My Holdings" forState:UIControlStateNormal];
    btnMyHoldings.frame = CGRectMake(10.0, 215.0, 300.0, 35.0);
    //Add Home button to the subview
    [view addSubview:btnMyHoldings];
    
    //Display Contact Us button
    btnContactUs= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnContactUs addTarget:self
                      action:@selector(navigateContactUs)
            forControlEvents:UIControlEventTouchUpInside];
    
    [btnContactUs setTitle:@"Contact Us" forState:UIControlStateNormal];
    btnContactUs.frame = CGRectMake(10.0, 260.0, 300.0, 35.0);
    //Add Home button to the subview
    [view addSubview:btnContactUs];
}

- (void) navigateHome {
    NSLog(@"navigate home button activated");
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: newsViewController];
    
    [self presentModalViewController:navigationController withPushDirection:kCATransitionFromRight];
    
    
}

- (void) navigateProjects {
    NSLog(@"Navigate projects button activated");
    
    ProjectsViewController *projectsViewController = [[ProjectsViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:projectsViewController];
    
    [self presentModalViewController:navigationController withPushDirection:kCATransitionFromRight];
    

    
}

- (void) navigateCorporate {
    NSLog(@"Navigate corporate button activated");
    
    CorporateViewController *corporateViewController = [[CorporateViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:corporateViewController];
    
    [self presentModalViewController:navigationController withPushDirection:kCATransitionFromRight];
}

- (void) navigateMyHoldings {
    NSLog(@"Navigate my holdings button activated");
    
    MyHoldingsViewController *myHoldingsViewController = [[MyHoldingsViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:myHoldingsViewController];
    
    [self presentModalViewController:navigationController withPushDirection:kCATransitionFromRight];
    
}

- (void) navigateContactUs {
    NSLog(@"Navigate my holdings button activated");
    
    ContactUsViewController *contactViewController = [[ContactUsViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:contactViewController];
    
    [self presentModalViewController:navigationController withPushDirection:kCATransitionFromRight];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //set the title for the default news view controller
    self.navigationItem.title = @"Legacy Iron Ore";
    
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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
