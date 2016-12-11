//
//  DetailViewController.h
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) UserModel *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

