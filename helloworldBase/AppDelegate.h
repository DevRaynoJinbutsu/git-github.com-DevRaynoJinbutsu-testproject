//
//  AppDelegate.h
//  testProject
//
//  Created by Shunsuke Tsujimoto on 2016/03/19.
//  Copyright (c) 2016年 Shunsuke Tsujimoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    bool suspendFlg;
}

@property (strong, nonatomic) UIWindow* window;
@property (strong, nonatomic) UIView* view;

- (void)main:(GLViewController *)glViewCon;

@end

