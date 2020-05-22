//
//  ArrayViewModel.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class ArrayViewModel: ObservableObject, ControlViewModelDelegate {
    
    // MARK: Properties
    
    let arrayManipulator: ArrayManipulator
    @Published var control: ControlViewModel
    
    @Published var creationTime: TimeInterval = 0
    @Published var insertAt0Time: TimeInterval = 0
    @Published var insertAtMidTime: TimeInterval = 0
    @Published var insertAtEndTime: TimeInterval = 0
    @Published var removeAt0Time: TimeInterval = 0
    @Published var removeAtMidTime: TimeInterval = 0
    @Published var removeAtEndTime: TimeInterval = 0
    @Published var lookupByIndexTime: TimeInterval = 0
    @Published var lookupByObjectTime: TimeInterval = 0
    
    @Published var isSpinnerStartAnimation = false
    
    // MARK: Initialization
    
    init(arrayManipulator: ArrayManipulator) {
        self.arrayManipulator = arrayManipulator
        self.control = ControlViewModel()
        self.control.delegate = self
    }
    
    // MARK: ControlViewModelDelegate
    
    func create(_ size: Int) {
        let creationTime = arrayManipulator.setupWithObjectCount(size)
        DispatchQueue.main.async {
            self.creationTime = creationTime
            if self.arrayManipulator.arrayHasObjects() {
                self.control.isTestOnlyButtonEnabled = true
            }
        }
    }
    
    func test() {
        if arrayManipulator.arrayHasObjects() {
            let insertAt0Time = arrayManipulator.insertNewObjectAtBeginning()
            let insertAtMidTime = arrayManipulator.insertNewObjectInMiddle()
            let insertAtEndTime = arrayManipulator.addNewObjectAtEnd()
            let removeAt0Time = arrayManipulator.removeFirstObject()
            let removeAtMidTime = arrayManipulator.removeMiddleObject()
            let removeAtEndTime = arrayManipulator.removeLastObject()
            let lookupByIndexTime = arrayManipulator.lookupByIndex()
            let lookupByObjectTime = arrayManipulator.lookupByObject()
            DispatchQueue.main.async {
                self.insertAt0Time = insertAt0Time
                self.insertAtMidTime = insertAtMidTime
                self.insertAtEndTime = insertAtEndTime
                self.removeAt0Time = removeAt0Time
                self.removeAtMidTime = removeAtMidTime
                self.removeAtEndTime = removeAtEndTime
                self.lookupByIndexTime = lookupByIndexTime
                self.lookupByObjectTime = lookupByObjectTime
            }
        } else {
            print("Array not set up yet!")
        }
    }
}
