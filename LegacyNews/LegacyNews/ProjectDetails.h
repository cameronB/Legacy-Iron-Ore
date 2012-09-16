//
//  ProjectDetails.h
//  LegacyNews
//
//  Created by Cameron Bradley on 16/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

@class ProjectInfo;

@interface ProjectDetails : NSManagedObject

@property (nonatomic, retain) NSString * projectDescription;
@property (nonatomic, retain) ProjectInfo *info;

@end
