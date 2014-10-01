//
//  DynamicTableViewController.h
//  dynamicTable
//
//  Created by pcs20 on 10/1/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)IBOutlet UIButton *addButton;

-(IBAction)addClicked:(id)sender;

@end
