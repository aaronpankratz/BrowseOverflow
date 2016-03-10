//
//  FakeQuestionBuilder.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/9/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "QuestionBuilder.h"

@class Question;

@interface FakeQuestionBuilder : QuestionBuilder
@property (copy) NSString *JSON;
@property (copy) NSArray *arrayToReturn;
@property (copy) NSError *errorToSet;
@end
