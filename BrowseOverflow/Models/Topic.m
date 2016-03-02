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

- (instancetype)initWithName:(NSString *)newName {
    if (self = [super init]) {
        name = [newName copy];
    }
    return self;
}
@end
