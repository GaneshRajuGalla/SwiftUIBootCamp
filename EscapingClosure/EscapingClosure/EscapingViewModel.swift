//
//  EscapingViewModel.swift
//  EscapingClosure
//
//  Created by Ganesh on 05/08/23.
//

import Foundation

typealias DownloadCompletionHandler = (_ data: DownloadModel) -> ()

class EscapingViewModel:ObservableObject{
    @Published var text:String = "Hello"
    
    init(){
        print("INIT")
    }
    
    deinit{
        print("DEINIT")
    }
    
    func getData(){
        downloadData5 { [weak self] data in
            self?.text = data.data
        }
    }
    
    
    func downloadData1() -> String{
        return "Updated Data !!!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> ()){
        completionHandler("Updated Data !!!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()){
        DispatchQueue.main.asyncAfter(deadline:  .now() + 2.0){
            completionHandler("Updated Data !!!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (_ data: DownloadModel) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            let result = DownloadModel(data: "New Data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletionHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            let result = DownloadModel(data: "New Data!")
            completionHandler(result)
        }
    }
}
