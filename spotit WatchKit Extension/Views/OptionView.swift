//
//  IconButton.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import SwiftUI

struct OptionView: View {
    let option: OptionModel
    let width: CGFloat?
    
    var body: some View {
        IconImage(systemIcon: option.icon,
                  iconColor: option.iconColor,
                  backColor: option.backColor,
                  borderBolor: option.borderColor,
                  width: width)
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView(option: OptionModel(icon: Icon.cloudHail,
                                         iconColor: .four,
                                         backColor: .three,
                                         borderColor: .three),
                     width: 50)
    }
}
