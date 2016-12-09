//
//  LocationModel.h
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol LocationModel;


@interface LocationModel : JSONModel
@property (nonatomic) NSString *street;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *state;
@property (nonatomic) NSString *postcode;
@end
