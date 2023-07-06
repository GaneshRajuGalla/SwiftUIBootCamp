//
//  ContentView.swift
//  DragGesture
//
//  Created by Ganesh on 07/07/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var offset:CGSize = .zero
    var scaleEffect:CGFloat{
        let max = UIScreen.main.bounds.width / 2
        let currentOffset = abs(offset.width)
        let percentage = currentOffset / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    var rotationEffect:Angle{
        let max = UIScreen.main.bounds.width / 2
        let currentOffset = offset.width
        let percentage = currentOffset / max
        let percentageDouble = Double(percentage)
        let maxAngle = 10.0
        return Angle(degrees: percentageDouble * maxAngle)
    }
    
    //MARK: - Body
    var body: some View {
        Image("Wallpapers")
            .resizable()
            .frame(width: 300,height: 500)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(30)
            .offset(offset)
            .scaleEffect(scaleEffect)
            .rotationEffect(rotationEffect)
            .shadow(color: .indigo,radius: 20)
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        withAnimation(.spring()){
                            offset = value.translation
                        }
                    }
                
                    .onEnded{ value in
                        withAnimation(.spring()){
                            offset = .zero
                        }
                    }
            )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
