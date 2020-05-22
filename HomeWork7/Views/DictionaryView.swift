//
//  DictionaryView.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct DictionaryView: View {
    @EnvironmentObject var viewModel: DictionaryViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10.0) {
                ControlView(viewModel: viewModel.control)

                List {
                    RowView(name: "Dictionary Creation:", value: $viewModel.creationTime)
                    RowView(name: "Add 1 Entry:", value: $viewModel.add1EntryTime)
                    RowView(name: "Add 5 Entries:", value: $viewModel.add5EntriesTime)
                    RowView(name: "Add 10 Entries:", value: $viewModel.add10EntriesTime)
                    RowView(name: "Remove 1 Entry:", value: $viewModel.remove1EntryTime)
                    RowView(name: "Remove 5 Entries:", value: $viewModel.remove5EntriesTime)
                    RowView(name: "Remove 10 Entries:", value: $viewModel.remove10EntriesTime)
                    RowView(name: "Lookup 1 Entry:", value: $viewModel.lookup1EntryTime)
                    RowView(name: "Lookup 10 Entries:", value: $viewModel.lookup10EntriesTime)
                }
            }
            
            ActivityIndicator(isAnimating: $viewModel.isSpinnerStartAnimation, style: .large)
        }
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView()
    }
}
