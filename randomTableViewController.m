//
//  randomTableViewController.m
//  dynamicTable
//
//  Created by pcs20 on 10/1/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

#import "randomTableViewController.h"
#import "folder.h"

@interface randomTableViewController (){
   
    
}

@end

@implementation randomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    folderObjectArray=[[NSMutableArray alloc] init];
    
    
    UIBarButtonItem *addButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(callthismethod)];
    
    
    self.navigationItem.rightBarButtonItem=addButton;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return folderObjectArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell" ];
    }
    
    folder *temp=[folderObjectArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text=temp.folderName;
    
    
    // Configure the cell...
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
   
    
    
    randomTableViewController *dynamical=[[randomTableViewController alloc] initWithNibName:@"randomTableViewController" bundle:nil];
    folder *temp=[folderObjectArray objectAtIndex:indexPath.row];
    
    
    dynamical.self.title=temp.folderName;
    
    [dynamical.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

    
    
    
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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

-(void)callthismethod{

    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Add Folder" message:@" " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    
    [alert show];


}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1) {
        folder *foldObject=[[folder alloc] init];
        
        foldObject.folderName=[alertView textFieldAtIndex:0].text;
        
        [folderObjectArray addObject:foldObject];
        
        [self.tableView reloadData];
    }
    
}


@end
