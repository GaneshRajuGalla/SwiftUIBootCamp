//
//  PostModel.swift
//  DownloadJsonEscaping
//
//  Created by Ganesh on 05/08/23.
//

import Foundation

struct PostModel:Identifiable,Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
