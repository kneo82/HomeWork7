//
//  SwiftSuffixArrayManipulator.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

public class SwiftSuffixArrayManipulator: SuffixArrayManipulator {

    private var dataSuffixArray:[(suffix: String, name: String)] = []
    private var randomSuffixArray:[(suffix: String, name: String)] = []
    
    public func arrayHasObjects() -> Bool {
        return randomSuffixArray.count > 0
    }
    
    public func setupWithSize(_ size: Int) -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.randomSuffixArray = self.createSuffixArray(items: self.randomizeWords(count: size, wordLength: 10 ))
        }
    }
    
    public func setupWithObjects(items: [String]) -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.dataSuffixArray = self.createSuffixArray(items: items)
        }
    }
    
    public func searchRandomWords(count: Int, wordLength: Int) -> TimeInterval {
        return Profiler.runClosureForTime() {
            let words = self.randomizeWords(count: count, wordLength: wordLength)
            for word in words {
                _ = SubSequenceSearch.search(query: word, suffixArray: self.dataSuffixArray)
            }
        }
    }
    
    // MARK: Private
    
    private func createSuffixArray(items: [String]) -> [(suffix: String, name: String)] {
        var suffixArray:[(suffix: String, name: String)] = []
        for word in items {
            let sequence = SuffixSequence(string: word)
            for suffix in sequence {
                suffixArray.append((suffix: String(suffix), name: word))
            }
        }
        
        suffixArray.sort { $0.suffix < $1.suffix }
        
        return suffixArray
    }
    
    private func randomizeWords(count: Int, wordLength: Int) -> [String] {
        var words: [String] =  []
        let stringGenerator = StringGenerator()
        for _ in 0..<count {
            words.append(stringGenerator.generateRandomString(wordLength))
        }
        
        return words
    }
}
