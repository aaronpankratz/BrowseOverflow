//
//  QuestionCreationTests.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/5/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StackOverflowManager.h"
#import "MockStackOverflowManagerDelegate.h"
#import "MockStackOverflowCommunicator.h"
#import "Topic.h"
#import "FakeQuestionBuilder.h"


@interface QuestionCreationTests : XCTestCase {
    StackOverflowManager *mgr;
    MockStackOverflowManagerDelegate *delegate;
    NSError *underlyingError;
    FakeQuestionBuilder *builder;
}
@end

@implementation QuestionCreationTests

- (void)setUp {
    [super setUp];
    mgr = [StackOverflowManager new];
    delegate = [MockStackOverflowManagerDelegate new];
    XCTAssertNoThrow(mgr.delegate = delegate, @"Object conforming to the delegate protocol should be used as delegate");
    underlyingError = [NSError errorWithDomain:@"Test domain" code:0 userInfo:nil];
    builder = [FakeQuestionBuilder new];
    mgr.questionBuilder = builder;
}

- (void)tearDown {
    mgr = nil;
    delegate = nil;
    underlyingError = nil;
    builder = nil;
    [super tearDown];
}

- (void)testNonConformingObjectCannotBeDelegate {
    XCTAssertThrows(mgr.delegate = (id<StackOverflowManagerDelegate>) [NSNull null], @"NSNull should not be used for the delegate as doesn't conform to the delegate protocol");
}

- (void)testManagerAcceptsNilAsADelegate {
    XCTAssertNoThrow(mgr.delegate = nil, @"It should be acceptable to use nil as an object's delegate");
}

- (void)testAskingForQuestionsMeansRequestingData {
    MockStackOverflowCommunicator *communicator = [MockStackOverflowCommunicator new];
    mgr.communicator = communicator;
    Topic *topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
    [mgr fetchQuestionsOnTopic:topic];
    XCTAssertTrue([communicator wasAskedToFetchQuestions], @"The communicator should need to fetch data");
}

- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator {
    [mgr searchingForQuestionsFailedWithError:underlyingError];
    XCTAssertFalse(underlyingError == [delegate fetchError], @"error should be at the correct level of abstraction");
}

- (void)testErrorReturnedToDelegateDocumentsUnderlyingError {
    [mgr searchingForQuestionsFailedWithError:underlyingError];
    XCTAssertEqualObjects([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], underlyingError, @"The underlying error should be available to client code");
}

- (void)testQuestionJSONIsPassedToQuestionBuilder {
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    XCTAssertEqualObjects(builder.JSON, @"Fake JSON", @"downloaded JSON is sent to the builder");
}

- (void)testDelegateNotifiedOfErrorWhenQuestionBuilderFails {
    builder.arrayToReturn = nil;
    builder.errorToSet = underlyingError;
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    XCTAssertNotNil([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], @"the delegate should have found out about the error");
}

@end
