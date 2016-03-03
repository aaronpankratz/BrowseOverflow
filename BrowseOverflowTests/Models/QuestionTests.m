//
//  QuestionTests.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Question.h"

@interface QuestionTests : XCTestCase {
    Question *question;
}

@end

@implementation QuestionTests

- (void)setUp {
    [super setUp];
    question = [Question new];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testThatQuestionExists {
    XCTAssertNotNil(question, @"should be able to create a Question instance");
}

- (void)testThatQuestionHasADate {
    XCTAssertTrue([question.date isKindOfClass:[NSDate class]], @"Question needs to provide its date");
}

@end
