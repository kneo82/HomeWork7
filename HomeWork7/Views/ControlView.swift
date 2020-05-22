//
//  ControlView.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct ControlView: View {
    @ObservedObject var viewModel: ControlViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0)  {
            Slider(value: $viewModel.numberOfItems, in: 1_000...10_000_000, step: 1)
                .disabled(!viewModel.isSliderEnabled)
                .padding(10)
            
            Text("\(Int(viewModel.numberOfItems))")
                .font(.title)
                .fontWeight(.medium)
            
            Button(action: {
                self.viewModel.createAndTest()
            }) {
                Text("Create And Test")
                    .font(.headline)
            }
            .disabled(!viewModel.isCreateAndTestButtonEnabled)
            
            Button(action: {
                self.viewModel.testOnly()
            }) {
                Text("Test Only")
                    .font(.headline)
            }
            .disabled(!viewModel.isTestOnlyButtonEnabled)
            
            
            Text("Result Times")
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(viewModel: ControlViewModel())
        
    }
}
