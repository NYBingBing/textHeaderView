//
//  ViewController.h
//  textHeaderView
//
//  Created by bingbing.luo on 16/5/31.
//  Copyright © 2016年 bingbing.luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;


@end

