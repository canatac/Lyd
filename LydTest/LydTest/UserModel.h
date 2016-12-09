//
//  UserModel.h
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "IdModel.h"
#import "LocationModel.h"
#import "LoginModel.h"
#import "NameModel.h"
#import "PictureModel.h"

@protocol UserModel;

@interface UserModel : JSONModel
@property (nonatomic) NSString      *gender;
@property (nonatomic) NameModel     *name;
@property (nonatomic) LocationModel *location;
@property (nonatomic) NSString      *email;
@property (nonatomic) LoginModel    *login;
@property (nonatomic) NSString      *registered;
@property (nonatomic) NSString      *phone;
@property (nonatomic) NSString      *cell;
@property (nonatomic) IdModel       *id;
@property (nonatomic) PictureModel  *picture;
@property (nonatomic) NSString      *nat;

@end
