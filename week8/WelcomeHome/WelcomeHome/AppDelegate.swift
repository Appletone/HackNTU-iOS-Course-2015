//
//  AppDelegate.swift
//  WelcomeHome
//
//  Created by 張 景隆 on 2015/5/5.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?

    let manager = CLLocationManager()
    var homeRegion = CLCircularRegion(center:CLLocationCoordinate2DMake(25.017354, 121.539907), radius: 1000.0, identifier: "Home")

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // 如果 使用者尚未決定 是否提供座標，則詢問使用者
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            manager.requestAlwaysAuthorization()
        }
        
        self.manager.delegate = self
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    // 進入背景
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        // 開始監控
        if CLLocationManager.significantLocationChangeMonitoringAvailable() {
            print("開始監控")
            manager.stopUpdatingLocation()
            manager.startMonitoringForRegion(homeRegion)
            manager.startMonitoringSignificantLocationChanges()
        }
        else {
            print("Region monitoring is not available")
        }

    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        // 停止監控
        if CLLocationManager.significantLocationChangeMonitoringAvailable() {
            print("停止監控")
            manager.stopMonitoringSignificantLocationChanges()
            manager.startUpdatingLocation()
        }
        else {
            print("Region monitoring is not available")
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        //
        print("didEnterRegion 進入範圍！")
        print(region)
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        //
        print("didExitRegion 離開範圍！")
        print(region)
        
    }
    
}

