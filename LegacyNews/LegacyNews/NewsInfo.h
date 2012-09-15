//
//  NewsInfo.h
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 2/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NewsDetails;

@interface NewsInfo : NSManagedObject

@property (nonatomic, retain) NSString * newsId;
@property (nonatomic, retain) NSString * newsName;
@property (nonatomic, retain) NewsDetails *details;

@end
