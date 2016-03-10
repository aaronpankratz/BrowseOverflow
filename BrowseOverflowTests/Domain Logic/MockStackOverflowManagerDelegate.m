//
//  MockStackOverflowManagerDelegate.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/6/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"

@implementation MockStackOverflowManagerDelegate {
    NSArray *receivedQuestions;
}

- (void)fetchingQuestionsFailedWithError:(NSError *)error {
    self.fetchError = error;
}

- (void)didReceiveQuestions:(NSArray *)questions {
    receivedQuestions = questions;
}

- (NSArray *)receivedQuestions {
    return receivedQuestions;
}

@end
