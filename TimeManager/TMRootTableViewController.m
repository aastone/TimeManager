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
    NSMutableArray *itemTimeStart;
    TMItemModel *sub;
    NSInteger itemCount;
    UITableView *tableView;
    UITextField *textField;
    NSMutableArray *itemContent;
}

@end

@implementation TMRootTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 0
    
    
    itemCount = 0;
    itemContent = [NSMutableArray arrayWithObjects:@"2014-03-27",nil];
    
   
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
    
    [self tableViewInit];
//    [self scrollViewInit];
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
 
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

#pragma mark - Tap Gesture

- (void)viewTapped
{
    if (textField.frame.origin.y >65.0) {
        [textField resignFirstResponder];
        [self textFieldInit];
    }
}

#pragma mark - Text Field

- (void)textFieldInit
{
    if (textField.frame.origin.y < -39.0) {
        textField.frame = CGRectMake(0, 66.0, 320, 44);
    }else if(textField.frame.origin.y >65.0){
        NSLog(@"%f",textField.frame.origin.y);
        textField.frame = CGRectMake(0, -40.0, 320, 44);
    }else{
        textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 66, 320, 44)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.placeholder = @"placeholder";
        [self.view addSubview:textField];
        textField.delegate = self;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)atextField
{
    if (textField.frame.origin.y >65.0) {
        [textField resignFirstResponder];
        [self addNewItem];
        [self textFieldInit];
    }
    return YES;
}


#pragma mark - Scroll view

- (void)scrollViewInit
{
    CGRect bounds = [[UIScreen mainScreen] applicationFrame];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:bounds];
    scrollView.contentSize = self.view.frame.size;
    scrollView.delegate = self;
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"%f",tableView.contentOffset.y);
    if (tableView.contentOffset.y < -30) {
        [self textFieldInit];
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
    
    itemCount++;
}

// 增加cell的内容
- (void)addItemContent
{
    [itemContent addObject:textField.text];
    itemCount ++;
}

- (void)addNewItem
{
    rowsInSection = rowsInSection + 1;
    [self addItemContent];
    [tableView reloadData];
}

#pragma mark - Table view init

- (void)tableViewInit
{
    CGRect bounds = [[UIScreen mainScreen] applicationFrame];
//    NSLog(@"%f-%f-%f-%f",bounds.origin.x, bounds.origin.y, bounds.size.height, bounds.size.width);
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, bounds.origin.y + 9.0, bounds.size.width, bounds.size.height) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    tableView.pagingEnabled = YES;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
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

- (UITableViewCell *)tableView:(UITableView *)mtableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [mtableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"section %ld, cell %ld", (long)indexPath.section, (long)indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", itemContent[rowsInSection - indexPath.row]];

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
    
    passdata = [[NSString alloc] initWithFormat:@"%@",[itemContent objectAtIndex:indexPath.row]];
    
    detailViewController.listArray = [[NSMutableArray alloc] initWithObjects:passdata, nil];
    [self.navigationController pushViewController:detailViewController animated:YES];

}

- (void)addItemViewController:(TMDetailViewController *)controller didFinishEnteringItem:(NSString *)item
{
    NSLog(@"this will %@", item);
}


@end
