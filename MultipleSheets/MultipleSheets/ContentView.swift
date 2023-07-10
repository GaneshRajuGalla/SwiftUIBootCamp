//
//  ContentView.swift
//  MultipleSheets
//
//  Created by Ganesh on 10/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sampleModel:SampleModel? = nil
    
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 10){
                ForEach(0..<50){ index in
                    let randomColor = Color(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1))
                    Text("Sheet: \(index)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(randomColor.gradient)
                        .cornerRadius(10)
                        .onTapGesture {
                            sampleModel = SampleModel(title: "\(index)", color:randomColor)
                        }
                }
            }
            .sheet(item: $sampleModel) { model in
                sheetView(sampleModel: model)
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct sheetView: View{
    let sampleModel:SampleModel
    var body: some View{
        ZStack{
            sampleModel.color
            Text(sampleModel.title)
                .font(.title)
                .bold()
        }
    }
}


struct SampleModel:Identifiable{
    let id = UUID().uuidString
    let title:String
    let color:Color
}
