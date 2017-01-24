//
//  DetailViewController.m
//  20170124 Todo
//
//  Created by Minhung Ling on 2017-01-24.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)configureView {
    // Update the user interface for the detail item.
        self.title = self.todo.title;
        self.priorityLabel.text = [NSString stringWithFormat:@"Priority: %ld", self.todo.priority];
        self.descriptionLabel.text = self.todo.todoDescription;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
