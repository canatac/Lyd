//
//  User.m
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import "User.h"
#import "Server.h"
#import "UserModel.h"
#import "ResultModel.h"

@implementation User

-(void)getUser{
    [[Server alloc]init].getData;
}

-(NSArray<UserModel>*)map:(NSDictionary*)json {
    
    NSError *error;
    ResultModel *result = [[ResultModel alloc] initWithDictionary:json error:&error];
    
    if (error != nil){
        NSLog(@"RESULTS Error : %@", error);
    }

    NSMutableArray<UserModel> *users = [[NSMutableArray<UserModel> alloc]init];
    
    for (UserModel* userModel in result.results) {
        [users addObject:userModel];
    }
    
    return [users copy];
}


@end
