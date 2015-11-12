//
//  ViewController.m
//  06-汽车多组数据展示
//
//  Created by Apple on 15/6/18.
//  Copyright (c) 2015年 All rights reserved.
//

#import "ViewController.h"
#import "HMCarGroup.h"
#import "HMCar.h"
/**
 *  思路：
 1> 加载数据
 2> 创建tableView，遵循数据源协议
 3> 实现对应数据源方法，根据模型数据返回对应cell
 */
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  汽车数据
 */
@property(nonatomic,strong) NSArray *carGroups;

@property(nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (UITableView *)tableView {
    if (_tableView == nil) {
        // 创建表格
        _tableView = [[UITableView alloc] init];
        // 设置frame
        _tableView.frame = self.view.bounds;
        // 设置数据源
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView setSeparatorColor:[UIColor redColor]];
        // 设置行高
        _tableView.rowHeight = 70;
        
        // 设置分组索引颜色
//        _tableView.sectionIndexColor = [UIColor greenColor];
//        _tableView.sectionIndexBackgroundColor = [UIColor brownColor];
//        _tableView.sectionIndexTrackingBackgroundColor = [UIColor yellowColor];
        
//        _tableView.sectionIndexMinimumDisplayRowCount = 100;
        
    }
    return _tableView;
}

/**
 *  懒加载汽车数据
 */
- (NSArray *)carGroups {
    if (_carGroups == nil) {
        _carGroups = [HMCarGroup carGroups];
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 将tableView添加到控制器的view上面
    UIImageView * imv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"m_10_100"]];
    [imv sizeToFit];
    imv.center = self.view.center;
    [self.view addSubview:imv];
    

        [UIView animateWithDuration:2.0f delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            imv.alpha = 0.0f;
            imv.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5f, 1.5f, 1.0f);
        } completion:^(BOOL finished) {
            //        [self.tableView removeFromSuperview];
            imv.alpha = 1;
        
        }];

//    });
    //    [NSThread sleepForTimeInterval:3];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        imv.layer.transform = CATransform3DIdentity;
        [imv removeFromSuperview];
        [self.view addSubview:self.tableView];
    });
}

#pragma mark - tableView数据源方法
/**
 *  返回多少组数据
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carGroups.count;
}
/**
 *  返回第section组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 根据section获得组模型
    HMCarGroup *group = self.carGroups[section];
    // 获得对应汽车数组
    NSArray *cars = group.cars;
    return cars.count;
}
/**
 *  返回每一行要显示的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 声明id
    static NSString *ID = @"car";
    // 根据id去缓存池里面找对应的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 如果没有找到，则创建一个cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 设置cell的数据
    // 根据indexPath获得组号
    NSInteger section = indexPath.section;
    // 根据indexPath获得行号
    NSInteger row = indexPath.row;
    // 根据section获得对应的组模型数据
    HMCarGroup *group = self.carGroups[section];
    // 获得对应汽车数组
    NSArray *cars = group.cars;
    // 根据row获得对应的汽车模型
    HMCar *car = cars[row];
    // 设置数据
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    // 返回对应cell
    return cell;
}
/**
 *  返回第section组对应的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // 根据section获得对应的组模型
    HMCarGroup *group = self.carGroups[section];
    return group.title;
}
/**
 *  返回分组索引数组
 */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    /*
    NSMutableArray *indexs = [NSMutableArray array];
    for(HMCarGroup *group in self.carGroups) {
        [indexs addObject:group.title];
    }
    */
    return [self.carGroups valueForKeyPath:@"title"];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
