//
//  DictionaryViewModel.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class DictionaryViewModel: ObservableObject, ControlViewModelDelegate {
    
    // MARK: Properties
    
    let dictionaryManipulator: DictionaryManipulator
    @Published var control: ControlViewModel
    
    @Published var creationTime: TimeInterval = 0
    @Published var add1EntryTime: TimeInterval = 0
    @Published var add5EntriesTime: TimeInterval = 0
    @Published var add10EntriesTime: TimeInterval = 0
    @Published var remove1EntryTime: TimeInterval = 0
    @Published var remove5EntriesTime: TimeInterval = 0
    @Published var remove10EntriesTime: TimeInterval = 0
    @Published var lookup1EntryTime: TimeInterval = 0
    @Published var lookup10EntriesTime: TimeInterval = 0
    
    @Published var isSpinnerStartAnimation = false
    
    // MARK: Initialization
    
    init(dictionaryManipulator: DictionaryManipulator) {
        self.dictionaryManipulator = dictionaryManipulator
        self.control = ControlViewModel()
        self.control.delegate = self
    }
    
    // MARK: ControlViewModelDelegate
    
    func create(_ size: Int) {
        let creationTime = dictionaryManipulator.setupWithEntryCount(size)
        DispatchQueue.main.async {
            self.creationTime = creationTime
            if self.dictionaryManipulator.dictHasEntries() {
                self.control.isTestOnlyButtonEnabled = true
            }
        }
    }
    
    func test() {
        if self.dictionaryManipulator.dictHasEntries() {
            let add1EntryTime = dictionaryManipulator.add1Entry()
            let add5EntriesTime = dictionaryManipulator.add5Entries()
            let add10EntriesTime = dictionaryManipulator.add10Entries()
            let remove1EntryTime = dictionaryManipulator.remove1Entry()
            let remove5EntriesTime = dictionaryManipulator.remove5Entries()
            let remove10EntriesTime = dictionaryManipulator.remove10Entries()
            let lookup1EntryTime = dictionaryManipulator.lookup1EntryTime()
            let lookup10EntriesTime = dictionaryManipulator.lookup10EntriesTime()
            DispatchQueue.main.async {
                self.add1EntryTime = add1EntryTime
                self.add5EntriesTime = add5EntriesTime
                self.add10EntriesTime = add10EntriesTime
                self.remove1EntryTime = remove1EntryTime
                self.remove5EntriesTime = remove5EntriesTime
                self.remove10EntriesTime = remove10EntriesTime
                self.lookup1EntryTime = lookup1EntryTime
                self.lookup10EntriesTime = lookup10EntriesTime
            }
        } else {
            print("Dictionary not set up yet!")
        }
    }
}
