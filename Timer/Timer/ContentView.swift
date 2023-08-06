//
//  ContentView.swift
//  Timer
//
//  Created by Ganesh on 06/08/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var timeRemaining:String = ""
    let futureDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    @State private var count:Int = 1
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [Color.black,Color.gray], center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            VStack{
                Text(timeRemaining)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(1.0)
                TabView(selection: $count) {
                    Image("image-1")
                        .resizable()
                        .tag(1)
                    Image("image-2")
                        .resizable()
                        .tag(2)
                    Image("image-3")
                        .resizable()
                        .tag(3)
                    Image("image-4")
                        .resizable()
                        .tag(4)
                    Image("image-5")
                        .resizable()
                        .tag(5)
                }
                .frame(height: 250)
                .tabViewStyle(.page)
                HStack(spacing: 15){
                    Circle()
                        .offset(y: count == 1 ? -20 : 0)
                    Circle()
                        .offset(y: count == 2 ? -20 : 0)
                    Circle()
                        .offset(y: count == 3 ? -20 : 0)
                    Circle()
                        .offset(y: count == 4 ? -20 : 0)
                    Circle()
                        .offset(y: count == 5 ? -20 : 0)
                }
                .frame(width: 100)
                .foregroundColor(.gray)
            }
        }
        .onReceive(timer) { value in
            updateCurrentTime()
            withAnimation(.default){
                count = count == 5 ? 1 : count + 1
            }
        }
    }
    
    func updateCurrentTime(){
        let remaining = Calendar.current.dateComponents([.hour,.minute,.second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let seconds = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(seconds)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
