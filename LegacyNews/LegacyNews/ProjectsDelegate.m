//
//  ProjectsDelegate.m
//  LegacyNews
//
//  Created by Cameron Bradley on 16/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import "ProjectsDelegate.h"

@implementation ProjectsDelegate

@synthesize projects, parser;

-(id) loadProjectsXMLByURL:(NSString *)urlString {
    
    projects        = [[NSMutableArray alloc] init];
    NSURL *url      = [NSURL URLWithString:urlString];
    NSData  *data   = [[NSData alloc] initWithContentsOfURL:url];
    parser          = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
    return self;
    
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"project"])
    {
        projectsStore = [ProjectsStore alloc];
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"projectId"])
    {
        projectsStore.projectId = currentNodeContent;
    }
    if ([elementname isEqualToString:@"projectName"])
    {
        projectsStore.projectName = currentNodeContent;
    }
    if ([elementname isEqualToString:@"projectDescription"])
    {
        projectsStore.projectDescription = currentNodeContent;
    }   
    if ([elementname isEqualToString:@"project"])
    {
        [projects addObject:projectsStore];
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


@end
