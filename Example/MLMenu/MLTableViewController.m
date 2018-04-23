//
//  MLTableViewController.m
//  MLMenu_Example
//
//  Created by 戴明亮 on 2018/4/23.
//  Copyright © 2018年 MrDML. All rights reserved.
//

#import "MLTableViewController.h"
#import "MLViewController.h"

@interface MLTableViewController ()

@end

@implementation MLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"菜单样式:%zd",indexPath.row + 1];
   
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   MLViewController *VC = [board instantiateViewControllerWithIdentifier:@"MLViewController"];
    switch (indexPath.row) {
        case 0:
            VC.menuStyle = MLMenuStyle_Title;
            break;
        case 1:
             VC.menuStyle = MLMenuStyle_ImageAndTitle;
            break;
        case 2:
            VC.menuStyle = MLMenuStyle_AnimationRight;
            break;
        case 3:
            VC.menuStyle = MLMenuStyle_AnimationTop;
            break;
        case 4:
            VC.menuStyle = MLMenuStyle_AnimationNone;
            break;
        case 5:
            VC.menuStyle = MLMenuStyle_HasTriangle;
            break;
        case 6:
            VC.menuStyle = MLMenuStyle_NoHasTriangle;
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:VC animated:YES];
}

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
