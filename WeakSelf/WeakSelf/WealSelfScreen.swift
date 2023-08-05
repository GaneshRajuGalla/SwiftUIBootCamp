//
//  WealSelfScreen.swift
//  WeakSelf
//
//  Created by Ganesh on 05/08/23.
//

import SwiftUI

struct WealSelfScreen: View {
    
    //MARK: - Properties
    @StateObject var viewModel =  WeakSelfViewModel()
    
    
    //MARK: - Body
    var body: some View {
        VStack{
            Text("Second Scree")
                .font(.largeTitle)
                .foregroundColor(.orange)
            if let data = viewModel.data{
                Text(data)
            }
        }
    }
}

struct WealSelfScreen_Previews: PreviewProvider {
    static var previews: some View {
        WealSelfScreen()
    }
}
