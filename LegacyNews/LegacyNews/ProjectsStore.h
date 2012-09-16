//
//  ProjectsStore.h
//  LegacyNews
//
//  Created by Cameron Bradley on 16/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

@interface ProjectsStore : NSObject {
    
    NSString *projectId;
    NSString *projectName;
    NSString *projectDescription;
}

@property (nonatomic, retain) NSString *projectId;
@property (nonatomic, retain) NSString *projectName;
@property (nonatomic, retain) NSString *projectDescription;

@end
