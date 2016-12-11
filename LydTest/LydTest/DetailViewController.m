//
//  DetailViewController.m
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import "DetailViewController.h"
#import "MyTableView.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet MyTableView *tableView;

@end

@implementation DetailViewController 

- (void)configureView {
    // Update the user interface for the detail item.
    self.tableView.user = self.detailItem;
    self.tableView.dataSource = self.tableView;
    self.tableView.delegate = self.tableView;
    if (self.detailItem) {
        self.detailDescriptionLabel.text =
        [NSString stringWithFormat:@"%@ - %@, %@",self.detailItem.email,self.detailItem.name.first,self.detailItem.name.last ];
    }
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


#pragma mark - Managing the detail item

- (void)setDetailItem:(UserModel *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
