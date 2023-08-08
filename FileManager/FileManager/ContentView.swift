//
//  ContentView.swift
//  FileManager
//
//  Created by Ganesh on 08/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            VStack{
                if let image = viewModel.image{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200,height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Button {
                    viewModel.imageName = "image-1"
                    viewModel.getImageFromAssetFolder()
                } label: {
                    Buttonlable(buttonText: "LOAD FROM ASSET1", backgroundColor: .blue)
                }
                
                Button {
                    viewModel.imageName = "image-2"
                    viewModel.getImageFromAssetFolder()
                } label: {
                    Buttonlable(buttonText: "LOAD FROM ASSET2", backgroundColor: .blue)
                }
                
                Button {
                    viewModel.saveImage()
                } label: {
                    Buttonlable(buttonText: "SAVE TO FM", backgroundColor: .orange)
                }
                
                Button {
                    viewModel.imageName = "image-1"
                    viewModel.getImageFromeFileManager()
                } label: {
                    Buttonlable(buttonText: "LOAD FROM FM1", backgroundColor: .purple)
                }
                
                Button {
                    viewModel.imageName = "image-2"
                    viewModel.getImageFromeFileManager()
                } label: {
                    Buttonlable(buttonText: "LOAD FROM FM2", backgroundColor: .purple)
                }
                
                Button {
                    viewModel.deleteImage()
                } label: {
                    Buttonlable(buttonText: "DELETE FROM FM", backgroundColor: .pink)
                }
                
                Button {
                    viewModel.deleteFolder()
                } label: {
                    Buttonlable(buttonText: "DELETE FM FOLDER", backgroundColor: .red)
                }
                
                Text(viewModel.infoMessage)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(viewModel.infoMessageColor)
                Spacer()

            }
            .navigationTitle("FILE MANAGER")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Buttonlable:View{
    let buttonText:String
    let backgroundColor:Color
    
    var body: some View{
        Text(buttonText)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
