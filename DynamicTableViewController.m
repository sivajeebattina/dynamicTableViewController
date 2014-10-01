//
//  DynamicTableViewController.m
//  dynamicTable
//
//  Created by pcs20 on 10/1/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

#import "DynamicTableViewController.h"
#import "folder.h"
#import "randomTableViewController.h"

@interface DynamicTableViewController (){

    NSMutableArray *folderObjectsArray;
    NSMutableArray *dynamicTables;
}

@end

@implementation DynamicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    folderObjectsArray=[[NSMutableArray alloc] init];
    dynamicTables=[[NSMutableArray alloc] init];
    
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return folderObjectsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Add" forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hello"];
    }
    
    folder *fold=[folderObjectsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text=fold.folderName;
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
    randomTableViewController *dynamical=[[randomTableViewController alloc] initWithNibName:@"randomTableViewController" bundle:nil];
    folder *temp=[folderObjectsArray objectAtIndex:indexPath.row];
    
    
    dynamical.self.title=temp.folderName;
    
    [dynamical.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    
    
    
       
    
    dynamical.tableView.tag=2;
   
    
    [dynamicTables addObject:dynamical];
    
    [self.navigationController pushViewController:dynamical animated:YES];
    
}


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

-(IBAction)addClicked:(id)sender{
    
 
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Add Folder" message:@" " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    
    [alert show];

    
    

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex==1) {
        folder *foldObject=[[folder alloc] init];
        
        foldObject.folderName=[alertView textFieldAtIndex:0].text;
        
        [folderObjectsArray addObject:foldObject];
        
        [self.tableView reloadData];
    }

}


@end
