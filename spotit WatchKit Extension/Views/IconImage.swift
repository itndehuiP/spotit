//
//  IconImage.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import SwiftUI

struct IconImage: View {
    let systemIcon: String
    let iconColor: HighColor
    let backColor: BackColor
    let borderBolor: HighColor
    let width: CGFloat
    
    var body: some View {
        ZStack {
            imageView
        }
        .padding()
        .overlay(backCircleView)
        .background(circleView)
    }
}

extension IconImage {
    private var imageView: some View {
        Image(systemName: systemIcon)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: width, height: width, alignment: .center)
        .foregroundColor(color(iconColor.rawValue))
    }
    
    private var circleView: some View {
        Circle()
        .foregroundColor(color(backColor.rawValue))
    }
    
    private var backCircleView: some View {
        Circle()
        .stroke(lineWidth: 2)
            .foregroundColor(color(borderBolor.rawValue))
    }
    
    private func color(_ color: String) -> Color {
        Color(color)
    }
}
struct IconImage_Previews: PreviewProvider {
    static var previews: some View {
        IconImage(systemIcon: Icon.cloudHail,
                  iconColor: HighColor.one,
                  backColor: BackColor.one,
                  borderBolor: HighColor.three,
                  width: 50)
    }
}
