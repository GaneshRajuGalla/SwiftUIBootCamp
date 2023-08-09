//
//  ContentView.swift
//  NSCache
//
//  Created by Ganesh on 09/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NSCacheViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                Text(viewModel.infoMessage)
                    .font(.title)
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                
                if let image = viewModel.startingImage{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                }
                HStack{
                    Button {
                        viewModel.saveToCache()
                    } label: {
                        Text("SAVE TO CACHE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        viewModel.removeFromCache()
                    } label: {
                        Text("DELETE FROM CACHE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.red)
                            .cornerRadius(10)
                    }
                }
                
                if let image = viewModel.cachedImage{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200,height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                HStack{
                    Button {
                        viewModel.changeImage()
                    } label: {
                        Text("CHANGE IMAGE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.orange)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        viewModel.getFromCache()
                    } label: {
                        Text("GET FROM CACHE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.green)
                            .cornerRadius(10)
                    }
                }
                Spacer()
            }
        }
        .navigationTitle("CACHE")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
