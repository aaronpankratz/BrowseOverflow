//
//  Question.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Answer;

@interface Question : NSObject {
    NSMutableSet *answerSet;
}

@property (retain) NSDate *date;
@property (copy) NSString *title;
@property NSUInteger score;
@property (readonly) NSArray *answers;

- (void)addAnswer:(Answer *)answer;

@end
