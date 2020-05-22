//
//  SuffixArrayManipulator.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

protocol SuffixArrayManipulator {
    func arrayHasObjects() -> Bool
    func setupWithSize(_ size: Int) -> TimeInterval
    func setupWithObjects(items: [String]) -> TimeInterval
    func searchRandomWords(count: Int, wordLength: Int) -> TimeInterval
}
