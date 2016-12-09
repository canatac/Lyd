//
//  LoginModel.h
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol LoginModel;


@interface LoginModel : JSONModel
@property (nonatomic) NSString *username;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *salt;
@property (nonatomic) NSString *md5;
@property (nonatomic) NSString *sha1;
@property (nonatomic) NSString *sha256;
@end
