//
//  PictureModel.h
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol PictureModel;

@interface PictureModel : JSONModel
@property (nonatomic) NSString *large;
@property (nonatomic) NSString *medium;
@property (nonatomic) NSString *thumbnail;
@end
