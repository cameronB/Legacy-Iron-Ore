//
//  NewsStore.h
//  Legacy Iron Ore
//
//  Created by Cameron Bradley on 14/09/12.
//  Copyright (c) 2012 Cameron Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsStore : NSObject {

    NSString *newsId;
    NSString *newsName;
    NSString *NewsDescription;
    NSString *newsLink;
    
}

@property (nonatomic, retain) NSString *newsId;
@property (nonatomic, retain) NSString *newsName;
@property (nonatomic, retain) NSString *newsDescription;
@property (nonatomic, retain) NSString *newsLink;

@end
