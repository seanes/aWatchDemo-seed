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

class InterfaceController: WKInterfaceController {
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        Discogs().getArtist { (success, JSON) in
            if (success) {
                
                if let imageURL = JSON.objectForKey("images")?.objectAtIndex(0).objectForKey("uri150") {
                    
                    let url = NSURL(string: imageURL as! String)
                    let data = NSData(contentsOfURL : url!)
                    let image = UIImage(data : data!)
                    
                    // todo : set image
                    
                }
                
                if let artistName = JSON.objectForKey("name") {
                    print(artistName)
                    // todo : set header caption
                }
                
                if let artistDescription = JSON.objectForKey("profile") {
                    print(artistDescription)
                    // todo : set artist description
                }
                
                if let resourceURL = JSON.objectForKey("releases_url") {
                    print(resourceURL)
                    // todo : persist discography url for later use
                }
                
            }
        }
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
