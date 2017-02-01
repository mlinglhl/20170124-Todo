//
//  DetailViewController.m
//  20170124 Todo
//
//  Created by Minhung Ling on 2017-01-24.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDoObject+CoreDataClass.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)configureView {
        self.title = self.todo.title;
        self.priorityLabel.text = [NSString stringWithFormat:@"Priority: %hd", self.todo.priority];
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
