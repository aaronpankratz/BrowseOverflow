//
//  Answer.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/5/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "Answer.h"
#import "Person.h"

@implementation Answer
@synthesize accepted;
@synthesize score;

- (NSComparisonResult)compare:(Answer *)otherAnswer {
    if (accepted && !(otherAnswer.accepted)) {
        return NSOrderedAscending;
    }
    else if (!accepted && otherAnswer.accepted) {
        return NSOrderedDescending;
    }
    if (score > otherAnswer.score) {
        return NSOrderedAscending;
    }
    else if (score < otherAnswer.score) {
        return NSOrderedDescending;
    }
    else {
        return NSOrderedSame;
    }
}

@end
