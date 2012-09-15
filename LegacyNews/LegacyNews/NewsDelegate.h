//
//  NewsDelegate.h
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 14/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsStore.h"

@interface NewsDelegate : NSObject <NSXMLParserDelegate> {
    
    NSMutableString *currentNodeContent;
    NSMutableArray *news;
    NSXMLParser *parser;
    NewsStore *newsStore;
}

@property (readonly, retain) NSMutableArray *news;
@property (readonly, retain) NSXMLParser *parser;

- (id) loadXMLByURL:(NSString *)urlString;

@end
