//
//  SHSceneController.m
//  SmartHome
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 huajun. All rights reserved.
//

#import "SHSceneController.h"
#import "SHSceneCell.h"
#import "SHModelController.h"

@interface SHSceneController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView             *collectionView;

@property (nonatomic, strong) NSMutableArray               *dataArray;

@property (nonatomic, strong) UIBarButtonItem              *addItem;

@property (nonatomic, strong) UIBarButtonItem              *editItem;

@property (nonatomic, assign) BOOL                         isEdit;

@end

@implementation SHSceneController

- (instancetype)init{
    if (self = [super init]) {
        self.dataArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"情景模式";
    [self.view addSubview:self.collectionView];
    self.navigationItem.rightBarButtonItem = self.addItem;
    self.navigationItem.leftBarButtonItem = self.editItem;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadData];
}

- (UIBarButtonItem *)addItem{
    if (_addItem == nil) {
        _addItem = [[UIBarButtonItem alloc] initWithTitle:@"添加"
                                                    style:UIBarButtonItemStylePlain
                                                   target:self
                                                   action:@selector(addScene)];
        _addItem.tintColor = [UIColor whiteColor];
    }
    return _addItem;
}

- (UIBarButtonItem *)editItem{
    if (_editItem == nil) {
        _editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑"
                                                    style:UIBarButtonItemStylePlain
                                                   target:self
                                                   action:@selector(editScene)];
        _editItem.tintColor = [UIColor whiteColor];
    }
    return _editItem;
}

- (void)addScene{
    
}

- (void)editScene{
    self.isEdit = !self.isEdit;
    if (self.isEdit) {
        _editItem.title = @"完成";
    }else{
        _editItem.title = @"编辑";
    }
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout =  [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[SHSceneCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataArray count];
}

//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SHSceneModel *model = [self.dataArray objectAtIndex:indexPath.row];
    static NSString *identify = @"cell";
    SHSceneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[SHSceneModel getSceneIcon:model.type]];
    cell.titleLabel.text = model.name;
    cell.editImage.hidden = !self.isEdit;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //边距占5*4=20 ，2个
    //图片为正方形，边长：(fDeviceWidth-20)/2-5-5 所以总高(fDeviceWidth-20)/2-5-5 +20+30+5+5 label高20 btn高30 边
    return CGSizeMake((SCREEN_WIDTH - 15)/2, (SCREEN_WIDTH - 15)/2);
}

//定义每个UICollectionView 的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SHSceneModel *model = [self.dataArray objectAtIndex:indexPath.row];
    if (self.isEdit) {
        SHModelController *controller = [[SHModelController alloc] init];
        controller.hidesBottomBarWhenPushed = YES;
        controller.navigationItem.title = model.name;
        controller.model = model;
        [self.navigationController pushViewController:controller animated:YES];
    }else{
        [self executeScene:model];
    }
}

//返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)reloadData{
    [[SHHTTPManager shareManager] requestSceneWithParas:nil success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSLog(@"%@",dict);
        if ([[dict objectForKey:@"error"] integerValue] == 0) {
            [self.dataArray removeAllObjects];
            NSArray *scenes = [dict objectForKey:@"scenes"];
            for (NSDictionary *info in scenes) {
                SHSceneModel *model = [[SHSceneModel alloc] init];
                [model setValuesForKeysWithDictionary:info];
                model.sceneID = [info objectForKey:@"id"];
                model.type = (SHSceneType)[[info objectForKey:@"default_icon"] intValue];
                [self.dataArray addObject:model];
                [self.collectionView reloadData];
            }
            for (SHSceneModel *model in self.dataArray) {
                NSLog(@"%@%d\n",model.name,(int)model.type);
            }
        }
    } failure:^(NSError *error) {
        
    }];
}

- (void)executeScene:(SHSceneModel *)model{
    [SHProgress showProgress:@"执行中..." toView:self.view];
    NSDictionary *params = @{@"sceneID":model.sceneID};
    [[SHHTTPManager shareManager] requestOperateDeviceWithParas:params success:^(id responseObject) {
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([[result objectForKey:@"error"] intValue] == 0) {
            //成功执行
        }
        [SHProgress hideProgress:self.view animated:YES];
    } failure:^(NSError *error) {
        [SHProgress hideProgress:self.view animated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
