//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/6/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "StackOverflowManager.h"
#import "StackOverflowCommunicator.h"
#import "Topic.h"
#import "QuestionBuilder.h"

@implementation StackOverflowManager
@synthesize delegate;
@synthesize communicator;
@synthesize questionBuilder;

- (void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate {
    if (newDelegate != nil
        && ![newDelegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException
                                 reason:@"Delegate object does not conform to the delegate protocol"
                               userInfo:nil] raise];
    }
    delegate = newDelegate;
}

- (void)fetchQuestionsOnTopic:(Topic *)topic {
    [communicator searchForQuestionsWithTag:topic.tag];
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error {
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
    NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerError
                                                   code:StackOverflowManagerErrorQuestionSearchCode
                                               userInfo:errorInfo];
    [delegate fetchingQuestionsFailedWithError:reportableError];
}

- (void)receivedQuestionsJSON:(NSString *)objectNotation {
    NSArray *questions = [questionBuilder questionsFromJSON:objectNotation error:NULL];
}

@end

NSString *StackOverflowManagerError = @"StackOverflowManagerError";
