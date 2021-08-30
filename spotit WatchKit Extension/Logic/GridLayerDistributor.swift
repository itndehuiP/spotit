//
//  GridLayerDistributor.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 19/06/21.
//

import Foundation
import SwiftUI

struct GridLayerDistributor {
    let optionsCount: Int
    let closestEven: Int
    
    init?(optionsCount: Int) {
        guard optionsCount >= 1 else { return nil}
        self.optionsCount = optionsCount
        closestEven = GridLayerDistributor.findClosestEven(to: optionsCount)
    }
    
    init() {
        optionsCount = 1
        closestEven = 1
    }

    func getLayerDistribution(totalSize: CGSize) -> LayerDistributionInfo {
        var columns = 1
        for i in
        let factors = getFactors()
        guard var optimalPair = factors.first else {
            if totalSize.width >= totalSize.height {
                let width = totalSize.width / CGFloat(optionsCount)
                return LayerDistributionInfo(eachSize: CGSize(width: width, height: totalSize.height), columns: optionsCount)
            } else {
                let width = totalSize.width / CGFloat(optionsCount)
                return LayerDistributionInfo(eachSize: CGSize(width: width, height: totalSize.height), columns: optionsCount)
            }
        }
        let sizeRatio = totalSize.width / totalSize.height
        for pair in factors {
            let optimalRatioDifference = abs(sizeRatio - CGFloat(optimalPair.factorA / optimalPair.factorB))
            let currentRatioDifference = abs(sizeRatio - CGFloat(pair.factorA / pair.factorB))
            if optimalRatioDifference > currentRatioDifference {
                optimalPair = pair
            }
        }
        let eachSize = CGSize(width: totalSize.width / CGFloat(optimalPair.factorB), height: totalSize.height / CGFloat(optimalPair.factorB))
        return LayerDistributionInfo(eachSize: eachSize, columns: optimalPair.factorA)
    }
    
    private func getFactors() -> [FactorPair] {
        var factors: [FactorPair] = []
        for index in stride(from: closestEven, to: 1, by: -1) {
            if closestEven % index == 0 {
                let factorB = closestEven / index
                factors.append(FactorPair(factorA: index, factorB: factorB))
            }
        }
        return factors
    }
    
    private func findDistribution(for size: CGSize) -> LayerDistributionInfo {
        let width = size.width
        let height = size.height
        if width > height {
            for 
        } else {
            
        }
    }
    
    static func findClosestEven(to number: Int) -> Int {
        var current = number
        while !(current % 2 == 0) {
           current += 1
        }
        return current
    }
}
