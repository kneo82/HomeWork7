//
//  SettingViewModel.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class ControlViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var numberOfItems: Double = 1000 {
        didSet {
            isTestOnlyButtonEnabled = false
        }
    }
    
    @Published var isTestOnlyButtonEnabled = false
    @Published var isCreateAndTestButtonEnabled = true
    @Published var isSliderEnabled = true
    
    weak var delegate: ControlViewModelDelegate?
    
    // MARK: Public
    
    func createAndTest() {
        setControlsEnabled(false)
        
        DispatchQueue.global(qos: .background).async {
            self.delegate?.create(Int(self.numberOfItems))
            self.delegate?.test()
            self.setControlsEnabled(true)
        }
    }
    
    func testOnly() {
        setControlsEnabled(false)
        
        DispatchQueue.global(qos: .background).async {
            self.delegate?.test()
            self.setControlsEnabled(true)
        }
    }
    
    // MARK: Private
    
    private func setControlsEnabled(_ enabled: Bool) {
        DispatchQueue.main.async {
            self.isTestOnlyButtonEnabled = enabled
            self.isCreateAndTestButtonEnabled = enabled
            self.isSliderEnabled = enabled
            self.delegate?.isSpinnerStartAnimation = !enabled
        }
    }
}
