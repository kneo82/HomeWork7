//
//  SettingViewModelDelegate.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

protocol ControlViewModelDelegate: class {
    var isSpinnerStartAnimation: Bool {get set}
    
    func create(_ size: Int);
    func test();
}
