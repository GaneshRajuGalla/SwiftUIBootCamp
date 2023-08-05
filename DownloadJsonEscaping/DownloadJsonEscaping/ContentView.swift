//
//  ContentView.swift
//  DownloadJsonEscaping
//
//  Created by Ganesh on 05/08/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = ViewModel()
    
    //MARK: - Body
    var body: some View {
        List{
            ForEach(viewModel.posts){ post in
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .foregroundColor(.gray)
                    .font(.body)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
