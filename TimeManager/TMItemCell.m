//
//  TMItemCell.m
//  TimeManager
//
//  Created by stone on 14-3-18.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "TMItemCell.h"
#import "TMItem.h"
#import "TMItemFrame.h"

@interface TMItemCell()
{
    UIButton *_contentBtn;
}

@end

@implementation TMItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        _contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _contentBtn.titleLabel.font = kContentFont;
        _contentBtn.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentBtn];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setItemFrame:(TMItemFrame *)itemFrame
{
    _itemFrame = itemFrame;
    TMItem *item = _itemFrame.item;
    
    [_contentBtn setTitle:item.content forState:UIControlStateNormal];
    _contentBtn.contentEdgeInsets = UIEdgeInsetsMake(kContentTop, kContentLeft, kContentBottom, kContentRight);
    _contentBtn.frame = _itemFrame.contentF;
}

@end
