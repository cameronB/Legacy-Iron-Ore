//
//  main.m
//  LegacyNews
//
//  Created by Cameron Bradley on 15/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import "NewsInfo.h"
#import "NewsDetails.h"
#import "NewsStore.h"
#import "NewsDelegate.h"
#import "ProjectInfo.h"
#import "ProjectDetails.h"
#import "ProjectsStore.h"
#import "ProjectsDelegate.h"

static NSManagedObjectModel *managedObjectModel()
{
    static NSManagedObjectModel *model = nil;
    if (model != nil) {
        return model;
    }
    
    NSString *path = @"LegacyNews";
    path = [path stringByDeletingPathExtension];
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Legacy_Iron_Ore" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return model;
}

static NSManagedObjectContext *managedObjectContext()
{
    static NSManagedObjectContext *context = nil;
    if (context != nil) {
        return context;
    }

    @autoreleasepool {
        context = [[NSManagedObjectContext alloc] init];
        
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel()];
        [context setPersistentStoreCoordinator:coordinator];
        
        NSString *STORE_TYPE = NSSQLiteStoreType;
        
        NSString *path = @"Legacy_Iron_Ore";
        NSURL *url = [NSURL fileURLWithPath:[path stringByAppendingPathExtension:@"sqlite"]];
        
        NSError *error;
        NSPersistentStore *newStore = [coordinator addPersistentStoreWithType:STORE_TYPE configuration:nil URL:url options:nil error:&error];
        
        if (newStore == nil) {
            NSLog(@"Store Configuration Failure %@", ([error localizedDescription] != nil) ? [error localizedDescription] : @"Unknown Error");
        }
    }
    return context;
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // Create the managed object context
        NSManagedObjectContext *context = managedObjectContext();
        
        // Custom code here...
        // Save the managed object context
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Error while saving %@", ([error localizedDescription] != nil) ? [error localizedDescription] : @"Unknown Error");
            exit(1);
        }
        
        NewsDelegate *newsDelegate;
        
        //send URL to xmlParser
        newsDelegate = [[NewsDelegate alloc] loadNewsXMLByURL:@"http://www.complr.com/Legacy/xml/news.php"];
        
        int iNewsCounter = 0;
        
        //count number of clubs from the XMLParser
        NSInteger newsXMLResultsCounter = [[newsDelegate news] count];
        
        //Determine current news id in core data.
        NSFetchRequest *newsFetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *newsEntity = [NSEntityDescription entityForName:@"NewsInfo"
                                                  inManagedObjectContext:context];
        [newsFetchRequest setEntity:newsEntity];
        NSArray *newsFetchedObjects = [context executeFetchRequest:newsFetchRequest error:nil];
        
        NSMutableArray * allNewsPrimaryKeys = [[newsFetchedObjects valueForKeyPath:@"newsId"] mutableCopy];
        
        //do while (number of clubs)
        do {
            
            NewsStore *newsStore = [[newsDelegate news] objectAtIndex:iNewsCounter];
            NSString *newsId = [newsStore newsId];
            
            if ([allNewsPrimaryKeys containsObject:newsId]) {
                //news id (Primary key) found do nothing.
                
            } else {
                //news id (Primary Key) not found insert new entry into coredata.
                
                NewsInfo *newsInfo = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"NewsInfo"
                                      inManagedObjectContext:context];
                
                newsInfo.newsId = [newsStore newsId];
                newsInfo.newsName = [newsStore newsName];
                
                NewsDetails *newsDetails = [NSEntityDescription
                                            insertNewObjectForEntityForName:@"NewsDetails"
                                            inManagedObjectContext:context];
                
                newsDetails.newsDescription = [newsStore newsDescription];
                newsDetails.newsLink = [newsStore newsLink];
                
                newsDetails.info = newsInfo;
                newsInfo.details = newsDetails;
                
                NSError *error;
                if (![context save:&error]) {
                    NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
                }
            }
            
            iNewsCounter++;
            
        } while (iNewsCounter < newsXMLResultsCounter);
        
        NSLog(@"retrieved latest news from external xml and stored in core data");
        for (NewsInfo *info in newsFetchedObjects) {
            NSLog(@"id: %@", info.newsId);
            NSLog(@"name: %@", info.newsName);
            NewsDetails *details = info.details;
            NSLog(@"description: %@", details.newsDescription);
            NSLog(@"link: %@", details.newsLink);
        }
        
        ProjectsDelegate *projectsDelegate;
        
        //send URL to xmlParser
        projectsDelegate = [[ProjectsDelegate alloc] loadProjectsXMLByURL:@"http://www.complr.com/Legacy/xml/projects.php"];
        
        int iProjectsCounter = 0;
        
        //count number of clubs from the XMLParser
        NSInteger projectsXmlResultsCount = [[projectsDelegate projects] count];
        
        //Determine current news id in core data.
        NSFetchRequest *projectsFetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *projectsEntity = [NSEntityDescription entityForName:@"ProjectInfo"
                                                          inManagedObjectContext:context];
        [projectsFetchRequest setEntity:projectsEntity];
        NSArray *projectsFetchedObjects = [context executeFetchRequest:projectsFetchRequest error:nil];
        
        NSMutableArray * allProjectsPrimaryKeys = [[projectsFetchedObjects valueForKeyPath:@"projectId"] mutableCopy];
        
        //do while (number of clubs)
        do {
            
            ProjectsStore *projectsStore = [[projectsDelegate projects] objectAtIndex:iProjectsCounter];
            NSString *projectId = [projectsStore projectId];
            
            if ([allProjectsPrimaryKeys containsObject:projectId]) {
                //news id (Primary key) found do nothing.
                
            } else {
                //news id (Primary Key) not found insert new entry into coredata.
                
                ProjectInfo *projectInfo = [NSEntityDescription
                                            insertNewObjectForEntityForName:@"ProjectInfo"
                                            inManagedObjectContext:context];
                
                projectInfo.projectId = [projectsStore projectId];
                projectInfo.projectName = [projectsStore projectName];
                
                ProjectDetails *projectDetails = [NSEntityDescription
                                                  insertNewObjectForEntityForName:@"ProjectDetails"
                                                  inManagedObjectContext:context];
                
                projectDetails.projectDescription = [projectsStore projectDescription];
                
                projectDetails.info = projectInfo;
                projectInfo.details = projectDetails;
                
                NSError *error;
                if (![context save:&error]) {
                    NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
                }
            }
            
            iProjectsCounter++;
            
        } while (iProjectsCounter < projectsXmlResultsCount);
        
        NSLog(@"retrieved latest projects from external xml and stored in core data");
        for (ProjectInfo *info in projectsFetchedObjects) {
            NSLog(@"id: %@", info.projectId);
            NSLog(@"name: %@", info.projectName);
            ProjectDetails *details = info.details;
            NSLog(@"description: %@", details.projectDescription);
        }
    }
    
    return 0;
}

