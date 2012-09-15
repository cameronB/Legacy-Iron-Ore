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
        newsDelegate = [[NewsDelegate alloc] loadXMLByURL:@"http://www.complr.com/Legacy/xml/news.php"];
        
        int i = 0;
        
        //count number of clubs from the XMLParser
        NSInteger count = [[newsDelegate news] count];
        
        //Determine current news id in core data.
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"NewsInfo"
                                                  inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:nil];
        
        NSMutableArray * allPrimaryKeys = [[fetchedObjects valueForKeyPath:@"newsId"] mutableCopy];
        
        //do while (number of clubs)
        do {
            
            NewsStore *newsStore = [[newsDelegate news] objectAtIndex:i];
            NSString *newsId = [newsStore newsId];
            
            if ([allPrimaryKeys containsObject:newsId]) {
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
            
            i++;
            
        } while (i < count);
        
        NSLog(@"retrieved latest news from external xml");
    }
    
    return 0;
}

