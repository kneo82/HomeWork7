//
//  SubSequenceSearch.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

struct SubSequenceSearch {
    
    static public func search(query: String, suffixArray: [(suffix: String, name: String)]) -> [String] {
        guard let index = binarySearch(query: query, suffixArray: suffixArray) else {
            return[String]()
        }
        
        let queryPrefix = query.prefix(1)
        var result = Set<String>()
    
        for index in (0..<index).reversed() {
            if queryPrefix != suffixArray[index].suffix.prefix(1) {
                break
            }
            
            if(suffixArray[index].suffix == query) {
                result.insert(suffixArray[index].name)
            }
        }
        
        for index in index..<suffixArray.count {
            if queryPrefix != suffixArray[index].suffix.prefix(1) {
                break
            }
            
            if(suffixArray[index].suffix == query) {
                result.insert(suffixArray[index].name)
            }
        }

        return Array(result)
    }
    
    static private func binarySearch(query: String, suffixArray: [(suffix: String, name: String)]) -> Int? {
        var lowerBound = 0
        var upperBound = suffixArray.count
        
        let queryPrefix = query.prefix(1)
        
        while lowerBound < upperBound {
            let midIndex = lowerBound + (upperBound - lowerBound) / 2
            let pref = suffixArray[midIndex].suffix.prefix(1)
            
            if pref == queryPrefix {
                return midIndex
            } else if pref < queryPrefix {
                lowerBound = midIndex + 1
            } else {
                upperBound = midIndex
            }
        }
        return nil
    }
}
