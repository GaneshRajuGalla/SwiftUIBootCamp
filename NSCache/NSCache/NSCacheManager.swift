//
//  NSCacheManager.swift
//  NSCache
//
//  Created by Ganesh on 09/08/23.
//

import Foundation
import SwiftUI

class NSCacheManager{
    
    static let instane = NSCacheManager()
    
    private init(){
        
    }
    
    var imageCache:NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString,UIImage> ()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func add(image:UIImage,name:String) -> String{
        imageCache.setObject(image, forKey: name as NSString)
        return "ADDED TO CACHE"
    }
    
    func get(name:String) -> UIImage?{
        guard let image = imageCache.object(forKey: name as NSString) else {
            return nil
        }
        return image
    }
    
    func remove(name:String) -> String{
        imageCache.removeObject(forKey: name as NSString)
        return "REMOVE FROM CACHE"
    }
}
