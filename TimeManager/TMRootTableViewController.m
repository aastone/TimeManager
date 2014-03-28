//
//  TMRootTableViewController.m
//  TimeManager
//
//  Created by stone on 14-3-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "TMRootTableViewController.h"

@interface TMRootTableViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    NSInteger rowsInSection;
    NSMutableDictionary *itemsInfo;
    NSArray *itemContent;
    NSMutableArray *itemTimeStart;
    TMItemModel *sub;
    NSInteger itemCount;
}

@end

@implementation TMRootTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    itemCount = 0;
    itemTimeStart = [NSMutableArray arrayWithObjects:@"2014-03-27",nil];
    // 1
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIImage *background = [UIImage imageNamed:@"bg1"];
    
    // 2
    self.backgroundImageView = [[UIImageView alloc] initWithImage:background];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.backgroundImageView];
    
    // 3
    self.blurredImageView = [[UIImageView alloc] init];
    self.blurredImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.blurredImageView.alpha = 0;
//    [self.blurredImageView setImage:<#(UIImage *)#>]
    [self.view addSubview:self.blurredImageView];
    
    // 4
    [self textFieldInit];
    [self tableViewInit];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    TMItemModel *item1 = [TMItemModel new];
    TMItemModel *item2 = [TMItemModel new];
    TMItemModel *item3 = [TMItemModel new];
    TMItemModel *item4 = [TMItemModel new];
    
    itemsInfo = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                 item1, @"item1",
                 item2, @"item2",
                 item3, @"item3",
                 item4, @"item4",
                 nil];
    
    sub = [itemsInfo objectForKey:@"item1"];
    if (sub !=nil) {
        [sub setContent:@"jhgjhgjh"];
        [sub setDuration:99];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text Field

- (void)textFieldInit
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(160, 300, 111, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"placeholder";
    [self.view addSubview:textField];
    textField.delegate = self;
}

#pragma mark - Scroll view
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.tableView.contentOffset.y < 0) {
        [self addNewItem];
    }
}

#pragma mark - Add New Item

- (void)addTimeLine
{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatterDate = [[NSDateFormatter alloc] init];
    NSDateFormatter *formatterTime = [[NSDateFormatter alloc] init];
    [formatterDate setDateFormat:@"yyyy-MM-dd"];
    [formatterTime setDateFormat:@"HH:mm:ss"];
    
//    NSString *currentDate = [formatterDate stringFromDate:date];
    NSString *currentTime = [formatterTime stringFromDate:date];
    
    [itemTimeStart addObject:currentTime];
    
//    NSLog(@"%@",itemTimeStart[itemCount]);
    
    itemCount++;
//    NSLog(@"%ld",(long)itemCount);
}

- (void)addNewItem
{
    rowsInSection = rowsInSection + 1;
    [self addTimeLine];
    [self.tableView reloadData];
}

#pragma mark - Table view init

- (void)tableViewInit
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    self.tableView.pagingEnabled = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //    [self.view addSubview:self.tableView];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return rowsInSection + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"section %ld, cell %ld", (long)indexPath.section, (long)indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", itemTimeStart[rowsInSection - indexPath.row]];

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 220, 15)];
    titleLabel.tag = 03;
    
    
    
//    titleLabel.text = [NSString stringWithFormat:@"%@ %@", currentDate, currentTime];
    
    titleLabel.textColor = [UIColor blackColor];
//    [cell.contentView addSubview:titleLabel];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", currentDate, currentTime];
    
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create the next view controller.
    TMDetailViewController *detailViewController = [[TMDetailViewController alloc] initWithNibName:@"TMDetailViewController" bundle:nil];
    detailViewController.isSomethingEnabled = YES;
    detailViewController.delegate = self;
    detailViewController.title = @"Detail";
    
    passdata = [[NSString alloc] initWithFormat:@"%@",[itemTimeStart objectAtIndex:indexPath.row]];
    
    detailViewController.listArray = [[NSMutableArray alloc] initWithObjects:passdata, nil];
    [self.navigationController pushViewController:detailViewController animated:YES];

}

- (void)addItemViewController:(TMDetailViewController *)controller didFinishEnteringItem:(NSString *)item
{
    NSLog(@"this will %@", item);
}


@end
