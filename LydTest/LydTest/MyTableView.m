//
//  MyTableView.m
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import "MyTableView.h"

@implementation MyTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(long)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(long)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    if (section == 1) {
        return 4;
    }
    if (section == 2) {
        return 6;
    }
    if (section == 3) {
        return 2;
    }
    if (section == 4) {
        return 3;
    }
    
    return 0;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    if (indexPath.section == 0) {
        if (indexPath.row == 0){
            cell.textLabel.text = self.user.name.title;
        }
        if (indexPath.row == 1){
            cell.textLabel.text = self.user.name.first;
        }
        if (indexPath.row == 2){
            cell.textLabel.text = self.user.name.last;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0){
            cell.textLabel.text = self.user.location.street;
        }
        if (indexPath.row == 1){
            cell.textLabel.text = self.user.location.city;
        }
        if (indexPath.row == 2){
            cell.textLabel.text = self.user.location.state;
        }
        if (indexPath.row == 3){
            cell.textLabel.text = self.user.location.postcode;
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0){
            cell.textLabel.text = self.user.login.username;
        }
        if (indexPath.row == 1){
            cell.textLabel.text = self.user.login.password;
        }
        if (indexPath.row == 2){
            cell.textLabel.text = self.user.login.salt;
        }
        if (indexPath.row == 3){
            cell.textLabel.text = self.user.login.md5;
        }
        if (indexPath.row == 4){
            cell.textLabel.text = self.user.login.sha1;
        }
        if (indexPath.row == 5){
            cell.textLabel.text = self.user.login.sha256;
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0){
            cell.textLabel.text = self.user.id.name;
        }
        if (indexPath.row == 1){
            cell.textLabel.text = self.user.id.value;
        }
    }
    if (indexPath.section == 4) {
        if (indexPath.row == 0){
            cell.textLabel.text = self.user.picture.large;
        }
        if (indexPath.row == 1){
            cell.textLabel.text = self.user.picture.medium;
        }
        if (indexPath.row == 2){
            cell.textLabel.text = self.user.picture.thumbnail;
        }
    }
    
    
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Name";
    }
    if (section == 1) {
        return @"Location";
    }
    if (section == 2) {
        return @"Login";
    }
    if (section == 3) {
        return @"Id";
    }
    if (section == 4) {
        return @"Picture";
    }
    return @"No Value";
}

@end
