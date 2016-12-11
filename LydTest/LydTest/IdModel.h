//
//  IdModel.h
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@protocol IdModel;

@interface IdModel : JSONModel
@property (nonatomic) NSString <Optional> *name;
@property (nonatomic) NSString <Optional> *value;
@end
