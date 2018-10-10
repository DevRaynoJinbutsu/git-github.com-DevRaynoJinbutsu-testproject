//
//  AppDelegate.m
//  testProject
//
//  Created by Shunsuke Tsujimoto on 2016/03/19.
//  Copyright (c) 2016年 Shunsuke Tsujimoto. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "NCMB/NCMB.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // UIWindowの生成
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    NSLog(@"%f %f %f %f",[UIScreen mainScreen].bounds.origin.x,[UIScreen mainScreen].bounds.origin.y,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    
    // 最初に表示されるViewControllerを生成
    ViewController *fvc = [[ViewController alloc] init];
    self.window.rootViewController = fvc;
    [self.window makeKeyAndVisible];
    
    suspendFlg = false;
    [self main : fvc.glView];
    
    // APIキーの設定とSDK初期化
    [NCMB setApplicationKey:@"f5d606bee963b8f0fd9e57572b04faeb8bf85b5e0e655d8196f3cc714bf0c676" clientKey:@"fb3d8f632aad6eead2094a9a5402fcca8e8466ec05f799be56066110ac341898"];

    // クラスのNCMBObjectを作成
    NCMBObject *object = [NCMBObject objectWithClassName:@"TestClass"];
    // オブジェクトに値を設定
    [object setObject:@"Hello, NCMB!" forKey:@"message"];
    // データストアへの登録
    [object saveInBackgroundWithBlock:^(NSError *error) {
        if (error){
            // 保存に失敗した場合の処理
            
        } else {
            // 保存に成功した場合の処理
            
        }
    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) main:(GLViewController *)glViewCon{
//    while(!suspendFlg){
        [glViewCon viewUpdate];
//    }
}

@end
