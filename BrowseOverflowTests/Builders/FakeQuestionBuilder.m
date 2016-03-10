//
//  FakeQuestionBuilder.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/9/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "FakeQuestionBuilder.h"

@implementation FakeQuestionBuilder

@synthesize JSON;
@synthesize arrayToReturn;
@synthesize errorToSet;

- (NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError *__autoreleasing *)error {
    self.JSON = objectNotation;
    *error = errorToSet;
    return arrayToReturn;
}

@end
