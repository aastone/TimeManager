//
//  TMItemFrame.h
//  TimeManager
//
//  Created by wangyipu on 14-3-18.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#define kMargin 10 //间隔
#define kIconWH 40 //头像宽高
#define kContentW 180 //内容宽度

#define kTimeMarginW 15 //时间文本与边框间隔宽度方向
#define kTimeMarginH 10 //时间文本与边框间隔高度方向

#define kContentTop 10 //文本内容与按钮上边缘间隔
#define kContentLeft 25 //文本内容与按钮左边缘间隔
#define kContentBottom 15 //文本内容与按钮下边缘间隔
#define kContentRight 15 //文本内容与按钮右边缘间隔

#define kTimeFont [UIFont systemFontOfSize:12] //时间字体
#define kContentFont [UIFont systemFontOfSize:16] //内容字体

#import <Foundation/Foundation.h>

@class TMItem;

@interface TMItemFrame : NSObject

@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign, readonly) CGRect timeF;
@property (nonatomic, assign, readonly) CGRect contentF;

@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong) TMItem *item;

@property (nonatomic, assign) BOOL showTime;

@end
