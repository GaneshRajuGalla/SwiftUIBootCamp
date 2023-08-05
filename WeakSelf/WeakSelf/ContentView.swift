//
//  ContentView.swift
//  WeakSelf
//
//  Created by Ganesh on 05/08/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @AppStorage("count") var count:Int?
    
    init(){
        count = 0
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            NavigationLink("Navigate", destination: WealSelfScreen())
                .navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .background(Color.orange.cornerRadius(20))
            ,alignment: .topTrailing
        )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
