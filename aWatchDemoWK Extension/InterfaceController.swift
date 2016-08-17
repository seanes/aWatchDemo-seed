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
    
    @IBOutlet var button: WKInterfaceButton!
    @IBOutlet var TitleLabel: WKInterfaceLabel!
    @IBOutlet var DescriptionText: WKInterfaceLabel!
    
    var resourceURL = "";
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) ->
        AnyObject? {
            return ["resourceURL" : resourceURL]
    }
    
    @IBOutlet var ProfileImage: WKInterfaceImage!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        TitleLabel.setHidden(true)
        DescriptionText.setHidden(true)
        button.setHidden(true)
        
        Discogs().getArtist { (success, JSON) in
            if (success) {
                
                if let imageURL = JSON.objectForKey("images")?.objectAtIndex(0).objectForKey("uri150") {
                    
                    let url = imageURL as! String
                    
                    NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) { data, response, error in
                        if (data != nil && error == nil) {
                            let image = UIImage(data: data!)
                            self.ProfileImage.setImage(image)
                        }
                    }.resume()
                    
                }
                
                if let artistName = JSON.objectForKey("name") {
                    self.TitleLabel.setText(artistName as? String)
                    self.TitleLabel.setHidden(false)
                }
                
                if let artistDescription = JSON.objectForKey("profile") {
                    self.DescriptionText.setText(artistDescription as! String)
                    self.DescriptionText.setHidden(false)
                    self.button.setHidden(false)
                }
                
                if let resourceURL = JSON.objectForKey("releases_url") {
                    self.resourceURL = resourceURL as! String
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
