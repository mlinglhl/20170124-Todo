//
//  ToDoTableViewCell.h
//  20170124 Todo
//
//  Created by Minhung Ling on 2017-01-24.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *preview;
@property (weak, nonatomic) IBOutlet UILabel *priority;

@end
