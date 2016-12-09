//
//  ResultModel.h
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "UserModel.h"

@protocol ResultModel;

@interface ResultModel : JSONModel
@property(nonatomic,strong) NSArray<UserModel> *results;
@end
