//
//  TMItem.h
//  TimeManager
//
//  Created by wangyipu on 14-3-18.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    TMItemTypeCurrent = 0,
    TMItemTypePast = 1
}TMItemType;

@interface TMItem : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) TMItemType type;

@property (nonatomic, copy) NSDictionary *dict;
@end
