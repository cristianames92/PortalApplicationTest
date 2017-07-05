//
//  AppDelegate.swift
//  PortalApplicationTest
//
//  Created by Cristian Ames on 7/4/17.
//  Copyright © 2017 Wolox. All rights reserved.
//

import UIKit
import Portal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    typealias SampleApplicationContext = UIKitApplicationContext<
        State,
        Message,
        Command,
        SampleSubscription,
        Route,
        Navigator,
        SampleApplication,
        SampleCommandExecutor,
        SampleSubscriptionManager,
        CustomRenderer>
    
    var applicationContext: SampleApplicationContext? = .none
    var applicationMessageHandler: (UIApplicationMessage) -> Void? = { _ in .none }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        applicationContext = UIKitApplicationContext(
            application: SampleApplication(),
            commandExecutor: SampleCommandExecutor(),
            subscriptionManager: SampleSubscriptionManager(),
            rendererFactory: CustomRenderer.init
        )
        
        let messageMapper: (UIApplicationMessage) -> Message? = { message in
            switch message {
            case .didFinishLaunching:
                return .applicationStarted
            default:
                return .none
            }
        }
        
        applicationContext?.registerMiddleware(TimeLogger { print("M - Logger: \($0)") })
        
        if let applicationContext = applicationContext {
            applicationMessageHandler  = applicationContext.runner(for: window)(messageMapper)
        }
        applicationMessageHandler(.didFinishLaunching(application: application, launchOptions: launchOptions))
        
        /*
         * Uncomment this and remove this comment once Rollbar service is enabled
         * and the keys are properly configured in the configuration files.
         *
         RollbarService().initialize()
         *
         *
         */
        
        window.rootViewController = UIViewController()
        window.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        applicationMessageHandler(.willResignActice(application: application))
        // Sent when the application is about to move from active to inactive state.
        // This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message)
        // or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates.
        // Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        applicationMessageHandler(.didEnterBackground(application: application))
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough application state information to restore your application to its current state
        // in case it is terminated later.
        // If your application supports background execution, this method is called instead of
        // applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        applicationMessageHandler(.willEnterBackground(application: application))
        // Called as part of the transition from the background to the inactive state;
        // here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        applicationMessageHandler(.didBecomeActive(application: application))
        // Restart any tasks that were paused (or not yet started) while the application was inactive.
        // If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        applicationMessageHandler(.willTerminate(application: application))
        // Called when the application is about to terminate. Save data if appropriate.
        // See also applicationDidEnterBackground:.
    }
    
}

