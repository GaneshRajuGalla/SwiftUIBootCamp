//
//  ContentView.swift
//  Arrays
//
//  Created by Ganesh on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var dataArray:[UserModel] = []
    @State private var mappedArray:[String] = []
    @State private var isMapped:Bool = false
    var body: some View {
        VStack {
            HStack{
                Button("Total") {
                    isMapped = false
                    dataArray = viewModel.dataArray
                }
                
                Button("Sorted") {
                    isMapped = false
                    viewModel.updateFilterArray(filterType: .Sort)
                    dataArray = viewModel.filteredArray
                }
                
                Button("Filter") {
                    isMapped = false
                    viewModel.updateFilterArray(filterType: .Filter)
                    dataArray = viewModel.filteredArray
                }
                
                Button("Mapped") {
                    isMapped = true
                    viewModel.updateFilterArray(filterType: .map)
                    mappedArray = viewModel.mappedArray
                }
                
                Button("Complex Filter") {
                    isMapped = true
                    viewModel.complexFilter()
                    mappedArray = viewModel.mappedArray
                }
            }
            ScrollView(showsIndicators: false) {
                VStack{
                    if isMapped{
                        ForEach(mappedArray, id: \.self) { name in
                            Text(name)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.green.cornerRadius(10))
                                .font(.headline)
                        }
                    }else{
                        ForEach(dataArray){ user in
                            VStack(alignment: .leading){
                                Text(user.name ?? "")
                                    .font(.headline)
                                HStack{
                                    Text("Points : \(user.point)")
                                    Spacer()
                                    if user.isVerified{
                                        Image(systemName: "flame.fill")
                                    }
                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple.cornerRadius(10))
                            .padding(.horizontal)
                        }
                    }
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
