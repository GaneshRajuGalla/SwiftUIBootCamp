//
//  ContentView.swift
//  ScrollViewReader
//
//  Created by Ganesh on 08/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textFieldText:String = ""
    @State private var scrollIndex:Int = 0
    var body: some View {
        VStack(spacing: 10){
            TextField("Enter index", text: $textFieldText)
                .frame(height: 45)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button {
                withAnimation(.spring()){
                    if let index = Int(textFieldText){
                        scrollIndex = index
                    }
                }
            } label: {
                Text("SCROLL NOW")
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .background(.gray)
                    .cornerRadius(5)
            }
            
            ScrollView{
                ScrollViewReader { proxy in
                    ForEach(0..<100){ index in
                        Text("This is Card \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1)).gradient)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollIndex) { newValue in
                        withAnimation(.spring()){
                            proxy.scrollTo(newValue,anchor: .center)
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
