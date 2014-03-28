//
//  TMItem.m
//  TimeManager
//
//  Created by wangyipu on 14-3-18.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "TMItem.h"

@implementation TMItem

- (void)setDict:(NSDictionary *)dict
{
    _dict = dict;
    
    self.content = dict[@"content"];
    self.type = [dict[@"type"] intValue];
}

@end
