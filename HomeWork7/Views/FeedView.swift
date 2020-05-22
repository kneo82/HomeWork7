//
//  FeedView.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var viewModel: FeedViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText, placeholder: "Search")
                List {
                    ForEach(viewModel.feedData) { item in
                        NavigationLink(destination: self.destination(name: item.name), label: {
                            HStack {
                                Text(item.name)
                                Spacer()
                                self.testResultView(name: item.name)
                            }
                        })
                            .listRowBackground(self.viewModel.testResult?[item.name] == nil
                                ? Color.clear
                                : Color.getColorOfPercent(self.viewModel.testResult![item.name]!))
                    }
                }
            }
            .navigationBarTitle("Feeds")
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewModel.startTest()
                }) {
                    Text("Test")
                }
            )
        }
    }
    
    private func destination(name: String) -> AnyView {
        switch name {
        case "Array":
            return AnyView(ArrayView())
        case "Set":
            return AnyView(SetView())
        case "Dictionary":
            return AnyView(DictionaryView())
        case "SuffixArray":
            return AnyView(SuffixArrayView())
        default:
            return AnyView(EmptyControllerView())
        }
    }
    
    private func testResultView(name: String) -> AnyView {
        if let testResult = self.viewModel.testResult?[name], let testTime = self.viewModel.testTime  {
            return AnyView(VStack {
                Text("Time Test:")
                Text("\(testResult * testTime, specifier: "%.4f") s")
            })
        } else {
            return AnyView(EmptyView())
        }
    }
    
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}


