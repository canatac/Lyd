//
//  User.h
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface User : NSObject
-(void)getUser;//:completion:(void (^)(UserModel* result))completionHandler;
-(NSArray<UserModel>*)map:(NSDictionary*)json;
@end
