//
//  Topic.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/1/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject
@property (readonly) NSString *name;

- (instancetype)initWithName:(NSString *)newName;
@end
