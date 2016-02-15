//
//  AppDelegate.swift
//  CU_VE_App
//
//  Created by Daniel Puga on 8/1/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var globalWSC: WebServicesConnection?
    var deviceNetConn : Reachability?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.globalWSC = WebServicesConnection()
        do{
            try self.deviceNetConn = Reachability.reachabilityForInternetConnection()
        }catch{
            MeaningAndFormValidation.printMessageWithText("Couldn't create Reachability", className: String(self))
        }
        
/*        UIDevice.currentDevice().userInterfaceIdiom == .Phone
        UIDevice.currentDevice().userInterfaceIdiom == .Pad*/
        let modelName = UIDevice.currentDevice().modelName
        print("something SYSTEM-NAME: \(modelName)")
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            MeaningAndFormValidation.printMessageWithText("Current Device: \(UIDevice.currentDevice().userInterfaceIdiom.rawValue)", className: String(self))
            MeaningAndFormValidation.printMessageWithText("Current Version: \(UIDevice.currentDevice().systemVersion)", className: String(self))
            MeaningAndFormValidation.printMessageWithText("Current Model: \(UIDevice.currentDevice().model)", className: String(self))
        }else{
            MeaningAndFormValidation.printMessageWithText("Current Device: \(UIDevice.currentDevice().userInterfaceIdiom.rawValue)", className: String(self))
            MeaningAndFormValidation.printMessageWithText("Current Version: \(UIDevice.currentDevice().systemVersion)", className: String(self))
            MeaningAndFormValidation.printMessageWithText("Current Model: \(UIDevice.currentDevice().model)", className: String(self))
        }
        //UIDevice.currentDevice().userInterfaceIdiom == .Pad
        
        //MeaningAndFormValidation.printMessageWithText("Current Device: \(UIDevice.currentDevice().userInterfaceIdiom)", className: String(self))
        //MeaningAndFormValidation.printMessageWithText("Current Version: \(Device.CURRENT_VERSION)", className: String(self))
        /*MeaningAndFormValidation.printMessageWithText("Wifi reach: \(self.deviceNetConn?.isReachableViaWiFi())", className: String(self))
        MeaningAndFormValidation.printMessageWithText("Phone Cell Data reach: \(self.deviceNetConn?.isReachableViaWWAN())", className: String(self))*/
        let TabAndNavBarColor:UIColor = UIColor.blueColor() //Theme color depending on Company using app
        //lets try gradient
        /*let gradient = CAGradientLayer()
        gradient.frame = UINavigationBar.appearance().frame
        gradient.colors = [UIColor.whiteColor().CGColor, UIColor.blackColor().CGColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        UIGraphicsBeginImageContext(UINavigationBar.appearance().frame.size)
        gradient.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UINavigationBar.appearance().setBackgroundImage(image, forBarMetrics: UIBarMetrics.Default) */
        
        let textColor = UIColor(red: 255.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        let bothTabColor = TabAndNavBarColor //UIColor(red: 183.0/255.0, green: 44.0/255.0, blue: 44.0/255.0, alpha: 1.0)
        let titleShadow: NSShadow = NSShadow()
        titleShadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        titleShadow.shadowOffset = CGSize(width: 0, height: 1)
        
        UINavigationBar.appearance().barTintColor = bothTabColor
        UITabBar.appearance().barTintColor = bothTabColor
        UITabBar.appearance().tintColor = textColor
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 16)!,
            NSForegroundColorAttributeName: textColor,
            NSShadowAttributeName: titleShadow
        ]
        
        let pageController = UIPageControl.appearance()
        pageController.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageController.currentPageIndicatorTintColor = UIColor.whiteColor()
        pageController.backgroundColor = TabAndNavBarColor
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

