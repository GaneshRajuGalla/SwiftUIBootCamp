//
//  ContentView.swift
//  Typealias
//
//  Created by Ganesh on 05/08/23.
//

import SwiftUI

typealias TVModel = MovieModel

struct ContentView: View {
    //MARK: - Properties
    @State private var item = TVModel(title: "Avengers", director: "Joss Whedon", count: 5)
    
    //MARK: - Body
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
        .fontWeight(.bold)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
