//
//  Person.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/2/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSURL *avatarURL;

- (instancetype)initWithName:(NSString *)aName
              avatarLocation:(NSString *)location;
@end
