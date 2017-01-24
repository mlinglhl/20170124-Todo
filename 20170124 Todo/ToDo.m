//
//  ToDo.m
//  20170124 Todo
//
//  Created by Minhung Ling on 2017-01-24.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle: (NSString *) title description:(NSString *) toDoDescription priority: (NSInteger) priority
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = toDoDescription;
        _priority = priority;
        _isComplete = NO;
    }
    return self;
}

@end
