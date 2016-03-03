//
//  Topic.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject
@property (readonly) NSString *name;
@property (readonly) NSString *tag;

- (instancetype)initWithName:(NSString *)newName
                         tag:(NSString *)newTag;

- (NSArray *)recentQuestions;
@end
