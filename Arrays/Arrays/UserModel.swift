//
//  UserModel.swift
//  Arrays
//
//  Created by Ganesh on 03/08/23.
//

import Foundation

struct UserModel:Identifiable{
    let id = UUID().uuidString
    let name:String?
    let point:Int
    let isVerified:Bool
}
