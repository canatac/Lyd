//
//  NameModel.h
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol NameModel;

@interface NameModel : JSONModel
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *first;
@property (nonatomic) NSString *last;
@end
