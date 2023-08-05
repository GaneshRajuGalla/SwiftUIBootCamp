//
//  ViewModel.swift
//  DownloadJSONWithCombine
//
//  Created by Ganesh on 05/08/23.
//

import Foundation
import Combine

class ViewModel:ObservableObject{
    @Published var posts:[PostModel] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init(){
       getPosts()
    }
    
    func getPosts(){
        guard let url = getUrl() else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceEmpty(with: [])
            .sink { (completion)  in
                switch completion{
                case .finished:
                    print("SUCESS")
                case .failure(let error):
                    print("FAILURE")
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    private func getUrl() -> URL?{
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return nil }
        return url
    }
    
}
