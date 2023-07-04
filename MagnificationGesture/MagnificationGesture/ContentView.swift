//
//  ContentView.swift
//  MagnificationGesture
//
//  Created by Ganesh on 05/07/23.
//

import SwiftUI



struct ContentView: View {
    @State private var currentvalue: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                Image("SwiftUI")
                    .resizable()
                    .frame(width: 32,height: 32)
                    .clipShape(Circle())
                    .background(Circle().stroke(.red))
                VStack(alignment: .leading) {
                    Text("SwiftUI")
                        .font(.caption2)
                        .bold()
                    Text("Better apps. Less code.")
                        .font(.caption2)
                }
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Image("swiftUIBanner")
                .resizable()
                .scaleEffect(1 + currentvalue)
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .gesture(
                    MagnificationGesture()
                        .onChanged{ value in
                            currentvalue = value - 1
                        }
                    
                        .onEnded{_ in
                            withAnimation(.spring()){
                                currentvalue = 0
                            }
                        }
                )
            
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            Text("SwiftUI is super powerfull framework")
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


   
