//
//  PersonTests.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/2/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase {
    Person *person;
}

@end

@implementation PersonTests

- (void)setUp {
    [super setUp];
    person = [[Person alloc] initWithName:@"Graham Bell"
                           avatarLocation:@"http://example.com/avatar.png"];
}

- (void)tearDown {
    person = nil;
    [super tearDown];
}

- (void)testThatPersonHasTheRightName {
    XCTAssertEqualObjects(person.name, @"Graham Bell", @"expecting a person to provide its name");
}

- (void)testThatPersonHasAnAvatarURL {
    NSURL *url = person.avatarURL;
    XCTAssertEqualObjects([url absoluteString], @"http://example.com/avatar.png", @"The person's avatar should be represented by a URL");
}

@end
