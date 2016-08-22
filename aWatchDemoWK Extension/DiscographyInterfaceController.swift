//
//  DiscographyInterfaceController.swift
//  aWatchDemo
//
//  Created by Sean Scully on 21/08/16.
//  Copyright © 2016 Sean Scully. All rights reserved.
//

import Foundation
import WatchKit

class DiscographyInterfaceController: WKInterfaceController {
    
    var albumReleases = NSMutableArray()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // set title
        
        let resourceURL = context as! String
        // get resource from ViewController

        // Iterate through "releases" and map albums to pickerItems
        
    }
}