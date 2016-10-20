//
//  ViewController.m
//  DrawUpGraph
//
//  Created by Litre on 2016/10/18.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "ViewController.h"
#import "DrawFanPictureView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark ----绘制扇形----
    DrawFanPictureView *view1 = [[DrawFanPictureView alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
    view1.dataDict = @{@"100":[UIColor redColor],@"50":[UIColor blueColor],@"160":[UIColor orangeColor]};
    [self.view addSubview:view1];
    
    DrawFanPictureView *view = [[DrawFanPictureView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view.dataDict = @{@"100":[UIColor redColor],@"50":[UIColor blueColor],@"160":[UIColor orangeColor]};
    view.startDegres = -M_PI*1/2;//调整起始弧度
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
