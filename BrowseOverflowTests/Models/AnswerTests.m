//
//  AnswerTests.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/5/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Answer.h"
#import "Person.h"

@interface AnswerTests : XCTestCase {
    Answer *answer;
    Answer *otherAnswer;
}
@end

@implementation AnswerTests

- (void)setUp {
    [super setUp];
    answer = [Answer new];
    answer.text = @"you gave me the answer";
    answer.person = [[Person alloc] initWithName:@"Paul McCartney"
                                  avatarLocation:@"http://example.com/avatar.png"];
    answer.score = 1975;
    otherAnswer = [Answer new];
    otherAnswer.text = @"to love eternally";
    otherAnswer.score = 1975;
}

- (void)tearDown {
    answer = nil;
    [super tearDown];
}

- (void)testCreateAnswer {
    XCTAssertNotNil(answer, @"answer shouldn't be nil");
}

- (void)testAnswerShouldHaveText {
    XCTAssertEqualObjects(answer.text, @"you gave me the answer", @"answer should have the text I gave it");
}

- (void)testPersonProvidedTheAnswer {
    XCTAssertTrue([answer.person isKindOfClass:[Person class]], @"person should have provided the answer");
}

- (void)testAnswersNotAcceptedByDefault {
    XCTAssertFalse(answer.accepted, @"answer not accepted by default");
}

- (void)testAnswerCanBeAccepted {
    XCTAssertNoThrow(answer.accepted = YES, @"is possible to accept answer");
}

- (void)testAnswerHasScore {
    XCTAssertTrue(answer.score = 1975, @"answer should have the score I gave it");
}

- (void)testAcceptedAnswerComesBeforeUnaccepted {
    otherAnswer.accepted = YES;
    otherAnswer.score = answer.score + 14;
    
    XCTAssertEqual([answer compare:otherAnswer], NSOrderedDescending, @"accepted answer should come first");
    XCTAssertEqual([otherAnswer compare:answer], NSOrderedAscending, @"unaccepted answer should come laste");
}

- (void)testAnswersWithEqualScoresCompareEqually {
    XCTAssertEqual([answer compare:otherAnswer], NSOrderedSame, @"answers are equal rank");
    XCTAssertEqual([otherAnswer compare:answer], NSOrderedSame, @"answers have same rank");
}


- (void)testLowerScoringAnswerComparesAfterHigher {
    otherAnswer.score = answer.score + 14;
    XCTAssertEqual([answer compare:otherAnswer], NSOrderedDescending, @"higher score comes first");
    XCTAssertEqual([otherAnswer compare:answer], NSOrderedAscending, @"lower score come last");
}



@end
