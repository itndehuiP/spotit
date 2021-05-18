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
            ZStack(alignment: .center) {
                topRow(geoHeight: geo.size.height)
                centerView(geoHeight: geo.size.height)
                bottomRow(geoHeight: geo.size.height)
            }
            .padding()
            .frame(maxHeight: .infinity)
        }
    }
}

extension GameView {
    private func centerView(geoHeight: CGFloat) -> some View {
        Group {
            if let option = logic.correctOption {
                OptionButton(option: option, width: optionSize(big: true, geoHeight: geoHeight))
            }
        }
    }
    
    private func topRow(geoHeight: CGFloat) -> some View {
        VStack {
            ButtonsRow(leftOption: logic.option(for: 0),
                       rightOption: logic.option(for: 1),
                       optionWidth: optionSize(big: false, geoHeight: geoHeight))
            Spacer()
        }
    }
    
    private func bottomRow(geoHeight: CGFloat) -> some View {
        VStack {
            Spacer()
            ButtonsRow(leftOption: logic.option(for: 2),
                       rightOption: logic.option(for: 3),
                       optionWidth: optionSize(big: false, geoHeight: geoHeight))
        }
    }
    
    private func optionSize(big: Bool, geoHeight: CGFloat) -> CGFloat {
        let unit = geoHeight / 10
        if big {
            return unit * 4
        }
        return unit * 2
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
