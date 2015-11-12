//
//  HMCarGroup.h
//  06-汽车多组数据展示
//
//  Created by Apple on 15/6/18.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HMCarGroup : NSObject
/**
 *  所有汽车
 */
@property(nonatomic,strong) NSArray *cars;
/**
 *  组标题
 */
@property(nonatomic,copy)NSString *title;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carGroupWithDict:(NSDictionary *)dict;
+(NSArray *)carGroups;
@end
