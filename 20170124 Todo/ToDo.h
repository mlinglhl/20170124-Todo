//
//  ToDo.h
//  20170124 Todo
//
//  Created by Minhung Ling on 2017-01-24.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property NSString *title;
@property NSString *todoDescription;
@property NSInteger priority;
@property BOOL isComplete;

- (instancetype)initWithTitle: (NSString *) title description:(NSString *) description priority: (NSInteger) priority;

@end
