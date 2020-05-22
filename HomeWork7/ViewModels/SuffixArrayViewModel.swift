//
//  SuffixArrayViewModel.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class SuffixArrayViewModel: ObservableObject, ControlViewModelDelegate {
    
    // MARK: Properties
    
    let suffixArrayManipulator: SuffixArrayManipulator
    @Published var control: ControlViewModel
    
    @Published var creationWithSizeTime: TimeInterval = 0
    @Published var setupWithObjectsTime: TimeInterval = 0
    @Published var searchRandomWordsLength1Time: TimeInterval = 0
    @Published var searchRandomWordsLength3Time: TimeInterval = 0
    @Published var searchRandomWordsLength5Time: TimeInterval = 0
    
    @Published var isSpinnerStartAnimation = false
    
    // MARK: Initialization
    
    init(suffixArrayManipulator: SuffixArrayManipulator) {
        self.suffixArrayManipulator = suffixArrayManipulator
        self.control = ControlViewModel()
        self.control.delegate = self
    }
    
    // MARK: ControlViewModelDelegate
    
    func create(_ size: Int) {
        let creationWithSizeTime = suffixArrayManipulator.setupWithSize(size)
        let setupWithObjectsTime = suffixArrayManipulator.setupWithObjects(items:Services.algoProvider.all)
        DispatchQueue.main.async {
            self.creationWithSizeTime = creationWithSizeTime
            self.setupWithObjectsTime = setupWithObjectsTime
            if self.suffixArrayManipulator.arrayHasObjects() {
                self.control.isTestOnlyButtonEnabled = true
            }
        }
    }
    
    func test() {
        if suffixArrayManipulator.arrayHasObjects() {
            
            let searchRandomWordsLength1Time = suffixArrayManipulator.searchRandomWords(count: 10, wordLength: 1)
            let searchRandomWordsLength3Time = suffixArrayManipulator.searchRandomWords(count: 10, wordLength: 3)
            let searchRandomWordsLength5Time = suffixArrayManipulator.searchRandomWords(count: 10, wordLength: 5)
           
            DispatchQueue.main.async {
                self.searchRandomWordsLength1Time = searchRandomWordsLength1Time
                self.searchRandomWordsLength3Time = searchRandomWordsLength3Time
                self.searchRandomWordsLength5Time = searchRandomWordsLength5Time
            }
        } else {
            print("Array not set up yet!")
        }
    }
}
