//
//  ContactUsViewController.m
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 19/08/12.
//
//

#import "ContactUsViewController.h"
#import "MenuViewController.h"
#import "UIViewController+ModalViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ContactUsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //Add gradient background
    CAGradientLayer *bgLayer = [BackgroundLayer blueGradient];
	bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //set the title for the default news view controller
    self.navigationItem.title = @"Contact Us";
    
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

//initilize view programmatically
- (void) loadView {
    
    //allocate view
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen
                                                  mainScreen].applicationFrame];
    
    //add background default_bg image to view
    view.backgroundColor = [UIColor whiteColor];
    
    self.view = view;
}

- (void) loadMenuView {
    NSLog(@"load corporate view button clicked");
    
    MenuViewController *menuViewController = [[MenuViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:menuViewController];
    
    [self presentModalViewController:navigationController withPushDirection:kCATransitionFromLeft];
    
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
