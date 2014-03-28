//
//  TMRootViewController.m
//  TimeManager
//
//  Created by wangyipu on 14-3-17.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "TMRootViewController.h"
#import "TMItemCell.h"
#import "TMItem.h"
#import "TMItemFrame.h"

@interface TMRootViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_allItemsFrame;
}

@end

@implementation TMRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - scroll

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.contentOffset.y < 0) {
        [self addContent];
    }
}


#pragma mark - Add Content

- (void)addContent
{
    NSLog(@"addContent");
}


#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([tableView isEqual:self.tableView]) {
        NSLog(@"table");
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableViewCellIdentifier = @"Cell";
    UITableViewCell *cell = nil;
    
    BOOL nibRegistered = NO;
    if (!nibRegistered) {
        UINib *nib = [UINib nibWithNibName:@"TMRootViewController" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:tableViewCellIdentifier];
        nibRegistered = YES;
    }
    
    if ([tableView isEqual:self.tableView]) {
        cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"section %ld, cell %ld", (long)indexPath.section, (long)indexPath.row];
    }
    return cell;
}

@end
