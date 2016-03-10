//
//  MockStackOverflowCommunicator.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/9/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "MockStackOverflowCommunicator.h"

@implementation MockStackOverflowCommunicator {
    BOOL wasAskedToFetchQuestions;
}

- (void)searchForQuestionsWithTag:(NSString *)tag {
    wasAskedToFetchQuestions = YES;
}

- (BOOL)wasAskedToFetchQuestions {
    return wasAskedToFetchQuestions;
}

@end
