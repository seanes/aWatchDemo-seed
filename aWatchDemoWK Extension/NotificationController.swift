//
//  NotificationController.swift
//  aWatchDemoWK Extension
//
//  Created by Sean Scully on 08/06/16.
//  Copyright © 2016 Sean Scully. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {
    
    @IBOutlet var notificationImage: WKInterfaceImage!
    @IBOutlet var label: WKInterfaceLabel!
    
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        
        if (localNotification.alertTitle == "NICKELBACK!") {
            label.setText("Nickelback! :)")
            notificationImage.setImage(UIImage.init(named: "nickelback_image"))
            
        } else {
            label.setText("Kroeger! :)")
            notificationImage.setImageNamed("kroeger_image")
        }
        
        completionHandler(.Custom)
    }
    
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        print("receivedRemoteNotification")
        
        let notification = remoteNotification as NSDictionary;
        let category = notification.objectForKey("aps")?.objectForKey("category") as! String;
        
        switch category {
        case "myCategory":
            notificationImage.setImageNamed("nickelback_image")
        default:
            notificationImage.setImageNamed("kroeger_image")
        }
        
        completionHandler(.Custom)
    }
 
}
