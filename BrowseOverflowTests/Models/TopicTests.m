//
//  TopicTests.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Topic.h"

@interface TopicTests : XCTestCase

@end

@implementation TopicTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatTopicExists {
    Topic *newTopic = [Topic new];
    XCTAssertNotNil(newTopic, @"should be able to create a Topic instance");
}

@end
