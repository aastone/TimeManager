//
//  TMItemModel.m
//  TimeManager
//
//  Created by stone on 14-3-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "TMItemModel.h"

@implementation TMItemModel

@synthesize duration;

- (void)setContent:(NSString *)m_content
{
    content = m_content;
}

- (NSString *)content
{
    return content;
}

@end
