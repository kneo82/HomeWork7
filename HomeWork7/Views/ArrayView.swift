//
//  ArrayView.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct ArrayView: View {
    @EnvironmentObject var viewModel: ArrayViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10.0) {
                ControlView(viewModel: viewModel.control)
                
                List {
                    RowView(name: "Array Creation:", value: $viewModel.creationTime)
                    RowView(name: "Insert At Index 0:", value: $viewModel.insertAt0Time)
                    RowView(name: "Insert In Middle:", value: $viewModel.insertAtMidTime)
                    RowView(name: "Insert At End:", value: $viewModel.insertAtEndTime)
                    RowView(name: "Remove From Index 0:", value: $viewModel.removeAt0Time)
                    RowView(name: "Remove From Middle:", value: $viewModel.removeAtMidTime)
                    RowView(name: "Remove From End:", value: $viewModel.removeAtEndTime)
                    RowView(name: "Lookup By Index:", value: $viewModel.lookupByIndexTime)
                    RowView(name: "Lookup By Object:", value: $viewModel.lookupByObjectTime)
                }
            }
            
            ActivityIndicator(isAnimating: $viewModel.isSpinnerStartAnimation, style: .large)
        }
    }
}

struct ArrayView_Previews: PreviewProvider {
    static var previews: some View {
        ArrayView()
            .environmentObject(ArrayViewModel(arrayManipulator: SwiftArrayManipulator()))
    }
}
