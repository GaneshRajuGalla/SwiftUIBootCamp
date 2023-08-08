//
//  LocalFileManager.swift
//  LocalFileManager
//
//  Created by Ganesh on 08/08/23.
//

import Foundation
import UIKit

class LocalFileManager{
    
    static let instance = LocalFileManager()
    private let cachePathName:String = "MyImages"
    
    private init(){
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded(){
        guard
            let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(cachePathName)
                .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path){
            do{
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true,attributes: nil)
                print("SUCCESS CREATING FOLDER")
            }catch let error{
                print("ERROR CREATING DIRECTORY")
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteFolder() -> String{
        guard
            let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(cachePathName)
                .path else {
            return "ERROR GETTING PATH"
        }
        
        do{
            try FileManager.default.removeItem(atPath: path)
            return "SUCCESS DELETING FOLDER"
        }catch let error{
            print(error.localizedDescription)
            return "ERROR DELETING FOLDER"
        }
    }
    
    func saveImage(image:UIImage,name:String) -> String{
        
        guard let data = image.pngData(),let path = getPathForImage(name: name) else {
            return "ERROR GETTING PATH"
        }
        
        do{
            try data.write(to: path)
            return "SUCCESS SAVING"
        }catch let error{
            print(error.localizedDescription)
            return "ERROR SAVING IMAGE"
        }
    }
    
    func loadImage(name:String) -> UIImage?{
        
        guard let path  = getPathForImage(name: name)?.path,FileManager.default.fileExists(atPath: path) else{
            print("ERROR GETTTING PATH")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(image:UIImage,name:String) -> String{
        guard
            let path = getPathForImage(name: name),
            FileManager.default.fileExists(atPath: path.path) else {
            return "ERROR GETTING PATH"
        }
        
        do {
            try FileManager.default.removeItem(at: path)
        }catch let error{
            print(error.localizedDescription)
            return "ERROR DELETING IMAGE"
        }
        return "SUCCESS DELETING IMAGE"
    }
    
    func getPathForImage(name:String) -> URL?{
        
        guard
            let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?
                .appendingPathComponent(cachePathName)
                .appendingPathComponent("\(name).png") else {
            return nil
        }
        return path
    }
}
