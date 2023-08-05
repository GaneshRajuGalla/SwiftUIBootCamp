//
//  WeakSelfViewModel.swift
//  WeakSelf
//
//  Created by Ganesh on 05/08/23.
//

import Foundation

class WeakSelfViewModel:ObservableObject{
    
    @Published var data:String? = nil
    
    init(){
        print("INIT")
        let count = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(count + 1, forKey: "count")
        getData()
    }
    
    func getData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 50, execute: { [weak self] in
            self?.data = "This is Data !!!"
        })
    }
    
    deinit{
        print("DEINIT")
        let count = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(count - 1, forKey: "count")
    }
}
