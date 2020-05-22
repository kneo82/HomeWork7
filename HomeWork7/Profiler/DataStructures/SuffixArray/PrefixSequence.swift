//
//  PrefixSequence.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

public struct PrefixIterator: IteratorProtocol {
    let string: String
    var offset: String.Index
    public init(string: String) {
        self.string = string
        offset = string.startIndex
    }
    public mutating func next() -> Substring? {
        guard offset < string.endIndex else { return nil }
        offset = string.index(after: offset)
        return string[..<offset]
    }
}

public struct PrefixSequence: Sequence {
    let string: String
    public func makeIterator() -> PrefixIterator {
        return PrefixIterator(string: string)
    }
}
