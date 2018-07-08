//
//  UIViewController+ViewController.m
//  testProject
//
//  Created by Shunsuke Tsujimoto on 2016/03/21.
//  Copyright © 2016年 Shunsuke Tsujimoto. All rights reserved.
//

#import "ViewController.h"
#include "CPPTest.h"

@implementation ViewController : UIViewController

@synthesize glView;

// 初回のみ呼ばれる
- (void)viewDidLoad
{
    glView = [[GLViewController alloc] initWithView:self.view];

    counter = 0;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    label.text = @"ほげほげa";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
//    [self.view addSubview:glView];
    CPPTest* cpptest = new CPPTest();
    delete cpptest;
    
    NSLog(@"viewDidLoad:%d",counter);
}
// Viewが呼ばれる直前に呼ばれる
- (void)viewWillAppear:(BOOL)animated
{
    counter++;
    NSLog(@"viewWillAppear:%d",counter);
    [super viewWillAppear:animated];
}
// Viewが表示完了後に呼ばれる
- (void)viewDidAppear:(BOOL)animated
{
    counter++;
    NSLog(@"viewDidAppear:%d",counter);
    [super viewDidAppear:animated];
}
// Viewの他のView切り替わり時に呼ばれる
- (void)viewWillDisappear:(BOOL)animated
{
    counter++;
    NSLog(@"viewWillDisappear:%d",counter);
    [super viewWillDisappear:animated];
}
// Viewが他のView非表示後に呼ばれる
- (void)viewDidDisappear:(BOOL)animated
{
    counter++;
    NSLog(@"viewDidDisappear:%d",counter);
    [super viewDidDisappear:animated];
}

@end
