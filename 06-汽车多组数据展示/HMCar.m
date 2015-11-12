//
//  HMCar.m
//  06-汽车多组数据展示
//
//  Created by Apple on 15/6/18.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "HMCar.h"

@implementation HMCar

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)carWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
