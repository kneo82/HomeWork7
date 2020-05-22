//
//  SetViewModel.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class SetViewModel: ObservableObject, ControlViewModelDelegate {
    
    // MARK: Properties
    
    let setManipulator: SetManipulator
    @Published var control: ControlViewModel
    
    @Published var creationTime: TimeInterval = 0
    @Published var add1ObjectTime: TimeInterval = 0
    @Published var add5ObjectsTime: TimeInterval = 0
    @Published var add10ObjectsTime: TimeInterval = 0
    @Published var remove1ObjectTime: TimeInterval = 0
    @Published var remove5ObjectsTime: TimeInterval = 0
    @Published var remove10ObjectsTime: TimeInterval = 0
    @Published var lookup1ObjectTime: TimeInterval = 0
    @Published var lookup10ObjectsTime: TimeInterval = 0
    
    @Published var isSpinnerStartAnimation = false
    
    // MARK: Initialization
    
    init(setManipulator: SetManipulator) {
        self.setManipulator = setManipulator
        self.control = ControlViewModel()
        self.control.delegate = self
    }
    
    // MARK: ControlViewModelDelegate
    
    func create(_ size: Int) {
        let creationTime = setManipulator.setupWithObjectCount(size)
        DispatchQueue.main.async {
            self.creationTime = creationTime
            if self.setManipulator.setHasObjects() {
                self.control.isTestOnlyButtonEnabled = true
            }
        }
    }
    
    func test() {
        if setManipulator.setHasObjects() {
            let add1ObjectTime = setManipulator.add1Object()
            let add5ObjectsTime = setManipulator.add5Objects()
            let add10ObjectsTime = setManipulator.add10Objects()
            let remove1ObjectTime = setManipulator.remove1Object()
            let remove5ObjectsTime = setManipulator.remove5Objects()
            let remove10ObjectsTime = setManipulator.remove10Objects()
            let lookup1ObjectTime = setManipulator.lookup1Object()
            let lookup10ObjectsTime = setManipulator.lookup10Objects()
            DispatchQueue.main.async {
                self.add1ObjectTime = add1ObjectTime
                self.add5ObjectsTime = add5ObjectsTime
                self.add10ObjectsTime = add10ObjectsTime
                self.remove1ObjectTime = remove1ObjectTime
                self.remove5ObjectsTime = remove5ObjectsTime
                self.remove10ObjectsTime = remove10ObjectsTime
                self.lookup1ObjectTime = lookup1ObjectTime
                self.lookup10ObjectsTime = lookup10ObjectsTime
            }
        } else {
            print("Array not set up yet!")
        }
    }
}
