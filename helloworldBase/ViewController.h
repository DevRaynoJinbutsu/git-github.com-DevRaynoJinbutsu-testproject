//
//  UIViewController+ViewController.h
//  testProject
//
//  Created by Shunsuke Tsujimoto on 2016/03/21.
//  Copyright © 2016年 Shunsuke Tsujimoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLViewController.h"

@interface ViewController : UIViewController{
    UITextView* test;
    int counter;
}
@property GLViewController* glView;


@end
