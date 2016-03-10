//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/6/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import "StackOverflowManager.h"

@implementation StackOverflowManager
@synthesize delegate;

- (void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate {
    if (newDelegate != nil
        && ![newDelegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException
                                 reason:@"Delegate object does not conform to the delegate protocol"
                               userInfo:nil] raise];
    }
    delegate = newDelegate;
}

@end
