//
//  HMCarGroup.m
//  06-汽车多组数据展示
//
//  Created by Apple on 15/6/18.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "HMCarGroup.h"
#import "HMCar.h"
@implementation HMCarGroup

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        // 创建数组装汽车模型
        NSMutableArray *cars = [NSMutableArray array];
        // 将字典转换成汽车模型
        for (NSDictionary *dict in self.cars) {
            // 创建汽车模型
            HMCar *car = [HMCar carWithDict:dict];
            // 添加到数组
            [cars addObject:car];
        }
        // 重新赋值
        self.cars = cars;
    }
    return self;
}
+(instancetype)carGroupWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)carGroups{
    // 获得文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
    // 获得数据
    NSArray *carArray = [NSArray arrayWithContentsOfFile:filePath];
    
    // 创建模型数组
    NSMutableArray *groups = [NSMutableArray array];
    
    for (NSDictionary *dict in carArray) {
        // 创建模型
        HMCarGroup *car = [HMCarGroup carGroupWithDict:dict];
        
        [groups addObject:car];
    }
    return groups;
}
@end
