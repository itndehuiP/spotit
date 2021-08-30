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
            switch  logic.state {
            case .presenting:
                centerView(geoHeight: geo.size.height)
            case .picking:
                PickingView(logic: logic, size: geo.size)
            case .finished:
                newGame
            case .newGame:
                newGame
            }
        }
    }
}

extension GameView {
    private var newGame: some View {
        ZStack(alignment: .center) {
            Button("New game") {
                logic.state = .presenting
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    private func centerView(geoHeight: CGFloat) -> some View {
        ZStack(alignment: .center) {
            if let option = logic.correctOption {
                OptionView(option: option, width: optionSize(big: true, geoHeight: geoHeight))
                .onAppear {
                    logic.runPresentation()
                    withAnimation(.linear(duration: 5)) {
                        logic.progress = 0.99
                    }
                }
                .padding()
                .overlay(GameProgressView(progress: logic.progress))
            }
        }
    }
    
    private func optionSize(big: Bool, geoHeight: CGFloat) -> CGFloat {
        if big {
            return (geoHeight / 5) * 3
        } else {
            return (geoHeight / 4)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
