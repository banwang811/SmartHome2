//
//  SHAboutController.m
//  SmartHome
//
//  Created by banwang on 16/1/29.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHAboutController.h"
#import "SHAboutCell.h"

@interface SHAboutController ()

@property (nonatomic, strong) NSArray           *headImages;

@property (nonatomic, strong) NSArray           *nameTitles;

@property (nonatomic, strong) NSArray           *content;

@end

@implementation SHAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.scrollEnabled = NO;
    [self setleftBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (instancetype)init{
    if (self = [super init]) {
        self.headImages = [NSArray arrayWithObjects:@"website",@"phone",@"qq",@"wechat", nil];
        self.nameTitles = [NSArray arrayWithObjects:@"官网",@"电话热线",@"售后QQ", @"微信公众号",nil];
        self.content = [NSArray arrayWithObjects:@"www.huajun.com",@"400-678-3235",@"2534136486",@"HomeStyle", nil];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 14;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 3) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHAboutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHCellType_normal"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHMineCell" owner:self options:0] firstObject];
    }
    cell.iconImage.image = [UIImage imageNamed:[self.headImages objectAtIndex:[self getIndexWithIndexPath:indexPath]]];
    cell.nameLabel.text = [self.nameTitles objectAtIndex:[self getIndexWithIndexPath:indexPath]];
    cell.content.text = [self.content objectAtIndex:[self getIndexWithIndexPath:indexPath]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)getIndexWithIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section;
}


@end
