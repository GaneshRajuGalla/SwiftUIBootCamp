//
//  SoundView.swift
//  SoundEffects
//
//  Created by Ganesh on 13/07/23.
//

import SwiftUI

struct SoundView: View {
    let options:SoundOptions
    let action:() -> Void
    var body: some View {
        Button(action: action) {
            Image(options.rawValue)
                .resizable()
                .frame(width: 50,height: 50)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fill)
                .padding()
                .shadow(radius: 10)
        }
    }
}

//struct SoundView_Previews: PreviewProvider {
//    static var previews: some View {
//        SoundView()
//    }
//}
