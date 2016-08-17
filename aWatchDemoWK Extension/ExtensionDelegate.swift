//
//  ExtensionDelegate.swift
//  aWatchDemoWK Extension
//
//  Created by Sean Scully on 08/06/16.
//  Copyright © 2016 Sean Scully. All rights reserved.
//

import WatchKit


class ExtensionDelegate: NSObject, WKExtensionDelegate {
    
    static let sharedInstance = ExtensionDelegate()

    var numberCount = 0

    func setnumberCount(count: Int) {
        self.numberCount = count
    }
    
    func getnumberCount() -> Int {
        return self.numberCount
    }
    
    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

}
