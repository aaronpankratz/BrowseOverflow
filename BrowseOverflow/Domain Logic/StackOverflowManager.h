//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/6/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StackOverflowCommunicator;
@class Topic;
@class QuestionBuilder;

extern NSString *StackOverflowManagerError;

enum {
  StackOverflowManagerErrorQuestionSearchCode
};

@protocol StackOverflowManagerDelegate <NSObject>
- (void)fetchingQuestionsFailedWithError:(NSError *)error;
- (void)didReceiveQuestions:(NSArray *)questions;
@end

@interface StackOverflowManager : NSObject
@property (weak, nonatomic) id <StackOverflowManagerDelegate> delegate;
@property (strong) id communicator;
@property (strong) QuestionBuilder *questionBuilder;

- (void)fetchQuestionsOnTopic:(Topic *)topic;
- (void)searchingForQuestionsFailedWithError:(NSError *)error;
- (void)receivedQuestionsJSON:(NSString *)objectNotation;
@end
