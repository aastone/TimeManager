//
//  TMItemModel.h
//  TimeManager
//
//  Created by stone on 14-3-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMItemModel : NSObject
{
    NSString *content;
}

- (void) setContent:(NSString *)m_content;
- (NSString *) content;

@property NSInteger duration;

@end
