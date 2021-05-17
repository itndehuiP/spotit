//
//  IconImage.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import SwiftUI

struct IconImage: View {
    let systemIcon: String
    let backColor: StyleColor
    let borderBolor: StyleColor
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
    }
    
    private var circleView: some View {
        Circle()
            .foregroundColor(Color(backColor.rawValue))
    }
    
    private var backCircleView: some View {
        Circle()
            .stroke(lineWidth: 2)
            .foregroundColor(Color(borderBolor.rawValue))
    }
}
struct IconImage_Previews: PreviewProvider {
    static var previews: some View {
        IconImage(systemIcon: Icon.cloudHail,
                  backColor: .four,
                  borderBolor: .three,
                  width: 50)
    }
}
