//
//  ContentView.swift
//  DownloadJSONWithCombine
//
//  Created by Ganesh on 05/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        List{
            ForEach(viewModel.posts){ post in
                VStack(alignment: .leading,spacing: 20) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                        .font(.body)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
