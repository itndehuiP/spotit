//
//  GameLogic.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import Foundation
import os.log

class GameLogic: ObservableObject {
    @Published var options: [OptionModel] = []
    @Published var selectedOption: OptionModel?
    var correctIndex: Int?
    
    init() {
        newGame()
    }
    
    func option(for index: Int) -> OptionModel? {
        if options.validate(index: index) {
            return options[index]
        } else {
            return nil
        }
    }
    
    func newGame() {
        let engine = GameEngine()
        let options = engine.createOptions()
        guard options.count == 4 else {
            Logger().critical("GameLogic newGame options creation failed")
            return
        }
        selectedOption = nil
        correctIndex = Int.random(in: 0...3)
        self.options = options
    }
    
    var correctOption: OptionModel? {
        guard let correctIndex = correctIndex, options.validate(index: correctIndex) else {
            return nil
        }
        return options[correctIndex]
    }
}

