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
#import "DataManagerSingleton.h"
#import "ToDoObject+CoreDataProperties.h"

@interface MasterViewController ()
@property DataManagerSingleton *manager;
@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.manager = [DataManagerSingleton sharedManager];
    self.manager.tableView = self.tableView;
    self.tableView.dataSource = self.manager;
    self.manager.managedObjectContext = self.manager.persistentContainer.viewContext;
    
//    UISwipeGestureRecognizer *sgr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(strikeOutText:)];
//    [sgr setDirection:UISwipeGestureRecognizerDirectionRight];
//    [self.tableView addGestureRecognizer:sgr];
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

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDoObject *todo = [self.manager.fetchedResultsController objectAtIndexPath:indexPath];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.todo = todo;
    }
}
//
//- (IBAction)strikeOutText:(UISwipeGestureRecognizer *)sender {
//    CGPoint swipe = [sender locationInView:self.view];
//    NSIndexPath *index = [self.tableView indexPathForRowAtPoint:swipe];
//    ToDoTableViewCell *cell = [self.tableView cellForRowAtIndexPath:index];
//    ToDo *todo = self.objects[index.row];
//    todo.isComplete = YES;
//    cell.title.attributedText = [self strikeOutString:todo.title];
//    cell.preview.attributedText = [self strikeOutString:todo.todoDescription];
//}

//- (NSAttributedString *) strikeOutString:(NSString*)oldString {
//    NSMutableAttributedString *strikeOutText = [[NSMutableAttributedString alloc] initWithString:oldString];
//    [strikeOutText addAttribute:NSStrikethroughStyleAttributeName value:@2 range: NSMakeRange(0, strikeOutText.length)];
//    return strikeOutText;
//}

@end
