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
    question.date = [NSDate distantPast];
    question.title = @"Do iPhones also dream of electric sheep?";
    question.score = 42;
}

- (void)tearDown {
    question = nil;
    [super tearDown];
}

- (void)testThatQuestionExists {
    XCTAssertNotNil(question, @"should be able to create a Question instance");
}

- (void)testThatQuestionHasADate {
    NSDate *testDate = [NSDate distantPast];
    question.date = testDate;
    XCTAssertTrue([question.date isKindOfClass:[NSDate class]], @"Question needs to provide its date");
}

- (void)testQuestionsKeepScore {
    XCTAssertEqual(question.score, 42, @"Questions need a numeric score");
}

- (void)testQuestionHasATitle {
    XCTAssertEqualObjects(question.title, @"Do iPhones also dream of electric sheep?", @"Question should know its title");
}

@end
