//
//  SHHomeController.m
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHHomeController.h"
#import "SHHomeCell.h"

@interface SHHomeController ()

@end

@implementation SHHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"My Home";
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else if(indexPath.section == 1){
        return 280;
    }else if(indexPath.section == 2){
        return 100;
    }else{
        return 75;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SHHomeCell *cell = [SHHomeCell creatCell:(SHHomeCellType)indexPath.section];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 3) {        
    }
}

- (NSInteger)getIndexWithIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section;
}


@end
