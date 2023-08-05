//
//  ContentView.swift
//  Encodable
//
//  Created by Ganesh on 05/08/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @StateObject private var viewModel = ViewModel()
    
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 20){
            if let customer = viewModel.customer{
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
