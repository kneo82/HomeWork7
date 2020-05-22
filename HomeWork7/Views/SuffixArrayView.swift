//
//  SuffixArrayView.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct SuffixArrayView: View {
    @EnvironmentObject var viewModel: SuffixArrayViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10.0) {
                ControlView(viewModel: viewModel.control)
                
                List {
                    RowView(name: "Array Creation:", value: $viewModel.creationWithSizeTime)
                    RowView(name: "Creation with AlgoProvider:", value: $viewModel.setupWithObjectsTime)
                    RowView(name: "Search Word Length 1:", value: $viewModel.searchRandomWordsLength1Time)
                    RowView(name: "Search Word Length 3:", value: $viewModel.searchRandomWordsLength3Time)
                    RowView(name: "Search Word Length 5:", value: $viewModel.searchRandomWordsLength5Time)
                }
            }
            
            ActivityIndicator(isAnimating: $viewModel.isSpinnerStartAnimation, style: .large)
        }
    }
}

struct SuffixArrayView_Previews: PreviewProvider {
    static var previews: some View {
        SuffixArrayView()
        .environmentObject(SuffixArrayViewModel(suffixArrayManipulator: SwiftSuffixArrayManipulator()))
    }
}
