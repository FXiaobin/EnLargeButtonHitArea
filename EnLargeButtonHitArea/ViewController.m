//
//  ViewController.m
//  EnLargeButtonHitArea
//
//  Created by fanxiaobin on 2017/3/28.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+EnLarge.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"click me" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setEnlargeEdgeWithEdgeInsets:UIEdgeInsetsMake(50, 50, 50, 50)];
    
    [self.view addSubview:btn];
    
}

- (void)click:(UIButton *)sender{
    NSLog(@" ----- click me ---- ");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
