//
//  StackOverflowCommunicator.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/9/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackOverflowCommunicator : NSObject
- (void)searchForQuestionsWithTag:(NSString *)tag;
@end
