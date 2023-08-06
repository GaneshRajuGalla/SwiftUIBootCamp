//
//  ViewModel.swift
//  PublishersAndSubscribers
//
//  Created by Ganesh on 06/08/23.
//

import Foundation
import Combine

class ViewModel:ObservableObject{
    
    private var cancellables = Set<AnyCancellable>()
    @Published var count:Int = 0
    @Published var textFieldText:String = ""
    @Published var textIsValid:Bool = false
    @Published var showButton:Bool = false
    
   
    init(){
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    
    func setUpTimer(){
        Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else {return}
                self.count += 1
            }
            .store(in: &cancellables)
        
    }
    
    func addTextFieldSubscriber(){
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map{ (text) -> Bool in
                if text.count > 3{
                    return true
                }
                return false
            }
            .sink { [weak self] isValid in
                guard let self = self else {return}
                self.textIsValid = isValid
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber(){
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] (isValid,count) in
                guard let self = self else {return}
                if isValid && count >= 10{
                    self.showButton = true
                }else{
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
}
