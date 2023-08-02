//
//  ViewModel.swift
//  BackgroundThread
//
//  Created by Ganesh on 03/08/23.
//

import Foundation

class ViewModel:ObservableObject{
    
    @Published var dataAray:[String] = []
    
    func fetchData(){
        DispatchQueue.global(qos: .background).async {
            print("Check 1:- \(Thread.isMainThread)")
            print("Check 1:- \(Thread.current)")
            let newData = self.downloadData()
            
            DispatchQueue.main.async {
                print("Check 2:- \(Thread.isMainThread)")
                print("Check 2:- \(Thread.current)")
                self.dataAray = newData
            }
        }
    }
    
    func downloadData() -> [String]{
        var data:[String] = []
        
        for str in 0..<100{
            data.append("\(str)")
        }
        return data
    }
}
