//
//  ContentView.swift
//  RotationGesture
//
//  Created by Ganesh on 05/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var angle:Angle = Angle(degrees: 0)
    var body: some View {
        Image("ball")
            .resizable()
            .aspectRatio(contentMode:.fill)
            .frame(width: 300,height: 300)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged{ value in
                        angle = value
                    }
                    .onEnded{_ in
                        withAnimation(.spring()){
                            angle = Angle(degrees: 0)
                        }
                    })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
