//
//  TMRootTableViewController.h
//  TimeManager
//
//  Created by stone on 14-3-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMItemModel.h"
#import "TMDetailViewController.h"

@interface TMRootTableViewController : UITableViewController<TMDetailViewControllerDelegate>
{
    NSString *passdata;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *blurredImageView;

@property (nonatomic, assign) CGFloat screenHeight;

@end
