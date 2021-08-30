//
//  GameProgressView.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 19/06/21.
//

import SwiftUI

struct GameProgressView: View {
    let progress: Double
    
    var body: some View {
        Circle()
        .trim(from: 0, to: CGFloat(progress))
        .stroke(style: lineStyle)
        .rotation(.degrees(-90))
    }
    
    private var lineStyle: StrokeStyle {
        StrokeStyle(lineWidth: 6,
                    lineCap: .round,
                    lineJoin: .round)
    }
}

struct GameProgressView_Previews: PreviewProvider {
    static var previews: some View {
        GameProgressView(progress: 0.99)
    }
}
