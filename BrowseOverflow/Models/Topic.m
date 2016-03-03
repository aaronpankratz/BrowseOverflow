//
//  Topic.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "Topic.h"

@implementation Topic
@synthesize name;
@synthesize tag;

- (instancetype)initWithName:(NSString *)newName
                         tag:(NSString *)newTag {
    if (self = [super init]) {
        name = [newName copy];
        tag = [newTag copy];
    }
    return self;
}

- (NSArray *)recentQuestions {
    return [NSArray array];
}

@end
