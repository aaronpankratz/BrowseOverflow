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

extern NSString *StackOverflowManagerError;

enum {
  StackOverflowManagerErrorQuestionSearchCode
};

@protocol StackOverflowManagerDelegate <NSObject>
- (void)fetchingQuestionsFailedWithError:(NSError *)error;
@end

@interface StackOverflowManager : NSObject
@property (weak, nonatomic) id <StackOverflowManagerDelegate> delegate;
@property (strong) id communicator;

- (void)fetchQuestionsOnTopic:(Topic *)topic;
- (void)searchingForQuestionsFailedWithError:(NSError *)error;
@end
