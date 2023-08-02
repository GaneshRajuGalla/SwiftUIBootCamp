//
//  ContentView.swift
//  Hashable
//
//  Created by Ganesh on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    
    let data1:[MyCustomModel1] = [
        MyCustomModel1(title: "ONE"),
        MyCustomModel1(title: "TWO"),
        MyCustomModel1(title: "THREE"),
        MyCustomModel1(title: "FOUR"),
        MyCustomModel1(title: "FIVE")
    ]
    
    let data2:[MyCustomModel2] = [
        MyCustomModel2(title: "ONE"),
        MyCustomModel2(title: "TWO"),
        MyCustomModel2(title: "THREE"),
        MyCustomModel2(title: "FOUR"),
        MyCustomModel2(title: "FIVE")
    ]
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 40) {
                ForEach(data1, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
                
                ForEach(data2) { item in
                    Text(item.title)
                        .font(.headline)
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


struct MyCustomModel1:Hashable{
    let title:String
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct MyCustomModel2:Identifiable{
    let id = UUID().uuidString
    let title:String
}
