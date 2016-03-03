//
//  Question.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property (nonatomic) NSDate *date;
@property (nonatomic) NSUInteger score;
@property (nonatomic) NSString *title;
@end
