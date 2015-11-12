//
//  HMCar.h
//  06-汽车多组数据展示
//
//  Created by Apple on 15/6/18.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMCar : NSObject
/**
 *  图标
 */
@property(nonatomic,copy)NSString *icon;
/**
 *  车名
 */
@property(nonatomic,copy)NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carWithDict:(NSDictionary *)dict;

@end
