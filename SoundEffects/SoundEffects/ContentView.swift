//
//  ContentView.swift
//  SoundEffects
//
//  Created by Ganesh on 13/07/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(SoundOptions.allCases,id: \.self){ option in
                SoundView(options: option) {
                    SoundManager.instance.playSound(sound: option)
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
