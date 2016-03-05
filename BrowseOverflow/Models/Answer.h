//
//  Answer.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/5/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Answer : NSObject
@property (nonatomic) NSString *text;
@property (nonatomic) Person *person;
@property (nonatomic) NSInteger score;
@property (nonatomic, getter=isAccepted) BOOL accepted;

- (NSComparisonResult)compare:(Answer *)otherAnswer;
@end
