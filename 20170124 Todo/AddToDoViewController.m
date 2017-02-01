//
//  addToDoViewController.m
//  20170124 Todo
//
//  Created by Minhung Ling on 2017-01-24.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "AddToDoViewController.h"
#import "DataManagerSingleton.h"

@interface AddToDoViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionField;
@property ToDo* todoHolder;
@property NSInteger todoPriority;

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _todoHolder = [ToDo new];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)setPriority:(UIButton *)sender {
    for (UIButton *button in self.buttons) {
        button.backgroundColor = nil;
    }
    sender.backgroundColor = [UIColor greenColor];
    self.todoPriority = sender.tag;
}

- (IBAction)addItem:(UIButton *)sender {
    DataManagerSingleton *manager = [DataManagerSingleton sharedManager];
    NSManagedObjectContext *context = manager.persistentContainer.viewContext;
    ToDoObject *newToDo = [[ToDoObject alloc] initWithContext:context];
    newToDo.title = self.titleField.text;
    newToDo.todoDescription = self.descriptionField.text;
    if (self.todoPriority) {
        newToDo.priority = self.todoPriority;
    }
    if (newToDo.title.length > 0) {
        [manager saveContext];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
