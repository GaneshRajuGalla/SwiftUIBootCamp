//
//  ViewModel.swift
//  DownloadJsonEscaping
//
//  Created by Ganesh on 05/08/23.
//

import Foundation

typealias downloadHandler = (_ data: Data?) -> ()

class ViewModel:ObservableObject{
    
    @Published var posts:[PostModel] = []
    
    
    init(){
        getData()
    }
    
    private func getData(){
        guard let url = geturl() else {return}
        
        // BACKGROUND THREAD DOWNLOAD
        downloadData(from: url) { data in
            if let data = data{
                guard let posts = try? JSONDecoder().decode([PostModel].self, from: data) else {return}
                DispatchQueue.main.async { [weak self] in
                    self?.posts =  posts
                }
            }else{
                print("NO DATA RETURNED")
            }
        }
    }
    
    // GENERIC DATA DOWNLOAD HANDLER
    private func downloadData(from url: URL, completionHandler: @escaping downloadHandler) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("ERROR DOWNLOADING DATA")
                completionHandler(nil)
                return
            }
            completionHandler(data)
        }.resume()
    }
    
    private func geturl() -> URL?{
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return nil}
        return url
    }
}
