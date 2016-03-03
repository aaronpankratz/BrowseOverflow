//
//  Person.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/2/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name;
@synthesize avatarURL;

- (instancetype)initWithName:(NSString *)aName
              avatarLocation:(NSString *)location {
    if (self = [super init]) {
        name = [aName copy];
        avatarURL = [[NSURL alloc] initWithString:location];
    }
    return self;
}
@end
