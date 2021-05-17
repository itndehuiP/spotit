//
//  GameView.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import SwiftUI

struct GameView: View {
    @StateObject private var logic = GameLogic()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                topRow(geoSize: geo.size.width)
                centerView(geoSize: geo.size.width)
                bottomRow(geoSize: geo.size.width)
            }
            .padding()
        }
    }
}

extension GameView {
    private func centerView(geoSize: CGFloat) -> some View {
        Group {
            if let option = logic.correctOption {
                OptionButton(option: option, width: geoSize / 4)
            }
        }
    }
    
    private func topRow(geoSize: CGFloat) -> some View {
        ButtonsRow(leftOption: logic.option(for: 0),
                   rightOption: logic.option(for: 1),
                   optionWidth: optionSize(geoWidth: geoSize))
    }
    
    private func bottomRow(geoSize: CGFloat) -> some View {
        ButtonsRow(leftOption: logic.option(for: 2),
                   rightOption: logic.option(for: 3),
                   optionWidth: optionSize(geoWidth: geoSize))
    }
    
    private func optionSize(geoWidth: CGFloat) -> CGFloat {
        geoWidth / 5
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
