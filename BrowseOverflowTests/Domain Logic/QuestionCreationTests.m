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

@interface QuestionCreationTests : XCTestCase {
    StackOverflowManager *mgr;
}
@end

@implementation QuestionCreationTests

- (void)setUp {
    [super setUp];
    mgr = [StackOverflowManager new];
}

- (void)tearDown {
    mgr = nil;
    [super tearDown];
}

- (void)testNonConformingObjectCannotBeDelegate {
    XCTAssertThrows(mgr.delegate = (id<StackOverflowManagerDelegate>) [NSNull null], @"NSNull should not be used for the delegate as doesn't conform to the delegate protocol");
}

- (void)testConformingObjectCanBeDelegate {
    id <StackOverflowManagerDelegate> delegate = [MockStackOverflowManagerDelegate new];
    XCTAssertNoThrow(mgr.delegate = delegate, @"Object conforming to the delegate protocol should be used as delegate");
}

- (void)testManagerAcceptsNilAsADelegate {
    XCTAssertNoThrow(mgr.delegate = nil, @"It should be acceptable to use nil as an object's delegate");
}

@end
