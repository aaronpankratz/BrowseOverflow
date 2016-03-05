//
//  Question.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "Question.h"

@implementation Question
@synthesize date;
@synthesize title;
@synthesize score;

- (instancetype)init {
    if (self = [super init]) {
        answerSet = [NSMutableSet new];
    }
    return self;
}

- (void)addAnswer:(Answer *)answer {
    [answerSet addObject:answer];
}

- (NSArray *)answers {
    return [[answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

@end
