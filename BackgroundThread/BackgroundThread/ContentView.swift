//
//  ContentView.swift
//  BackgroundThread
//
//  Created by Ganesh on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack{
                Text("Load Data")
                    .padding()
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(10)
                    .onTapGesture {
                        viewModel.fetchData()
                    }
                ForEach(viewModel.dataAray,id: \.self){ item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
