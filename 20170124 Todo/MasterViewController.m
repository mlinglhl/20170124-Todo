//
//  MasterViewController.m
//  20170124 Todo
//
//  Created by Minhung Ling on 2017-01-24.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDoTableViewCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    NSArray *array =  @[
                        [[ToDo alloc] initWithTitle:@"Walk" description:@"Go for a walk" priority:2],
                        [[ToDo alloc] initWithTitle:@"Run" description:@"Go for a run" priority:2],
                        [[ToDo alloc] initWithTitle:@"Jog" description:@"Go for a jog. What happens if description is super huge? Like way longer than a couple of words. Will the system handle it? Is everything just awful forever?\n:(" priority:3],
                        [[ToDo alloc] initWithTitle:@"Cook" description:@"Go cook" priority:5],
                        [[ToDo alloc] initWithTitle:@"Sleep" description:@"Go to sleep" priority:5]
                        ];
    self.objects = [NSMutableArray arrayWithArray:array];
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    ToDo *todo = self.objects[indexPath.row];
    cell.title.text = todo.title;
    cell.preview.text = todo.todoDescription;
    cell.priority.text = [NSString stringWithFormat:@"%ld", todo.priority];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - Delegate methods
- (void) addToDo {
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *todo = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.todo = todo;
    }
    
    if ([[segue identifier] isEqualToString:@"newTodo"]) {
        AddToDoViewController *vc = segue.destinationViewController;
        vc.todo = ^(ToDo* addTodo) {
            [self.objects addObject: addTodo];
            [self.tableView reloadData];
        };
    }
}

@end
