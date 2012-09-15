//
//  NewsDelegate.m
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 14/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import "NewsDelegate.h"

@implementation NewsDelegate

@synthesize news, parser;

-(id) loadXMLByURL:(NSString *)urlString {
    
    news          = [[NSMutableArray alloc] init];
    NSURL *url      = [NSURL URLWithString:urlString];
    NSData  *data   = [[NSData alloc] initWithContentsOfURL:url];
    parser          = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
    return self;
    
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"news"])
    {
        newsStore = [NewsStore alloc];
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"newsId"])
    {
        newsStore.newsId = currentNodeContent;
    }
    if ([elementname isEqualToString:@"newsName"])
    {
        newsStore.newsName = currentNodeContent;
    }
    if ([elementname isEqualToString:@"newsDescription"])
    {
        newsStore.newsDescription = currentNodeContent;
    }
    if ([elementname isEqualToString:@"newsLink"])
    {
        newsStore.newsLink = currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"news"])
    {
        [news addObject:newsStore];
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
