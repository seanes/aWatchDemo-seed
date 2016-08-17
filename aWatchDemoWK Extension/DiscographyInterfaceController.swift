//
//  DiscographyInterfaceController.swift
//  aWatchDemo
//
//  Created by Sean Scully on 10/06/16.
//  Copyright © 2016 Sean Scully. All rights reserved.
//

import Foundation
import WatchKit
import ClockKit

class DiscographyInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var table: WKInterfaceTable!
    
    @IBOutlet var picker: WKInterfacePicker!
    @IBOutlet var headerLabel: WKInterfaceLabel!
    
    var pickerItems: [WKPickerItem] = []
    
    @IBAction func pickItem(value: Int) {
        
        if (self.pickerItems.count > 0) {
            headerLabel.setText(pickerItems[value].caption)
        }
        
    }
    override func awakeWithContext(context: AnyObject?) {
        
        let data = context as! NSDictionary
        let resourceURL = data.objectForKey("resourceURL") as! String
        let complicationServer = CLKComplicationServer.sharedInstance()
        
        Discogs().getReleases(resourceURL, completion: { (success, JSON) in
            
            var albumList: [(String, String)] = []
            
            if (success) {
                
                for (index, release) in (JSON.objectForKey("releases") as! NSArray).enumerate() {
                    
                    let albumName   = release.objectForKey("title") as! String
                    let year = String(release.objectForKey("year")!)
                    
                    albumList.append((albumName, year))
                }
                
                if (albumList.count > 0) {
                    
                    self.pickerItems = albumList.map {
                        
                        let pickerItem = WKPickerItem()
                        
                        pickerItem.title = $0.0
                        pickerItem.caption = $0.1
                    
                        return pickerItem
                    
                    }
                    
                    
                    self.picker.setItems(self.pickerItems)
                    
                    ExtensionDelegate.sharedInstance.setnumberCount(albumList.count)
                    
                    for complication in complicationServer.activeComplications! {
                        complicationServer.reloadTimelineForComplication(complication)
                    }
                    
                    
                }

            }
            
        })
        
    }
    
    
}
