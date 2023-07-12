//
//  ContentView.swift
//  Mask
//
//  Created by Ganesh on 12/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rating:Int = 2
    var body: some View {
        ZStack{
           maskView
                .overlay(overlayView.mask(maskView))
        }
    }
    
    private var overlayView: some View{
        GeometryReader { geomtery in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(LinearGradient(colors: [Color.blue,Color.green], startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geomtery.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var maskView: some View{
        HStack{
            ForEach(1..<6){ index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
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
