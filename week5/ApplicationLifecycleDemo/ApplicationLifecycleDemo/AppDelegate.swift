//
//  AppDelegate.swift
//  ApplicationLifecycleDemo
//
//  Created by 張 景隆 on 2015/3/30.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // MARK:
    // MARK: 程式進入點
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions")
        
        application.idleTimerDisabled = true
        application.networkActivityIndicatorVisible = true
        application.statusBarHidden = true
        application.applicationSupportsShakeToEdit = true
        application.applicationIconBadgeNumber = 10
        
        var rootVC = window?.rootViewController
        var screen = window?.screen
        print(screen)
        
        return true
    }
    
    // MARK:
    // MARK: 進入背景
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        print("applicationWillResignActive")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("applicationDidEnterBackground")
    }
    
    // MARK:
    // MARK: 進入前景
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        print("applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("applicationDidBecomeActive")
    }

    // MARK:
    // MARK: 即將被終止（移除背景）
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("applicationWillTerminate")
    }


}

