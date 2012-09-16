//
//  ProjectInfo.h
//  LegacyNews
//
//  Created by Cameron Bradley on 16/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ProjectDetails;

@interface ProjectInfo : NSManagedObject

@property (nonatomic, retain) NSString * projectId;
@property (nonatomic, retain) NSString * projectName;
@property (nonatomic, retain) ProjectDetails *details;

@end
