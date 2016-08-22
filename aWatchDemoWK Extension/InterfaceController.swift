//
//  InterfaceController.swift
//  aWatchDemoWK Extension
//
//  Created by Sean Scully on 08/06/16.
//  Copyright © 2016 Sean Scully. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    var resourceURL = ""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        Discogs().getArtist { (success, JSON) in
            
            if (success) {
                
                if let imageURL = JSON.objectForKey("images")?.objectAtIndex(0).objectForKey("uri150") {
                        // TODO: Should retrieve image by URL and set profile image
                    
                }
                
                if let artistName = JSON.objectForKey("name") {
                    // TODO : set header
                }
                
                if let artistDescription = JSON.objectForKey("profile") {
                    // TOFO : set description
                }
                
                if let resourceURL = JSON.objectForKey("releases_url") {
                    // TODO : save resourceURL for later                }
                
                }
            }
        }
    }
    

    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return self.resourceURL
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
