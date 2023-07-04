//
//  ContentView.swift
//  LongPressGesture
//
//  Created by Ganesh on 04/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSuccess:Bool = false
    @State private var isCompleted:Bool = false
    var body: some View {
        VStack(spacing: 10){
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(.gray)
            
            HStack(spacing: 10){
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0,maximumDistance: 100){ isPressing in
                        if isPressing{
                            withAnimation(.easeInOut(duration: 1.0)){
                                isCompleted = true
                            }
                        }else{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                if !isPressing{
                                    withAnimation(.easeInOut){
                                        isCompleted = false
                                    }
                                }
                            })
                        }
                    }perform: {
                        withAnimation(.easeInOut){
                            isSuccess = true
                        }
                    }
                
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isCompleted = false
                        isSuccess = false
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
