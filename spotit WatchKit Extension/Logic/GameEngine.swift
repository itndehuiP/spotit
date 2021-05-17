//
//  GameEngine.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import Foundation

struct GameEngine {
    private let colors = StyleColor.allCases
    
    private let icons: [String] =
        [Icon.atom,
         Icon.bell,
         Icon.cloudHail,
         Icon.crown,
         Icon.drop,
         Icon.flame,
         Icon.gift,
         Icon.hammer,
         Icon.happyFace,
         Icon.heart,
         Icon.helm,
         Icon.house,
         Icon.leaf,
         Icon.light,
         Icon.moon,
         Icon.paperplane,
         Icon.snow,
         Icon.sparkle,
         Icon.star,
         Icon.sun,
         Icon.turtle]
    
    func createOptions() -> [OptionModel] {
        var optionSet: Set<OptionModel> = []
        while optionSet.count < 4 {
            guard let newOption = createOption() else {
                continue
            }
            if !optionSet.contains(newOption) {
                print(newOption)
                optionSet.insert(newOption)
            }
        }
        return Array(optionSet)
    }
    
    private func createOption() -> OptionModel? {
        guard let iconIndex = getRandomIndex(topIndex: (icons.count - 1)),
              let backColorIndex = getRandomIndex(topIndex: (colors.count - 1)),
              let borderColorIndex = getRandomIndex(topIndex: (colors.count - 1)) else {
            return nil
        }
        return OptionModel(icon: icons[iconIndex],
                    backColor: colors[backColorIndex],
                    borderColor: colors[borderColorIndex])
    }
    
    private func getRandomIndex(topIndex: Int) -> Int? {
        guard topIndex >= 0 else {
            return nil
        }
        return Int.random(in: 0...topIndex)
    }
}
