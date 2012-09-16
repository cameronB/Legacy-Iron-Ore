//
//  ProjectsDelegate.h
//  LegacyNews
//
//  Created by Cameron Bradley on 16/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import "ProjectsStore.h"

@interface ProjectsDelegate : NSObject <NSXMLParserDelegate> {
    
    NSMutableString *currentNodeContent;
    NSMutableArray *projects;
    NSXMLParser *parser;
    ProjectsStore *projectsStore;
}


@property (readonly, retain) NSMutableArray *projects;
@property (readonly, retain) NSXMLParser *parser;

- (id) loadProjectsXMLByURL:(NSString *)urlString;

@end

