//
//  QuestionTests.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Question.h"
#import "Answer.h"

@interface QuestionTests : XCTestCase {
    Question *question;
    Answer *lowScore;
    Answer *highScore;
}

@end

@implementation QuestionTests

- (void)setUp {
    [super setUp];
    question = [Question new];
    question.date = [NSDate distantPast];
    question.title = @"Do iPhones also dream of electric sheep?";
    question.score = 42;
    
    Answer *accepted = [Answer new];
    accepted.score = 1;
    accepted.accepted = YES;
    [question addAnswer:accepted];
    
    lowScore = [Answer new];
    lowScore.score = -4;
    [question addAnswer:lowScore];
    
    highScore = [Answer new];
    highScore.score = 4;
    [question addAnswer:highScore];
}

- (void)tearDown {
    question = nil;
    lowScore = nil;
    highScore = nil;
    [super tearDown];
}

- (void)testHighScoreAnswersBeforeLow {
    NSArray *answers = question.answers;
    NSInteger highIndex = [answers indexOfObject:highScore];
    NSInteger lowIndex = [answers indexOfObject:lowScore];
    XCTAssertTrue(highIndex < lowIndex, @"high scores come first");
}

- (void)testAcceptedAnswerIsFirst {
    XCTAssertTrue([[question.answers objectAtIndex:0] isAccepted], @"Accepted answer comes first");
}

- (void)testQuestionCanHaveAnswersAdded {
    Answer *myAnswer = [Answer new];
    XCTAssertNoThrow([question addAnswer:myAnswer], @"possible to add an answer");
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
