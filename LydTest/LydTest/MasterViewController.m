//
//  MasterViewController.m
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "UserModel.h"
#import "User.h"
#import "MyCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property NSArray<UserModel> *users;
@property NSUserDefaults *userDefaults;
@property id observer;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    self.addUser;
    
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    [[NSNotificationCenter defaultCenter] removeObserver:self.observer];
    self.observer = nil;
    
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    self.addUser;
    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];

    UserModel *object = self.objects[indexPath.row];
    cell.firstName.text = object.name.first;
    cell.lastName.text = object.name.last;
    cell.email.text = object.email;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)addUser{

    
    [[User alloc]init].getUser;
    
    self.observer = [
     [NSNotificationCenter defaultCenter]
     addObserverForName:@"DATA_RECEIVED"
     object:nil
     queue:[NSOperationQueue mainQueue]
     usingBlock:^(NSNotification *notification)
     {
         [[NSNotificationCenter defaultCenter] removeObserver:self name:@"DATA_RECEIVED" object:nil];

         NSLog(@"Notification received! : %@", notification.object);
         NSArray *newUsers = [[[User alloc]init] map:(NSDictionary*)notification.object];
         for (UserModel *user in newUsers){
             [self.objects insertObject:user atIndex:0];
         }
         [self.tableView reloadData];
     }
     ];

}


@end
