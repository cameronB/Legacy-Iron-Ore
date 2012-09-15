//
//  NewsDetails.h
//  Legacy
//
//  Created by Cameron Bradley on 15/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NewsInfo;

@interface NewsDetails : NSManagedObject

@property (nonatomic, retain) NSString * newsDescription;
@property (nonatomic, retain) NSString * newsLink;
@property (nonatomic, retain) NewsInfo *info;

@end
