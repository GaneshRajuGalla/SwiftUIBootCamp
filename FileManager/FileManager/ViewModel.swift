//
//  ViewModel.swift
//  FileManager
//
//  Created by Ganesh on 08/08/23.
//

import Foundation
import UIKit
import SwiftUI

class ViewModel:ObservableObject{
    
    //MARK: - Properties
    let manager = LocalFileManager.instance
    @Published var image:UIImage? = nil
    @Published var infoMessage:String = ""
    var infoMessageColor = Color.black
    var imageName:String = ""
    
    
    init(){
        
    }
    
    func getImageFromeFileManager(){
        if let image = manager.loadImage(name: imageName){
            infoMessage = "SUCCESS LOADING FM"
            infoMessageColor = .green
            self.image = image
        }else{
            infoMessage = "ERROR GETTING FM"
            infoMessageColor = .pink
        }
    }
    
    func getImageFromAssetFolder(){
        if let image = UIImage(named: imageName){
            infoMessage = "SUCCESS LOADING ASSET"
            infoMessageColor = .green
            self.image = image
        }else{
            infoMessage = "ERROR GETTING ASSET"
            infoMessageColor = .pink
        }
    }
    
    func saveImage(){
        guard let image = image else {return}
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage(){
        guard let image = image else {return}
        infoMessage = manager.deleteImage(image: image, name: imageName)
    }
    
    
    func deleteFolder(){
        infoMessage = manager.deleteFolder()
    }
    
}
