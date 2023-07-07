//
//  ContentView.swift
//  GeometryReader
//
//  Created by Ganesh on 08/07/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack{
                ForEach(0..<14){ index in
                    GeometryReader{ geometry in
                        Image("\(index + 1)")
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .cornerRadius(20)
//                        RoundedRectangle(cornerRadius: 20)
                            //.fill(Color(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1)).gradient)
                            .rotation3DEffect(Angle(degrees: getGeomtery(geo: geometry) * 40), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width:300,height: 600)
                    .padding()
                }
            }
        }
    }
    
    private func getGeomtery(geo:GeometryProxy) -> Double{
        let max = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / max))
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
