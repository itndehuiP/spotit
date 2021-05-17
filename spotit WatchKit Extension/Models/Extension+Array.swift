//
//  Extension+Array.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import Foundation

extension Array {
    func validate(index: Int?) -> Bool {
        guard let index = index, index >= 0 && index < self.count else {
            return false
        }
        return true
    }
}
