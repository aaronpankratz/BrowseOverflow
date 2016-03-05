//
//  Topic.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

const NSUInteger MaxNumberOfQuestions = 20;

@implementation Topic {
    NSArray *questions;
}

@synthesize name;
@synthesize tag;


- (instancetype)initWithName:(NSString *)newName
                         tag:(NSString *)newTag {
    if (self = [super init]) {
        name = [newName copy];
        tag = [newTag copy];
        questions = [NSArray new];
    }
    return self;
}

- (NSArray *)recentQuestions {
    return [self sortQuestionsLatestFirst:questions];
}

- (void)addQuestion:(Question *)question {
    NSArray *newQuestions = [questions arrayByAddingObject:question];
    if ([newQuestions count] > MaxNumberOfQuestions) {
        newQuestions = [newQuestions subarrayWithRange:NSMakeRange(0, MaxNumberOfQuestions)];
    }
    questions = newQuestions;
}

- (NSArray *)sortQuestionsLatestFirst:(NSArray *)questionList {
    return [questionList sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Question *q1 = (Question *)obj1;
        Question *q2 = (Question *)obj2;
        return [q2.date compare:q1.date];
    }];
}

@end
