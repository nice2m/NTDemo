//
//  FoundationViewController.m
//  NTDemo
//
//  Created by   on 9/18/19.
//  Copyright © 2019  . All rights reserved.
//

#import "FoundationViewController.h"

@interface FoundationViewController ()
@end

@implementation FoundationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self perciseTest];
    
    
}

#pragma mark -

- (void)perciseTest
{
    

    
    NTDemoModel * demo = [[NTDemoModel alloc] init];
    
    demo.actionBlock = ^id _Nullable(id  _Nullable parameter) {
        //
        
        CGFloat aNum = 12.4595;
        // round  roundf 以小数点后一位，四舍五入 收为整数; 12.42 => 12.0   12.88 => 13.0
        
        NSString * testStr = [NSString stringWithFormat:@"%.3f",round(aNum)];
        
        NSInteger longNum = 1004;
        NSLog(@"%f",round(longNum));
        NSLog(@"%@",testStr);
        NSLog(@"%@",testStr);
        return nil;
    };
    
    demo.demoName = @"round  roundf 以小数点后一位，四舍五入 收为整数; 12.42 => 12.0   12.88 => 13.0";
    [self.dataSource addObject:demo];
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
