//
//  TMItemFrame.m
//  TimeManager
//
//  Created by wangyipu on 14-3-18.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "TMItemFrame.h"
#import "TMItem.h"

@implementation TMItemFrame

- (void)setItem:(TMItem *)item
{
    _item = item;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    
    CGFloat iconX = kMargin;
    CGFloat iconY = CGRectGetMaxY(_timeF) + kMargin;
    _iconF = CGRectMake(iconX, iconY, kIconWH, kIconWH);
    
    CGFloat contentX = kMargin;
    CGFloat contentY = kMargin;
    _contentF = CGRectMake(contentX, contentY, kContentLeft + kContentRight, kContentTop + kContentBottom);
    
    _cellHeight = MAX(CGRectGetMaxY(_contentF), CGRectGetMaxY(_iconF)) + kMargin;
}

@end
