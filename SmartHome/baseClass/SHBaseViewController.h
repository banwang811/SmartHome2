//
//  SHBaseViewController.h
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHBaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView              *tableView;

- (void)setleftBarItem;

@end
