//
//  NSCacheViewModel.swift
//  NSCache
//
//  Created by Ganesh on 09/08/23.
//

import Foundation
import SwiftUI

class NSCacheViewModel:ObservableObject{
    
    private let manager = NSCacheManager.instane
    @Published var startingImage:UIImage? = nil
    @Published var cachedImage:UIImage? = nil
    @Published var infoMessage:String = ""
    var imageName = "image-1"
    
    init(){
        getImageFromAssertFolder()
    }
    
    func getImageFromAssertFolder(){
        startingImage = UIImage(named: imageName)
    }
    
    func changeImage(){
        if imageName == "image-1"{
            imageName = "image-2"
            getImageFromAssertFolder()
        }else{
            imageName = "image-1"
            getImageFromAssertFolder()
        }
    }
    
    func saveToCache(){
        guard let image = startingImage else {return}
        infoMessage = manager.add(image: image, name: imageName)
    }
    
    func removeFromCache(){
        infoMessage = manager.remove(name: imageName)
    }
    
    func getFromCache(){
        if let image = manager.get(name: imageName){
            self.cachedImage = image
            infoMessage = "CACHE IMAGE"
        }else{
            self.cachedImage = nil
            infoMessage = "NO CACHE IMAGE"
        }
    }
    
}
