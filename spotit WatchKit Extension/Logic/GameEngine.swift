//
//  GameEngine.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import Foundation

struct GameEngine {
    private let highColors = HighColor.allCases
    private let backColors = BackColor.allCases
    
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
                optionSet.insert(newOption)
            }
        }
        return Array(optionSet)
    }
    
    private func createOption() -> OptionModel? {
        let colorsTopIndex = highColors.count - 1
        let backColorsTopIndex = backColors.count - 1
        guard let backColorIndex = getRandomIndex(topIndex: backColorsTopIndex),
              let iconColorIndex = getRandomIndex(topIndex: colorsTopIndex),
              let iconIndex = getRandomIndex(topIndex: (icons.count - 1)),
              let borderColorIndex = getRandomIndex(topIndex: colorsTopIndex) else {
            return nil
        }
        return OptionModel(icon: icons[iconIndex],
                    iconColor: highColors[iconColorIndex],
                    backColor: backColors[backColorIndex],
                    borderColor: highColors[borderColorIndex])
    }
    
    private func getRandomIndex(topIndex: Int) -> Int? {
        guard topIndex >= 0 else {
            return nil
        }
        let range = 0...topIndex
        return Int.random(in: range)
    }
}
