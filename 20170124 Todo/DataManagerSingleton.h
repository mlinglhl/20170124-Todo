//
//  DataManagerSingleton.h
//  20170124 Todo
//
//  Created by Minhung Ling on 2017-02-01.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ToDoObject+CoreDataClass.h"
@class ToDoTableViewCell;

@interface DataManagerSingleton : NSObject <NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) NSFetchedResultsController<ToDoObject *> *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) UITableView *tableView;

+ (id)sharedManager;
- (void)saveContext;
- (ToDoTableViewCell *) configureCell: (ToDoTableViewCell*) cell withIndexPath: (NSIndexPath*)indexPath;@end
