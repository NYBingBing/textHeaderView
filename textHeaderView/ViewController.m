//
//  ViewController.m
//  textHeaderView
//
//  Created by bingbing.luo on 16/5/31.
//  Copyright © 2016年 bingbing.luo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TableView.delegate=self;
    UIImage *image=[UIImage imageNamed:@"hh.jpg"];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:image];
    imageView.frame=CGRectMake(0, 0, self.view.frame.size.width, 300);
    imageView.contentMode=UIViewContentModeScaleAspectFill;
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle: UIBlurEffectStyleDark];
    //  毛玻璃视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame=CGRectMake(0, 0, imageView.frame.size.width, 200);
    [imageView addSubview:effectView];
    effectView.alpha=0.8f;

    self.imageView=imageView;
    UIView *bgView=[[UIView alloc]initWithFrame:self.view.frame];
    [bgView addSubview:imageView];
    self.TableView.backgroundView=bgView;
    self.TableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    [self.TableView.tableHeaderView setBackgroundColor:[UIColor clearColor]];
       // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"老司机老司机%zd",indexPath.row];
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGRect frame=self.imageView.frame;
    CGFloat offsetY=self.TableView.contentOffset.y;
    if (offsetY>0) {
        frame.origin.y=-offsetY;
    }else{
        frame.origin.y=0;
        frame.size.height=300-offsetY*2;
    }
    self.imageView.frame=frame;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
