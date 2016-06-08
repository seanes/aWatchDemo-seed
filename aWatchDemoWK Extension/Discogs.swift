//
//  Discogs.swift
//  aWatchDemo
//
//  Created by Sean Scully on 08/06/16.
//  Copyright © 2016 Sean Scully. All rights reserved.
//

import Foundation
import Alamofire

public class Discogs {
    
    var key = "key=xPBuCxPMjebTttvRRxUv"
    var secret = "secret=PjhzAphnAKaZRmOYIqyIvbiKuAduAIwj"
    var baseURL = "https://api.discogs.com/"
    var artistURL = "artists/"
    var nickleBackID = "108713"
    
    typealias CompletionHandler = (success:Bool, JSON: AnyObject) -> Void
    
    func getArtist (completion: CompletionHandler) {
        let request = NSMutableURLRequest(URL: NSURL(string: "\(baseURL)\(artistURL)\(nickleBackID)?\(key)&\(secret)")!, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 100)
        
        getResource(request) { (success, JSON) in
            completion(success: success, JSON: JSON)
        }
    }
    
    func getReleases(resourceURL: String, completion: CompletionHandler) {
        let request = NSMutableURLRequest(URL: NSURL(string: "\(resourceURL)?\(key)&\(secret)&sort=title")!, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 100)
        
        getResource(request) { (success, JSON) in
            completion(success: success, JSON: JSON)
        }
    }
    
    internal func getResource(request: NSMutableURLRequest, completion: CompletionHandler) {
        Alamofire.request(request)
            .responseJSON { response in
                if let JSON = response.result.value {
                    completion(success: true, JSON: JSON)
                } else {
                    completion(success: false, JSON: "")
                }
        }
    }
}