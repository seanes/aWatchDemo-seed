//
//  ViewController.swift
//  aWatchDemo
//
//  Created by Sean Scully on 08/06/16.
//  Copyright © 2016 Sean Scully. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    let app = UIApplication.sharedApplication()
    var session: WCSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session?.delegate = self
            session?.activateSession()
        }
    }
    
    @IBAction func button(sender: AnyObject) {
        sendMessage("NICKELBACK!", body: "This is how you remind me ...")
    }
    
    @IBAction func button2(sender: AnyObject) {
        sendMessage("Kroeger!", body: "IT IS TIME, NICKELBACK TIME!")
    }
    
    @IBAction func sendConnectivityMessage(sender: AnyObject) {
        if let validSession = session {
            do {
                try validSession.updateApplicationContext(["message": Int(arc4random())])
            } catch {
                print("something went wrong")
            }
        }
    }
    
    func sendMessage(title: String, body: String) {
        
        let alertTime = NSDate().dateByAddingTimeInterval(5)
        
        let category = "myCategory"
        
        let notifyAlarm = UILocalNotification()
        
        notifyAlarm.fireDate = alertTime
        notifyAlarm.timeZone = NSTimeZone.systemTimeZone()
        notifyAlarm.soundName = UILocalNotificationDefaultSoundName
        notifyAlarm.category = category
        notifyAlarm.alertTitle = title
        notifyAlarm.alertBody = body
        app.scheduleLocalNotification(notifyAlarm)
        
        let alertController = UIAlertController(title: "Send message", message:
            "sending message " + String(alertTime), preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

