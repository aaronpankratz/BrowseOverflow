//
//  TopicTests.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Topic.h"
#import "Question.h"

@interface TopicTests : XCTestCase {
    Topic *topic;
}
@end

@implementation TopicTests

- (void)setUp {
    [super setUp];
    topic = [[Topic alloc] initWithName:@"iPhone"
                                    tag:@"iphone"];
}

- (void)tearDown {
    topic = nil;
    [super tearDown];
}

- (void)testThatTopicExists {
    XCTAssertNotNil(topic, @"should be able to create a Topic instance");
}

- (void)testThatTopicCanBeNamed {
    XCTAssertEqualObjects(topic.name, @"iPhone", @"the Topic should have the name I gave it");
}

- (void)testThatTopicHasATag {
    XCTAssertEqualObjects(topic.tag, @"iphone", @"the Topic should have the tag I gave it");
}

- (void)testForAListOfQuestions {
    XCTAssertTrue([[topic recentQuestions] isKindOfClass:[NSArray class]], @"topics should provide a list of recent questions");
}

- (void)testForInitiallyEmptyQuestionList {
    XCTAssertEqual([[topic recentQuestions] count], 0, @"no questions added, count is zero");
}

- (void)testAddingAQuestionTotheList {
    Question *question = [Question new];
    [topic addQuestion:question];
    XCTAssertEqual([[topic recentQuestions] count], 1, @"add a question, count is one");
}

- (void)testQuestionsAreListedChronologically {
    Question *q1 = [Question new];
    q1.date = [NSDate distantPast];
    Question *q2 = [Question new];
    q2.date = [NSDate distantFuture];
    
    [topic addQuestion:q1];
    [topic addQuestion:q2];
    
    NSArray *questions = [topic recentQuestions];
    Question *listedFirst = [questions objectAtIndex:0];
    Question *listedSecond = [questions objectAtIndex:1];
    
    XCTAssertEqualObjects([listedFirst.date laterDate:listedSecond.date], listedFirst.date, @"later question should appear first in the list");
    
    Question *q3 = [Question new];
    q3.date = [NSDate distantPast];
    Question *q4 = [Question new];
    q4.date = [NSDate distantFuture];
    
    [topic addQuestion:q4];
    [topic addQuestion:q3];
    
    questions = [topic recentQuestions];
    Question *listedThird = [questions objectAtIndex:2];
    Question *listedFourth = [questions objectAtIndex:3];
    
    XCTAssertEqualObjects([listedThird.date laterDate:listedFourth.date], listedThird.date, @"later question should appear first in the list");
}

- (void)testLimitOfTwentyQuestions {
    Question *q1 = [Question new];
    for (NSInteger i = 0; i < 25; i++) {
        [topic addQuestion:q1];
    }
    XCTAssertTrue([[topic recentQuestions] count] < 21, @"There should never be more than 20 questions");
}

@end
