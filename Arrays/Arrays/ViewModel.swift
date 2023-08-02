//
//  ViewModel.swift
//  Arrays
//
//  Created by Ganesh on 03/08/23.
//

import Foundation

class ViewModel:ObservableObject{
    @Published var dataArray:[UserModel] = []
    @Published var filteredArray:[UserModel] = []
    @Published var mappedArray:[String] = []
    
    
    init(){
        getUsers()
    }
    
    func getUsers(){
        let user1 = UserModel(name: "Aaradhya", point: 40, isVerified: false)
        let user2 = UserModel(name: nil, point: 75, isVerified: true)
        let user3 = UserModel(name: "Diya", point: 25, isVerified: false)
        let user4 = UserModel(name: "Advika", point: 60, isVerified: true)
        let user5 = UserModel(name: "Ishita", point: 15, isVerified: true)
        let user6 = UserModel(name: "Kavya", point: 50, isVerified: false)
        let user7 = UserModel(name: nil, point: 85, isVerified: true)
        let user8 = UserModel(name: "Navya", point: 5, isVerified: false)
        let user9 = UserModel(name: "Saanvi", point: 95, isVerified: true)
        let user10 = UserModel(name: "Trisha", point: 45, isVerified: true)
        dataArray.append(contentsOf: [user1,user2,user3,user4,user5,user6,user7,user8,user9,user10])
    }
    
    enum FilterType:String{
        case Sort = "sort"
        case Filter = "filter"
        case map = "map"
    }
    
    func updateFilterArray(filterType:FilterType){
        switch filterType {
        case .Sort:
            filteredArray = dataArray.sorted(by: {$0.point > $1.point})
        case .Filter:
            filteredArray = dataArray.filter{$0.isVerified}
        case .map:
            mappedArray = dataArray.compactMap({$0.name})
        }
    }
    
    func complexFilter(){
        mappedArray = dataArray
            .sorted(by: {$0.point > $1.point})
            .filter{$0.isVerified}
            .compactMap({$0.name})
    }
}
