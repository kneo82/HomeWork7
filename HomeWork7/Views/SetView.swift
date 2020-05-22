//
//  SetView.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct SetView: View {
    @EnvironmentObject var viewModel: SetViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10.0) {
                ControlView(viewModel: viewModel.control)

                List {
                    RowView(name: "Set Creation:", value: $viewModel.creationTime)
                    RowView(name: "Add 1 Object:", value: $viewModel.add1ObjectTime)
                    RowView(name: "Add 5 Objects:", value: $viewModel.add5ObjectsTime)
                    RowView(name: "Add 10 Objects:", value: $viewModel.add10ObjectsTime)
                    RowView(name: "Remove 1 Object:", value: $viewModel.remove1ObjectTime)
                    RowView(name: "Remove 5 Objects:", value: $viewModel.remove5ObjectsTime)
                    RowView(name: "Remove 10 Objects:", value: $viewModel.remove10ObjectsTime)
                    RowView(name: "Lookup 1 Object:", value: $viewModel.lookup1ObjectTime)
                    RowView(name: "Lookup 10 Objects:", value: $viewModel.lookup10ObjectsTime)
                }
            }
            
            ActivityIndicator(isAnimating: $viewModel.isSpinnerStartAnimation, style: .large)
        }
    }
}

struct SetView_Previews: PreviewProvider {
    static var previews: some View {
        SetView()
    }
}
