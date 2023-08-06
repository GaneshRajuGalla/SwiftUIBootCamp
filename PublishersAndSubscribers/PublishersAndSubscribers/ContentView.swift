//
//  ContentView.swift
//  PublishersAndSubscribers
//
//  Created by Ganesh on 06/08/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @StateObject private var viewModel = ViewModel()
    
    
    //MARK: - Body
    var body: some View {
        VStack{
            Text("\(viewModel.count)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.gray.opacity(0.6))
            TextField("Type something...", text: $viewModel.textFieldText)
                .padding(.leading)
                .font(.headline)
                .frame(height: 55)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .overlay(
                    ZStack{
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(viewModel.textFieldText.count < 1 ? 0.0 : viewModel.textIsValid ? 0.0 : 1.0)
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(viewModel.textIsValid ? 1.0 : 0.0)
                    }
                    .font(.headline)
                    .padding(.trailing)
                    ,alignment: .trailing
                )
            
            Button {
                
            } label: {
                Text("submit".uppercased())
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .opacity(viewModel.showButton ? 1.0 : 0.5)
                    .cornerRadius(10)
            }
            .disabled(!viewModel.showButton)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
