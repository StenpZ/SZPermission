//
//  AppDelegate.m
//  SZPermissionDemo
//
//  Created by StenpZ on 2018/1/5.
//  Copyright © 2018年 www.fatehere.com. All rights reserved.
//

#import "AppDelegate.h"
#import "SZPermission.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSArray *types = @[@(SZPermissionType_Camera), @(SZPermissionType_Photos)];
    for (NSNumber *type in types) {
        [SZPermission authorizeWithType:type.integerValue completion:^(BOOL granted, BOOL firstTime) {
            if (!granted && !firstTime )
            {
                [SZPermissionSetting showAlertToDislayPrivacySettingWithTitle:@"提示" msg:@"没有 xxx 权限，是否前往设置" cancel:@"取消" setting:@"设置"];
            }
        }];
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end