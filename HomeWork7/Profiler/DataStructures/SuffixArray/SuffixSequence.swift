//
//  SuffixSequence.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

public struct SuffixIterator: IteratorProtocol {
    let string: String
    var offset: String.Index
    
    public init(string: String) {
        self.string = string
        offset = string.endIndex
    }
    
    public mutating func next() -> Substring? {
        guard offset > string.startIndex else { return nil}
        offset = string.index(before: offset)
        return string[offset..<string.endIndex]
    }
}

public struct SuffixSequence: Sequence {
    let string: String
    
    public func makeIterator() -> SuffixIterator {
        return SuffixIterator(string: string)
    }
}
