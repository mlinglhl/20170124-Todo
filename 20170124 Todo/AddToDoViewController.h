//
//  addToDoViewController.h
//  20170124 Todo
//
//  Created by Minhung Ling on 2017-01-24.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface AddToDoViewController : UIViewController
@property (copy) void(^todo)(ToDo *addTodo);
- (IBAction)addItem:(UIButton *)sender;
@end
