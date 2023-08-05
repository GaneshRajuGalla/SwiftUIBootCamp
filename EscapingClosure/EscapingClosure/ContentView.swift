//
//  ContentView.swift
//  EscapingClosure
//
//  Created by Ganesh on 05/08/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = EscapingViewModel()
    
    //MARK: - Body
    var body: some View {
        Text(viewModel.text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
            .foregroundColor(.white)
            .background(Color.cyan.cornerRadius(10))
            .shadow(radius: 5)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
