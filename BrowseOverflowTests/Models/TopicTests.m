//
//  TopicTests.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Topic.h"

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

@end
