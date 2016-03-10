//
//  MockStackOverflowCommunicator.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/9/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MockStackOverflowCommunicator : NSObject
- (BOOL)wasAskedToFetchQuestions;
@end
