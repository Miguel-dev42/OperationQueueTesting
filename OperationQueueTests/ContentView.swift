//
//  ContentView.swift
//  OperationQueueTests
//
//  Created by Miguel Figueroa on 4/14/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    
    var body: some View {
        VStack {
            Text(viewModel.text)
                .font(.largeTitle)
                .padding()
            
            Button("Connect") {
                viewModel.connectToDevice()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
    }
}
