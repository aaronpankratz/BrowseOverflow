//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by Aaron Pankratz on 3/6/16.
//  Copyright © 2016 Aaron Pankratz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StackOverflowManagerDelegate <NSObject>

@end


@interface StackOverflowManager : NSObject
@property (weak, nonatomic) id <StackOverflowManagerDelegate> delegate;
@end
